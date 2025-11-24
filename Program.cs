using Microsoft.EntityFrameworkCore;
using System.Reflection;
using utma_academico_aspnetcore.Data;
using Microsoft.OpenApi.Models;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using utma_academico_aspnetcore.Services;
using System.Text.Json.Serialization;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers()
    .AddJsonOptions(options =>
    {
        // Evitar ciclos de referencia al serializar entidades con navegación (EF Core)
        options.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.IgnoreCycles;
        // Mantener nombres de propiedades tal cual (opcional)
        // options.JsonSerializerOptions.PropertyNamingPolicy = null;
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

    options.SwaggerDoc("v1", new() { Title = "UTMA Académico API", Version = "v1", Description = "API para seguimiento académico: calificaciones y asistencias" });

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
// Se lee la cadena de conexión desde appsettings.json (ConnectionStrings:AcademicoDb)
var connectionString = builder.Configuration.GetConnectionString("AcademicoDb")
                       ?? "Server=localhost;Database=db_sys_universities;User=root;Password=utma2025;";

builder.Services.AddDbContext<AcademicoDbContext>(options =>
{
    // ServerVersion.AutoDetect detecta la versión del servidor MySQL/MySQL-compatible
    options.UseMySql(connectionString, ServerVersion.AutoDetect(connectionString));
});

// JWT Authentication
var jwtKey = builder.Configuration["Jwt:Key"] ?? "VerySecret_SymmetricKey_ChangeThisInProduction_UTMA2025";
var jwtIssuer = builder.Configuration["Jwt:Issuer"] ?? "utma";
var jwtAudience = builder.Configuration["Jwt:Audience"] ?? "utma_users";

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
            ClockSkew = TimeSpan.Zero
        };
    });

// Registrar servicio de generación de tokens
builder.Services.AddScoped<JwtService>();

var app = builder.Build();

// Configure the HTTP request pipeline.
app.UseMiddleware<utma_academico_aspnetcore.Middleware.ErrorHandlingMiddleware>();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI(options =>
    {
        options.SwaggerEndpoint("/swagger/v1/swagger.json", "UTMA Académico API v1");
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
