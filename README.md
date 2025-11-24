/*
  Desarrollador: Ingeniero en Telemática
  Egresado de: Universidad de Colima
  Nombre: Jorge Luis Vargas Mancilla
*/

# utma-academico-aspnetcore - Guía para alumnos

Este README explica de forma sencilla y paso a paso cómo se generó este proyecto ASP.NET Core Web API y describe las partes importantes del código. Está pensado para que cualquier alumno pueda replicar el proceso y entender lo que hace cada archivo principal.

---

## 1) Cómo generar el proyecto (paso a paso, estilo Windows / Visual Studio)

1. Abrir Visual Studio.
2. Archivo ? Nuevo ? Proyecto.
3. Buscar y seleccionar `ASP.NET Core Web API` y hacer clic en `Siguiente`.
4. Asignar un nombre al proyecto (por ejemplo `utma-academico-aspnetcore`) y la ubicación. `Crear`.
5. En la ventana de configuración del proyecto:
   - Seleccionar el `Framework` `.NET 8`.
   - Mantener `Authentication Type` en `None` (vamos a añadir JWT manualmente).
   - Desactivar `Enable OpenAPI Support` si quieres, pero en este proyecto usamos Swagger así que puedes dejarlo activado.
6. Crear el proyecto. Visual Studio generará la estructura básica.

Dependencias que agregamos (desde Package Manager o `dotnet add package`):
- `Microsoft.EntityFrameworkCore` (EF Core)
- `Pomelo.EntityFrameworkCore.MySql` (provider MySQL)
- `Microsoft.AspNetCore.Authentication.JwtBearer` (JWT auth)
- `Swashbuckle.AspNetCore` (Swagger)

En la terminal (ejemplo):
- dotnet add package Pomelo.EntityFrameworkCore.MySql
- dotnet add package Microsoft.AspNetCore.Authentication.JwtBearer
- dotnet add package Swashbuckle.AspNetCore

---

## 2) Estructura principal del proyecto

- `Program.cs` — configuración de la aplicación, DI, EF Core, JWT y Swagger.
- `Controllers/` — controladores HTTP (AuthController, AlumnosController, CalificacionesController, AsistenciasController, ReportesController).
- `Data/` — DbContext de EF Core que mapea las tablas (`AcademicoDbContext.cs`).
- `Models/` — clases entidad: `Alumno`, `Calificacion`, `Asistencia`, `Materia`, `Usuario`.
- `DTOs/` — objetos para entrada/salida (por ejemplo `LoginDto`, `CalificacionCreateDto`).
- `Services/JwtService.cs` — generación de tokens JWT.
- `Middleware/ErrorHandlingMiddleware.cs` — manejo centralizado de errores.
- `postman/utma-academico-aspnetcore.postman_collection.json` — colección Postman para probar la API.

---

## 3) Resumen de qué hace cada parte (en lenguaje sencillo)

- Program.cs: configura servicios (controladores, EF, JWT), agrega middleware y arranca la app.
- DbContext: define las tablas y relaciones para que EF Core se conecte a MySQL.
- Controllers: reciben peticiones HTTP, consultan la base de datos con el DbContext y devuelven JSON.
- JwtService + AuthController: permiten obtener un token JWT (en desarrollo se usa una `apiKey`) para autenticar solicitudes.
- ReportesController: calcula promedios de calificaciones y devuelve alumnos con bajo rendimiento.
- Postman collection: ya configurada para obtener token y llamar a los endpoints.

---

## 4) Explicación línea a línea (archivos clave)

A continuación encontrarás comentarios en cada línea para `Program.cs` y `Controllers/ReportesController.cs`. Esto te ayudará a entender exactamente qué hace cada instrucción.

### `Program.cs` (comentado)

```csharp
// using: referencias a librerías necesarias
using Microsoft.EntityFrameworkCore; // EF Core
using System.Reflection; // para obtener nombre del ensamblado (Swagger XML)
using utma_academico.Data; // DbContext
using Microsoft.OpenApi.Models; // Swagger
using Microsoft.IdentityModel.Tokens; // JWT tokens
using System.Text; // Encoding
using utma_academico.Services; // JwtService creado en el proyecto
using System.Text.Json.Serialization; // para opciones de serialización

var builder = WebApplication.CreateBuilder(args); // crea el builder de la app

// Añadir servicios al contenedor DI
builder.Services.AddControllers()
    .AddJsonOptions(options =>
    {
        // Evitar ciclos de referencia al serializar entidades (EF Core)
        options.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.IgnoreCycles;
    });

// Habilitar explorador de endpoints para Swagger
builder.Services.AddEndpointsApiExplorer();

// Configurar Swagger/OpenAPI
builder.Services.AddSwaggerGen(options =>
{
    // Incluir comentarios XML si existen para documentar Swagger
    var xmlFile = ($"{Assembly.GetExecutingAssembly().GetName().Name}.xml");
    var xmlPath = Path.Combine(AppContext.BaseDirectory, xmlFile);
    if (File.Exists(xmlPath))
    {
        options.IncludeXmlComments(xmlPath);
    }

    // Definición del documento
    options.SwaggerDoc("v1", new() { Title = "UTMA Académico API", Version = "v1" });

    // Configurar esquema de seguridad para JWT en Swagger (botón Authorize)
    var securityScheme = new OpenApiSecurityScheme
    {
        Name = "Authorization",
        Description = "JWT Authorization header using the Bearer scheme. Enter 'Bearer {token}'",
        In = ParameterLocation.Header,
        Type = SecuritySchemeType.Http,
        Scheme = "bearer",
        BearerFormat = "JWT",
        Reference = new OpenApiReference { Type = ReferenceType.SecurityScheme, Id = "Bearer" }
    };
    options.AddSecurityDefinition("Bearer", securityScheme);
    options.AddSecurityRequirement(new OpenApiSecurityRequirement { { securityScheme, new string[] { } } });
});

// Configurar cadena de conexión a la BD (MySQL) desde appsettings.json
var connectionString = builder.Configuration.GetConnectionString("AcademicoDb")
                       ?? "Server=localhost;Database=db_sys_universities;User=root;Password=utma2025;";

builder.Services.AddDbContext<AcademicoDbContext>(options =>
{
    // Usar provider de MySQL (Pomelo) y detectar la versión del servidor
    options.UseMySql(connectionString, ServerVersion.AutoDetect(connectionString));
});

// Configuración JWT: leer clave, issuer y audience desde appsettings (o usar valores por defecto)
var jwtKey = builder.Configuration["Jwt:Key"] ?? "VerySecret_SymmetricKey_ChangeThisInProduction_UTMA2025";
var jwtIssuer = builder.Configuration["Jwt:Issuer"] ?? "utma";
var jwtAudience = builder.Configuration["Jwt:Audience"] ?? "utma_users";

builder.Services.AddAuthentication("Bearer")
    .AddJwtBearer(options =>
    {
        options.RequireHttpsMetadata = false; // en desarrollo no forzamos HTTPS para tokens
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

// Registrar servicio custom para generar tokens
builder.Services.AddScoped<JwtService>();

var app = builder.Build(); // construir la app

// Middleware personalizado para manejo de errores
app.UseMiddleware<utma_academico.Middleware.ErrorHandlingMiddleware>();

// Solo en Development habilitamos Swagger UI
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI(options =>
    {
        options.SwaggerEndpoint("/swagger/v1/swagger.json", "UTMA Académico API v1");
        options.RoutePrefix = "swagger"; // servir UI en /swagger
    });
}

app.UseHttpsRedirection(); // fuerza redirección a HTTPS

app.UseAuthentication(); // habilitar autenticación
app.UseAuthorization();  // habilitar autorización

app.MapControllers(); // mapear controladores a rutas

app.Run(); // arrancar la aplicación

// Partial Program para permitir tests de integración (WebApplicationFactory)
public partial class Program { }
```

### `Controllers/ReportesController.cs` (comentado)

```csharp
using System.Linq; // LINQ helpers
using System.Threading.Tasks; // Task
using Microsoft.AspNetCore.Mvc; // ControllerBase, IActionResult
using Microsoft.EntityFrameworkCore; // EF Core async
using utma_academico.Data; // AcademicoDbContext
using Microsoft.AspNetCore.Authorization; // [Authorize]
using Microsoft.Extensions.Configuration; // IConfiguration

[ApiController]
[Route("api/[controller]")]
[Authorize] // requiere token JWT en las peticiones
public class ReportesController : ControllerBase
{
    private readonly AcademicoDbContext _db; // DbContext para consultar la BD
    private readonly IConfiguration _configuration; // leer configuración

    public ReportesController(AcademicoDbContext db, IConfiguration configuration)
    {
        _db = db; // inyectado por DI
        _configuration = configuration;
    }

    // GET /api/reportes/bajo-rendimiento
    public async Task<IActionResult> BajoRendimiento(decimal? umbral = null, bool incluirInactivos = false, bool incluirCeros = false)
    {
        // Umbral por defecto 8.0 si no está en configuración ni en query
        var defaultUmbral = 8.0m;
        decimal umbralFinal = umbral ?? (_configuration.GetValue<decimal?>("Reportes:Umbral") ?? defaultUmbral);

        // Detectar escala (0-10 o 0-100) consultando el valor máximo en la tabla de calificaciones
        var maxValor = await _db.Calificaciones.Where(c => c.CalificacionValor != null).MaxAsync(c => (decimal?)c.CalificacionValor) ?? 0m;
        var escala100 = maxValor > 10m; // si el max > 10 asumimos 0-100
        var comparacionUmbral = escala100 ? umbralFinal * 10m : umbralFinal; // ajustar umbral si es 0-100

        // Construir query base para calificaciones y aplicar filtros por estatus y por cero
        var calificacionesQuery = _db.Calificaciones.AsQueryable();
        if (!incluirInactivos) calificacionesQuery = calificacionesQuery.Where(c => c.CodEstatus == "AC");
        if (!incluirCeros) calificacionesQuery = calificacionesQuery.Where(c => c.CalificacionValor > 0);

        // Agrupar por alumno y calcular promedio en BD
        var promedioGlobalQuery = calificacionesQuery.GroupBy(c => c.AlumnoId)
            .Select(g => new { AlumnoId = g.Key, Promedio = g.Average(c => c.CalificacionValor) });

        // Traer alumnos cuyo promedio < comparacionUmbral y ordenarlos por promedio ascendente
        var alumnosBajoQuery = from p in promedioGlobalQuery
                               where p.Promedio < comparacionUmbral
                               join a in _db.Alumnos on p.AlumnoId equals a.Id
                               select new
                               {
                                   a.Id, a.Matricula, a.Nombre, a.ApellidoPaterno, a.ApellidoMaterno,
                                   Promedio = escala100 ? p.Promedio / 10m : p.Promedio
                               };

        var list = await alumnosBajoQuery.OrderBy(x => x.Promedio).ToListAsync();

        // Construir nombre completo y redondear promedio
        var result = list.Select(x => new
        {
            x.Id, x.Matricula,
            Nombre = string.Join(' ', new[] { x.Nombre, x.ApellidoPaterno, x.ApellidoMaterno }.Where(s => !string.IsNullOrEmpty(s))),
            Promedio = decimal.Round(x.Promedio, 2)
        }).ToList();

        return Ok(result); // devolver JSON con la lista
    }
}
```

---

## 5) Comentario final y recomendaciones

- No dejes la clave JWT por defecto en producción; usa un secreto fuerte y guárdalo en `Secret Manager` o en variables de entorno.
- Considera crear DTOs de salida para controlar exactamente qué campos expones en cada endpoint.
- Si la API va a ser pública, revisa CORS, throttling y logging más detallado.

---

Si quieres, puedo:
- Añadir documentación generada automáticamente (Swagger) con ejemplos por endpoint.
- Generar plantillas para los scripts SQL que usé para pruebas.

Fin del README. ¡Buen trabajo y éxito con la clase!