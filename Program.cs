using Microsoft.EntityFrameworkCore;
using System.Reflection;
using utma_academico_aspnetcore.Data;
using Microsoft.OpenApi.Models;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using utma_academico_aspnetcore.Services;
using System.Text.Json.Serialization;
using System.Linq;
using Microsoft.AspNetCore.Mvc;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers()
    .AddJsonOptions(options =>
    {
        // Evitar ciclos de referencia al serializar entidades con navegación (EF Core)
        options.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.IgnoreCycles;
        // Mantener nombres de propiedades tal cual (opcional)
        // options.JsonSerializerOptions.PropertyNamingPolicy = null;
        // Permitir comentarios y trailing commas en JSON
        options.JsonSerializerOptions.ReadCommentHandling = System.Text.Json.JsonCommentHandling.Skip;
        options.JsonSerializerOptions.AllowTrailingCommas = true;
    })
    .ConfigureApiBehaviorOptions(options =>
    {
        // Personalizar respuestas de validación
        options.InvalidModelStateResponseFactory = context =>
        {
            var errors = context.ModelState
                .Where(x => x.Value?.Errors.Count > 0)
                .ToDictionary(
                    kvp => kvp.Key,
                    kvp => kvp.Value?.Errors.Select(e => e.ErrorMessage).ToArray() ?? Array.Empty<string>()
                );

            return new BadRequestObjectResult(new
            {
                type = "https://tools.ietf.org/html/rfc9110#section-15.5.1",
                title = "One or more validation errors occurred.",
                status = 400,
                errors = errors,
                traceId = context.HttpContext.TraceIdentifier
            });
        };
    });
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(options =>
{
    // Include XML comments (from project settings GenerateDocumentationFile)
    var xmlFile = ($"{Assembly.GetExecutingAssembly().GetName().Name}.xml");
    var xmlPath = Path.Combine(AppContext.BaseDirectory, xmlFile);
    if (File.Exists(xmlPath))
    {
        options.IncludeXmlComments(xmlPath);
    }

    options.SwaggerDoc("v1", new() { Title = "Sistema de Gestión de Citas Médicas API", Version = "v1", Description = "API para gestión de citas médicas: pacientes, médicos, horarios y citas" });

    // JWT Bearer authorization in Swagger
    var securityScheme = new OpenApiSecurityScheme
    {
        Name = "Authorization",
        Description = "JWT Authorization header using the Bearer scheme. Enter 'Bearer {token}'",
        In = ParameterLocation.Header,
        Type = SecuritySchemeType.Http,
        Scheme = "bearer",
        BearerFormat = "JWT",
        Reference = new OpenApiReference
        {
            Type = ReferenceType.SecurityScheme,
            Id = "Bearer"
        }
    };

    options.AddSecurityDefinition("Bearer", securityScheme);
    options.AddSecurityRequirement(new OpenApiSecurityRequirement
    {
        { securityScheme, new string[] { } }
    });
});

// Configurar DbContext de EF Core para MySQL
// Se lee la cadena de conexión desde appsettings.Development.json o user-secrets
var connectionString = builder.Configuration.GetConnectionString("AcademicoDb")
                       ?? throw new InvalidOperationException("ConnectionString 'AcademicoDb' no configurada en user-secrets o appsettings");

builder.Services.AddDbContext<AcademicoDbContext>(options =>
{
    // ServerVersion.AutoDetect detecta la versión del servidor MySQL/MySQL-compatible
    options.UseMySql(connectionString, ServerVersion.AutoDetect(connectionString));
});

// JWT Authentication
var jwtKey = builder.Configuration["Jwt:Key"] 
             ?? throw new InvalidOperationException("Jwt:Key no configurada en user-secrets o appsettings");
var jwtIssuer = builder.Configuration["Jwt:Issuer"] ?? "UTMA";
var jwtAudience = builder.Configuration["Jwt:Audience"] ?? "UTMA";

builder.Services.AddAuthentication("Bearer")
    .AddJwtBearer(options =>
    {
        options.RequireHttpsMetadata = false;
        options.SaveToken = true;
        options.TokenValidationParameters = new TokenValidationParameters
        {
            ValidateIssuerSigningKey = true,
            IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtKey)),
            ValidateIssuer = true,
            ValidIssuer = jwtIssuer,
            ValidateAudience = true,
            ValidAudience = jwtAudience,
            ValidateLifetime = true,
            ClockSkew = TimeSpan.Zero,
            RoleClaimType = "http://schemas.microsoft.com/ws/2008/06/identity/claims/role"
        };
    });

// Configurar autorización por roles
builder.Services.AddAuthorization(options =>
{
    options.AddPolicy("AdminOnly", policy => policy.RequireRole("Administrador"));
    options.AddPolicy("MedicoOrAdmin", policy => policy.RequireRole("Administrador", "Médico"));
});

// Registrar servicios
builder.Services.AddScoped<JwtService>();
builder.Services.AddScoped<CitaService>();
builder.Services.AddScoped<PacienteService>();
builder.Services.AddScoped<MedicoService>();
builder.Services.AddScoped<HorarioService>();

var app = builder.Build();

// Configure the HTTP request pipeline.
app.UseMiddleware<utma_academico_aspnetcore.Middleware.ErrorHandlingMiddleware>();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI(options =>
    {
        options.SwaggerEndpoint("/swagger/v1/swagger.json", "Sistema de Gestión de Citas Médicas API v1");
        options.RoutePrefix = "swagger"; // Swagger UI en /swagger
    });
}

app.UseHttpsRedirection();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

app.Run();

// Partial Program class to enable WebApplicationFactory integration tests
public partial class Program { }
