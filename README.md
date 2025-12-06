# Sistema de Gestión de Citas Médicas 🏥

**API REST en ASP.NET Core 8** para la gestión integral de citas médicas en clínicas y hospitales.

> **Estado:** ✅ Funcional y listo para desarrollo

---

## 📋 Descripción del Proyecto

Sistema completo de gestión de citas médicas que permite:

- **Autenticación** con JWT (JSON Web Tokens)
- **Gestión de pacientes, médicos y citas médicas**
- **Control de horarios disponibles**
- **Autorización basada en roles** (Administrador, Médico, Recepcionista, Paciente)
- **Documentación interactiva** con Swagger

---

## 👥 Equipo de Desarrollo

| Nombre                            | GitHub            |
|-----------------------------------|-------------------|
| José Guillermo Mottu Vázquez      | @guillermomottu   |
| Luna Ximena Cortés González       | @LunaCortes       |

---

## 🧩 Requisitos Previos

Antes de ejecutar la API, asegúrate de tener instalado:

- **.NET 8 SDK** o superior
  ```powershell
  dotnet --version  # Debe mostrar 8.x.x o superior
  ```
- **MySQL 8.0+** o **MariaDB 10.3+** (local o en contenedor)
- **Git** (para clonar el repositorio)
- **IDE recomendado:** Visual Studio 2022, VS Code o Rider

---

## 🚀 Inicio Rápido

### 1. Clonar el Repositorio

```powershell
git clone <repository-url>
cd UTMA-academico-equipo1
```

### 2. Configurar User Secrets

Configura los secretos necesarios para la aplicación:

```powershell
# Inicializar user-secrets
dotnet user-secrets init --project utma-academico-aspnetcore.csproj

# Configurar cadena de conexión MySQL
dotnet user-secrets set "ConnectionStrings:AcademicoDb" "Server=localhost;Database=sistemaGestionCitasMedicas;User=root;Password=TU_PASSWORD" --project utma-academico-aspnetcore.csproj

# Generar y configurar clave JWT (32 bytes en Base64)
$bytes = New-Object byte[] 32
[System.Security.Cryptography.RandomNumberGenerator]::Create().GetBytes($bytes)
$jwtKey = [Convert]::ToBase64String($bytes)
dotnet user-secrets set "Jwt:Key" "$jwtKey" --project utma-academico-aspnetcore.csproj

# Configurar Issuer y Audience (opcional, tienen valores por defecto)
dotnet user-secrets set "Jwt:Issuer" "UTMA" --project utma-academico-aspnetcore.csproj
dotnet user-secrets set "Jwt:Audience" "UTMA" --project utma-academico-aspnetcore.csproj
```

**Verificar configuración:**
```powershell
dotnet user-secrets list --project utma-academico-aspnetcore.csproj
```

### 3. Crear la Base de Datos

Ejecuta el script SQL para crear la base de datos y las tablas:

```powershell
# Opción 1: Desde PowerShell
Get-Content bd/sistemaGestionCitasMedicas.sql | mysql -u root -p

# Opción 2: Desde MySQL CLI
mysql -u root -p < bd/sistemaGestionCitasMedicas.sql

# Opción 3: Desde MySQL Workbench o cliente gráfico
# Abre y ejecuta el archivo: bd/sistemaGestionCitasMedicas.sql
```

**Nota:** Asegúrate de que la base de datos `sistemaGestionCitasMedicas` se cree correctamente.

### 4. Actualizar Contraseñas con BCrypt (Opcional)

Si la base de datos tiene usuarios con contraseñas en texto plano, actualízalas:

```powershell
Get-Content bd/actualizar_passwords_bcrypt.sql | mysql -u root -p sistemaGestionCitasMedicas
```

### 5. Ejecutar la Aplicación

```powershell
# Opción 1: Solo HTTP (recomendado para desarrollo)
dotnet run --project utma-academico-aspnetcore.csproj --launch-profile http

# Opción 2: HTTP y HTTPS
dotnet run --project utma-academico-aspnetcore.csproj --launch-profile https
```

La aplicación iniciará y mostrará la URL en la consola, por ejemplo:
```
Now listening on: http://localhost:5234
# O si usas HTTPS:
Now listening on: https://localhost:7275
Now listening on: http://localhost:5234
```

**⚠️ IMPORTANTE:** Usa la URL exacta que aparece en la consola (HTTP o HTTPS).

### 6. Abrir Swagger

Abre tu navegador en la URL mostrada en la consola:

**Si usas HTTP:**
```
http://localhost:5234/swagger
```

**Si usas HTTPS:**
```
https://localhost:7275/swagger
```

> **Nota:** Si usas HTTPS por primera vez, es posible que necesites confiar en el certificado de desarrollo:
> ```powershell
> dotnet dev-certs https --trust
> ```

Deberías ver la interfaz de Swagger con todos los endpoints disponibles.

---

## 🔐 Autenticación

### Obtener Token JWT

1. En Swagger, busca el endpoint `POST /api/auth/login`
2. Haz clic en **"Try it out"**
3. Ingresa las credenciales:
   ```json
   {
     "emailUsuario": "admin@clinica.com",
     "passwordUsuario": "admin123"
   }
   ```
4. Ejecuta y copia el `token` de la respuesta

### Autorizar en Swagger

1. Haz clic en el botón **"Authorize"** (arriba a la derecha, con candado 🔒)
2. En el campo **"Value"**, pega el token con este formato:
   ```
   Bearer TU_TOKEN_AQUI
   ```
   **IMPORTANTE:** Debe incluir la palabra "Bearer" seguida de un espacio y luego el token
3. Haz clic en **"Authorize"** y cierra el diálogo
4. Ahora puedes probar los endpoints protegidos

---

## 📚 Endpoints Principales

### Autenticación
- `POST /api/auth/login` - Obtener token JWT

### Catálogos
- `GET /api/catalogos/roles` - Listar roles
- `GET /api/catalogos/especialidades` - Listar especialidades
- `GET /api/catalogos/estados-cita` - Listar estados de cita

### Pacientes (CRUD Completo)
- `GET /api/pacientes` - Listar pacientes
- `GET /api/pacientes/{id}` - Obtener paciente
- `POST /api/pacientes` - Crear paciente
- `PUT /api/pacientes/{id}` - Actualizar paciente
- `DELETE /api/pacientes/{id}` - Eliminar paciente

### Médicos (CRUD Completo)
- `GET /api/medicos` - Listar médicos
- `GET /api/medicos/{id}` - Obtener médico
- `POST /api/medicos` - Crear médico
- `PUT /api/medicos/{id}` - Actualizar médico
- `DELETE /api/medicos/{id}` - Desactivar médico

### Citas Médicas (CRUD Completo)
- `GET /api/citas` - Listar citas
- `GET /api/citas/{id}` - Obtener cita
- `POST /api/citas` - Crear cita
- `PUT /api/citas/{id}` - Actualizar cita
- `PUT /api/citas/{id}/estado` - Actualizar estado
- `DELETE /api/citas/{id}` - Eliminar cita

**Total: 29 endpoints implementados**

Para ver todos los endpoints, consulta la documentación en Swagger o el archivo `PRUEBAS_ENDPOINTS.http`.

---

## 🧪 Probar los Endpoints

### Opción 1: Swagger (Recomendado)
1. Abre Swagger en el navegador
2. Autoriza con tu token (ver sección de Autenticación)
3. Prueba los endpoints directamente desde la interfaz

### Opción 2: Archivo .http (VS Code)
1. Instala la extensión "REST Client" en VS Code
2. Abre el archivo `PRUEBAS_ENDPOINTS.http`
3. Ajusta `{{baseUrl}}` con tu URL
4. Ejecuta el login primero
5. Copia el token y reemplaza `{{token}}`
6. Ejecuta los demás endpoints

### Opción 3: Postman
1. Importa el archivo `PRUEBAS_ENDPOINTS.http` o crea una colección manualmente
2. Configura variables de entorno (`baseUrl`, `token`)
3. Ejecuta las pruebas

---

## 🔧 Configuración Adicional

### Cambiar Puerto

Edita `Properties/launchSettings.json`:
```json
{
  "applicationUrl": "https://localhost:7000;http://localhost:5000"
}
```

### Configuración de Base de Datos

La cadena de conexión se configura en user-secrets. Formato:
```
Server=localhost;Database=sistemaGestionCitasMedicas;User=root;Password=TU_PASSWORD
```

### Duración del Token JWT

Por defecto, los tokens expiran en 120 minutos. Para cambiar:
```powershell
dotnet user-secrets set "Jwt:DurationMinutes" "240" --project utma-academico-aspnetcore.csproj
```

---

## 🐛 Solución de Problemas

### Error: "Access denied for user 'root'@'localhost'"
**Solución:** Verifica que la contraseña en user-secrets sea correcta:
```powershell
dotnet user-secrets list --project utma-academico-aspnetcore.csproj
```

### Error: "Invalid salt version" al hacer login
**Solución:** Las contraseñas deben estar hasheadas con BCrypt. Ejecuta:
```powershell
Get-Content bd/actualizar_passwords_bcrypt.sql | mysql -u root -p sistemaGestionCitasMedicas
```

### Error 401 Unauthorized después del login
**Solución:** 
1. Verifica que el token se esté enviando con el formato: `Bearer TOKEN`
2. Asegúrate de que el token no haya expirado (genera uno nuevo)
3. Reinicia el servidor después de cambios en configuración

### La base de datos no existe
**Solución:** Ejecuta el script SQL:
```powershell
Get-Content bd/sistemaGestionCitasMedicas.sql | mysql -u root -p
```

### El puerto cambia cada vez
**Solución:** Es normal en .NET. Copia siempre el puerto que aparece en la consola al abrir Swagger.

### Error SSL: "WRONG_VERSION_NUMBER"
**Solución:** Estás mezclando HTTP y HTTPS. Verifica:
1. Si el servidor muestra `http://localhost:XXXX` → usa **HTTP** en tu cliente
2. Si el servidor muestra `https://localhost:XXXX` → usa **HTTPS** en tu cliente
3. Para desarrollo, usa el perfil HTTP: `--launch-profile http`
4. Para más detalles, consulta `Problemas_Soluciones/SOLUCION_ERROR_SSL.md`

Para más detalles sobre problemas y soluciones, consulta la carpeta `Problemas_Soluciones/`.

---

## 📖 Documentación Adicional

- **Documentación Técnica Completa:** `DOCUMENTACION_TECNICA.md`
- **Reporte de Pruebas:** `REPORTE_PRUEBAS_ENDPOINTS.md`
- **Pruebas de Endpoints:** `PRUEBAS_ENDPOINTS.http`
- **Problemas y Soluciones:** `Problemas_Soluciones/`

---

## 🏗️ Arquitectura del Proyecto

El proyecto sigue una **arquitectura en capas**:

```
Controllers (API Layer)
    ↓
Services (Business Logic)
    ↓
Data Access (EF Core)
    ↓
Database (MySQL)
```

### Estructura de Carpetas

- `Controllers/` - Endpoints HTTP
- `Services/` - Lógica de negocio
- `Data/` - DbContext y acceso a datos
- `Models/` - Entidades EF Core
- `DTOs/` - Data Transfer Objects
- `Middleware/` - Manejo de errores
- `Exceptions/` - Excepciones personalizadas
- `bd/` - Scripts SQL

---

## 🔒 Seguridad

- **Autenticación:** JWT (JSON Web Tokens)
- **Hashing de contraseñas:** BCrypt con salt automático
- **Autorización:** Basada en roles (Administrador, Médico, Recepcionista, Paciente)
- **Validaciones:** Campos requeridos, unicidad, reglas de negocio

---

## 📊 Tecnologías Utilizadas

- **.NET 8** - Framework de desarrollo
- **ASP.NET Core 8** - Framework web
- **Entity Framework Core 9** - ORM
- **MySQL/MariaDB** - Base de datos
- **JWT** - Autenticación
- **BCrypt** - Hashing de contraseñas
- **Swagger/OpenAPI** - Documentación

---

## ✅ Checklist de Verificación

Antes de reportar problemas, verifica:

- [ ] .NET 8 SDK instalado y funcionando
- [ ] MySQL/MariaDB instalado y corriendo
- [ ] Base de datos `sistemaGestionCitasMedicas` creada
- [ ] User-secrets configurados correctamente
- [ ] Contraseñas actualizadas con BCrypt (si aplica)
- [ ] Servidor iniciado sin errores
- [ ] Swagger accesible en el navegador
- [ ] Login funciona y genera token
- [ ] Token se usa correctamente en endpoints protegidos

---

## 📝 Licencia

Ver archivo `LICENSE` para más detalles.

---

## 👨‍💻 Contribuir

1. Crea una rama desde `develop`
2. Realiza tus cambios
3. Asegúrate de que el proyecto compile
4. Prueba los endpoints
5. Abre un Pull Request

---
