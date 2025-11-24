UTMA Académico - Manual técnico para alumnos (Guía completa)
=============================================================

Desarrollador: Ingeniero en Telemática
Egresado de: Universidad de Colima
Nombre: Jorge Luis Vargas Mancilla

Resumen
------
Este manual está diseñado para alumnos de décimo cuatrimestre que no han trabajado nunca con .NET ni con C#. Explica paso a paso la aplicación "utma-academico-aspnetcore" que soporta consultas y registros de calificaciones y asistencias, incluyendo autenticación con JWT y uso de EF Core con MySQL.

Objetivo
--------
- Entender desde cero cómo se crea un proyecto Web API en .NET 8.
- Comprender cada archivo del proyecto y cómo se relacionan entre sí.
- Poder ejecutar, probar y extender la aplicación.

Cómo usar este manual
---------------------
- Leer primero las secciones "Conceptos básicos" y "Entorno y herramientas".
- Seguir el paso a paso para crear y ejecutar el proyecto.
- Consultar la sección "Explicación archivo por archivo" para estudiar el código y sus dependencias.
- Al final hay ejercicios prácticos y preguntas frecuentes.

Parte 1 — Conceptos básicos (en lenguaje sencillo)
-------------------------------------------------

1. ¿Qué es una API web?
- Una API web es un programa que corre en un servidor y permite que otros programas (o navegadores, Postman) envíen peticiones (requests) y reciban respuestas (responses) en formato JSON.

2. ¿Qué es .NET y C#?
- .NET es una plataforma de Microsoft para ejecutar aplicaciones. C# es un lenguaje de programación que se usa con .NET.

3. ¿Qué es un proyecto "Web API"?
- Es una plantilla que ya trae la estructura para crear controladores que atienden rutas HTTP (por ejemplo, GET, POST).

4. ¿Qué es EF Core (Entity Framework Core)?
- Es una herramienta (ORM) que permite mapear tablas de la base de datos a clases en C#. Permite consultar la BD usando LINQ (un lenguaje para consultas en C#) en lugar de escribir SQL directo.
- Analogia: piensa en EF Core como un intérprete que traduce consultas en objetos y tablas en objetos. *DbContext* es "la conexión" a la BD: imagina que es el vehículo que te da acceso a las tablas.

5. ¿Qué es JWT (JSON Web Token)?
- Es un token que se emite cuando un usuario se autentica. El token se envía en la cabecera `Authorization: Bearer <token>` en cada petición protegida. El servidor valida el token y permite el acceso.

6. Swagger y Postman
- Swagger es una interfaz automática que muestra los endpoints y permite probarlos desde el navegador.
- Postman es una herramienta externa para probar APIs; en este proyecto se incluye una colección para facilitar pruebas.

Parte 2 — Entorno y herramientas necesarias
------------------------------------------

Requisitos mínimos para seguir el manual:
- Windows o Linux o macOS.
- Visual Studio 2022 o Visual Studio Code + .NET SDK 8.
- MySQL (o MariaDB) accesible localmente o en servidor.
- Postman (opcional, pero recomendado).
- (Opcional) Pandoc para convertir Markdown a DOCX.

Instalación rápida:
- Instala .NET 8 SDK desde https://dotnet.microsoft.com
- Visual Studio: crear proyecto ASP.NET Core Web API
- MySQL: instala y crea la BD `db_sys_universities` o ajusta `appsettings.json` con tus credenciales.

Parte 3 — Crear el proyecto (paso a paso minimal)
------------------------------------------------

En Visual Studio
1. Archivo ? Nuevo ? Proyecto.
2. Selecciona "ASP.NET Core Web API".
3. Nombre: `utma-academico`.
4. Framework: `.NET 8`.
5. Genera el proyecto.

En VS Code / CLI
1. Abrir terminal en la carpeta deseada.
2. dotnet new webapi -n utma-academico
3. dotnet add package Pomelo.EntityFrameworkCore.MySql
4. dotnet add package Microsoft.AspNetCore.Authentication.JwtBearer
5. dotnet add package Swashbuckle.AspNetCore

Parte 4 — Estructura del proyecto y relación entre archivos
---------------------------------------------------------

Lista breve de archivos y su papel principal (ya presentes en el proyecto):
- `Program.cs`: arranque y configuración de servicios (DI), swagger, EF Core, JWT y pipeline.
- `Data/AcademicoDbContext.cs`: representa la BD, contiene `DbSet<T>` para cada tabla.
- `Models/*.cs`: clases que representan tablas: `Alumno`, `Materia`, `Calificacion`, `Asistencia`, `Usuario`.
- `Controllers/*.cs`: endpoints HTTP para interactuar con la app.
- `Services/JwtService.cs`: lógica de creación de tokens.
- `Middleware/ErrorHandlingMiddleware.cs`: captura excepciones y devuelve JSON consistente.
- `DTOs/*.cs`: objetos para solicitudes y respuestas.
- `postman/UTMA-Academico.postman_collection.json`: colección para importar en Postman.

Cómo se vinculan: ejemplo del flujo cuando pides el historial de un alumno
1. Cliente hace GET a `/api/alumnos/{id}/historial`.
2. `AlumnosController.Historial` recibe la petición; usa `_db` (un `AcademicoDbContext`) para consultar `Alumnos`, `Calificaciones` y `Asistencias`.
3. EF Core traduce las consultas LINQ a SQL y obtiene los datos de MySQL.
4. El controlador proyecta esos datos a objetos anónimos y devuelve `Ok(...)` con JSON.
5. Si ocurre un error, `ErrorHandlingMiddleware` lo captura y devuelve un JSON con `code` y `message`.

Parte 5 — Explicación archivo por archivo (línea a línea agrupada)
-----------------------------------------------------------------

A continuación se explican por secciones principales. No repetiremos cada llavero de `using` pero sí la lógica de cada bloque.

1) Program.cs — qué hace y por qué
---------------------------------
- Crear `builder`: punto de entrada para configurar la app.
- `AddControllers()` registra el servicio que permite usar controladores.
- `AddJsonOptions(... ReferenceHandler.IgnoreCycles)`: evita que al serializar objetos con referencias circulares (por ejemplo Alumno->Calificaciones->Alumno) el serializador falle.
- `AddSwaggerGen(...)`: configura Swagger; se añade `SecurityDefinition` para poder introducir el token JWT en la UI de Swagger.
- `GetConnectionString("AcademicoDb")`: lee la cadena de conexión desde `appsettings.json` (si no existe usa uno por defecto de desarrollo).
- `AddDbContext<AcademicoDbContext>(options => UseMySql(...))`: registra EF Core con el provider MySQL y la cadena de conexión.
- JWT: se leen parámetros `Jwt:Key`, `Jwt:Issuer`, `Jwt:Audience` y se configura `AddAuthentication().AddJwtBearer(...)` con parámetros de validación.
- `AddScoped<JwtService>()`: registra el servicio que genera tokens.
- Construcción del `app` y pipeline: middleware de errores, Swagger si es desarrollo, HTTPS redirection, autenticación/authorization y `MapControllers()`.

2) Data/AcademicoDbContext.cs
-----------------------------
- Hereda de `DbContext`. Se inyectan `DbContextOptions` desde `Program.cs`.
- Contiene `DbSet<Alumno> Alumnos` etc. Cada `DbSet` representa una tabla.
- `OnModelCreating` asegura los nombres de tablas y permite añadir configuraciones adicionales.

Que significa para un alumno: piensa que `DbContext` es la "ventana" a la BD. Si quieres buscar alumnos, abres esa ventana y pides la tabla `Alumnos`.

3) Models (Alumno, Materia, Calificacion, Asistencia, Usuario)
--------------------------------------------------------------
Cada una de estas clases representa una fila de una tabla. Ejemplo: `Alumno` tiene `Id`, `Nombre`, `Matricula`.
Las propiedades tienen atributos (`[Column(...)]`) que le dicen a EF Core cómo se llaman realmente las columnas en la BD.

Puntos clave:
- `[Key]` marca la clave primaria.
- `[Required]` marca campos obligatorios.
- `[Table("pro_alumnos")]` indica la tabla en la BD.
- `ICollection<Calificacion>` son relaciones: un alumno puede tener muchas calificaciones.
- `[JsonIgnore]` evita serializar colecciones que causan ciclos.

4) Controllers
--------------
- `AuthController`: permite obtener token en modo desarrollo. Recibe `LoginDto` con `usuario` y `apiKey`, valida y genera token usando `JwtService`.
- `AlumnosController`: endpoint `GET /api/alumnos/{id}/historial`. Busca el alumno y sus registros (calificaciones y asistencias) y devuelve un objeto con la información.
- `CalificacionesController`: `POST /api/calificaciones` para crear una calificación y `GET /api/calificaciones/{id}` para obtenerla.
- `AsistenciasController`: `POST /api/asistencias` y `GET /api/asistencias/{id}`.
- `ReportesController`: endpoints para reportes, por ejemplo `GET /api/reportes/bajo-rendimiento` que calcula promedios en la BD y devuelve alumnos por debajo de un umbral.

Para cada controlador:
- Se inyecta `AcademicoDbContext` para consultar la BD.
- Se usan métodos `async` y `await` con EF Core para no bloquear el servidor mientras la BD responde.
- Se usan proyecciones (`Select(...)`) para devolver solo los campos necesarios.

5) Services/JwtService.cs
------------------------
- Lee la clave secreta, issuer/audience y duración desde `IConfiguration`.
- Crea claims básicos: `sub`, `unique_name` y `jti`.
- Crea el token y devuelve la cadena y la fecha de expiración.

6) Middleware/ErrorHandlingMiddleware.cs
---------------------------------------
- Envuelve toda la petición en un `try/catch`.
- Si ocurre una `ApiException` (excepción controlada), devuelve un JSON con `code`, `message` y `details` con el StatusCode que corresponde.
- Si ocurre cualquier otra excepción no controlada, crea una `ApiException` genérica (Internal) y devuelve 500.

7) DTOs
-------
- `LoginDto`: `{ Usuario, ApiKey }` usado para obtener token.
- `CalificacionCreateDto`: `{ AlumnoId, MateriaId, Parcial, Calificacion }` para crear calificaciones.
- `TokenResponseDto`: `{ Token, ExpiresAt }` respuesta de login.

8) Postman collection
---------------------
- `postman/UTMA-Academico.postman_collection.json` contiene ejemplos para obtener token y llamar a los endpoints protegidos.
- Incluye un script de test que extrae `token` de la respuesta del login y lo guarda en variables de colección.

Parte 6 — Glosario (explicado para principiantes)
-----------------------------------------------
- API: conjunto de reglas para que programas se comuniquen.
- Endpoint: una URL que atiende peticiones (por ejemplo `/api/alumnos/10/historial`).
- JSON: formato de datos legible (parecido a objetos en JavaScript).
- ORM: Object-Relational Mapper. Traduce clases/objetos a tablas.
- DbContext: objeto que representa la conexión a la BD; contiene `DbSet<T>` que son las tablas.
- Entity: clase que representa una tabla.
- Migration: cambios en el esquema de la BD generados por EF Core (no usado en este manual, pero útil más adelante).

Parte 7 — Ejercicios propuestos para alumnos
-------------------------------------------
1. Ejecutar la API en local y abrir Swagger: `https://localhost:7275/swagger`.
2. Usar el request de `Auth - Login` en Postman para obtener token e invocar `/api/reportes/bajo-rendimiento`.
3. Crear una calificación con `POST /api/calificaciones` y luego consultar su `GET /api/calificaciones/{id}`.
4. Modificar `ReportesController` para que el umbral sea pasado por query param y probar.

Parte 8 — Conversión a DOCX (entrega de la guía en formato Word)
----------------------------------------------------------------
He preparado este manual en formato Markdown dentro del repositorio (`manual/UTMA-Academico-Manual.md`). Para generar un archivo DOCX que puedas descargar e imprimir, puedes usar `pandoc`:

1. Instalar pandoc: https://pandoc.org/installing.html
2. En la raíz del proyecto ejecutar:
   pandoc manual/UTMA-Academico-Manual.md -s -o manual/UTMA-Academico-Manual.docx

También puedes abrir el archivo Markdown en Word o Visual Studio Code y usar la extensión para exportar a Word.

Parte 9 — Consideraciones finales y buenas prácticas
--------------------------------------------------
- No dejes secretos (como `Jwt:Key`) en el código en producción. Usa Variables de Entorno o Azure Key Vault.
- Valida siempre los inputs (ya se hace con DTOs y ModelState).
- Usa DTOs de salida para no exponer campos sensibles.
- Implementa paginación en endpoints que puedan devolver muchos registros.

Anexo A — Archivos importantes (lista)
-------------------------------------
- Program.cs
- Data/AcademicoDbContext.cs
- Controllers/*.cs
- Models/*.cs
- Services/JwtService.cs
- Middleware/ErrorHandlingMiddleware.cs
- DTOs/*.cs
- postman/UTMA-Academico.postman_collection.json

Fin del manual. Si quieres, creo también el archivo `manual/UTMA-Academico-Manual.docx` aquí en el proyecto (requiere usar conversión a DOCX). ¿Deseas que lo genere aquí y lo deje listo para descargar? Si aceptas, lo crearé como Markdown convertido a DOCX (si la herramienta de conversión está disponible en el entorno) o generaré el docx básico que podrás descargar y revisar.
