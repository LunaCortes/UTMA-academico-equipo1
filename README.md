# UTMA-Académico — ASP.NET Core Web API 🎓

**Backend académico universitario – Equipo 1**  
Proyecto basado en la plantilla oficial del profesor (2025).

> **Estado actual:** ¡Listo para desarrollo! ✅  
> Seguridad mejorada: secretos fuera del repositorio, autenticación JWT + base de datos probada.
---

## Descripción del proyecto 📚

UTMA-Académico es una **API REST en ASP.NET Core 8** que permite gestionar información académica básica:

- **Alumnos, materias, calificaciones y asistencias**.
- **Autenticación con JWT** (token Bearer en los encabezados).
- Acceso a **reportes** (por ejemplo, alumnos con bajo rendimiento).
- Documentación interactiva con **Swagger**.

Está pensada como base de práctica para alumnos que están empezando con .NET, C#, EF Core y JWT.

---

## Equipo de desarrollo 👨‍💻👩‍💻

| Nombre                            | GitHub            |
|-----------------------------------|-------------------|
| José Guillermo Mottu Vázquez      | @guillermomottu   |
| Luna Ximena Cortés González       | @LunaCortes       |

---

## Requisitos previos 🧩

Antes de intentar ejecutar la API, asegúrate de tener instalado:

- **SDK .NET 8**  
  - Puedes verificar con:  
    ```powershell
    dotnet --version
    ```
- **Motor de base de datos**  
  - MySQL o MariaDB (local o en contenedor).  
  - Usuario con permisos para crear BD y ejecutar scripts (`db_sys_universities.sql`).
- **Herramientas recomendadas**
  - Git
  - PowerShell (en Windows) o cualquier terminal
  - Visual Studio 2022 / Visual Studio Code
  - Postman (opcional, para probar la API)

---

## Puesta en marcha rápida (TL;DR) ⚡

1. Clonar el repositorio y cambiar a la rama `develop`.
2. Configurar **user-secrets** (`ConnectionStrings:AcademicoDb`, `Jwt:Key`, `Authentication:TestApiKey`).
3. Crear la base de datos ejecutando los scripts SQL en la carpeta `bd/`.
4. Ejecutar:
   ```powershell
   dotnet run --project utma-academico-aspnetcore.csproj

## Pasos para levantar la API en local 🛠️

### 1. Clonar el repositorio del equipo

```powershell
git clone https://github.com/LunaCortes/UTMA-academico-equipo1.git
cd UTMA-academico-equipo1
git checkout develop
```

---

### 2. Configurar `user-secrets` (solo una vez por máquina)

Desde la **raíz del proyecto**:

```powershell
dotnet user-secrets init
```

#### 2.1. Cadena de conexión MySQL 🔐

```powershell
dotnet user-secrets set "ConnectionStrings:AcademicoDb" "Server=localhost;Database=db_sys_universities;User=root;Password=TU_CONTRASEÑA_AQUÍ"
```

#### 2.2. Clave JWT segura (32 bytes → Base64) 🔑

```powershell
$bytes = New-Object byte[] 32
[System.Security.Cryptography.RandomNumberGenerator]::Create().GetBytes($bytes)
$jwtKey = [Convert]::ToBase64String($bytes)
Write-Host "Tu clave JWT (guárdala): $jwtKey"
dotnet user-secrets set "Jwt:Key" "$jwtKey"
```

#### 2.3. ApiKey de desarrollo (para login de prueba) 🧪

```powershell
dotnet user-secrets set "Authentication:TestApiKey" "utma_academico_dev"
```

#### 2.4. Verificar que los secretos quedaron guardados

```powershell
dotnet user-secrets list
```

Debes ver algo similar a:

- `ConnectionStrings:AcademicoDb = Server=localhost;Database=db_sys_universities;...`
- `Jwt:Key = TuClaveSuperSeguraBase64Aqui==`
- `Authentication:TestApiKey = utma_academico_dev`

---

### 3. Crear la base de datos MySQL 🗄️

En la carpeta `bd/` vienen los scripts necesarios.

Desde la raíz del proyecto:

```powershell
cd bd
```

#### 3.1. Crear estructura de tablas

```powershell
mysql -u root -p < db_sys_universities.sql
```

> En PowerShell, si el operador `<` te da error, usa:
> ```powershell
> cmd /c "mysql -u root -p < db_sys_universities.sql"
> ```

#### 3.2. Insertar usuario admin de prueba

```powershell
mysql -u root -p < setup_admin_user.sql
```

> En PowerShell:
> ```powershell
> cmd /c "mysql -u root -p < setup_admin_user.sql"
> ```

Credenciales de desarrollo:

- **Usuario**: `admin`  
- **ApiKey**: `utma_academico_dev`  
- **Contraseña**: `admin123` (ya viene hasheada con BCrypt en el script).

#### 3.3. Cargar datos de ejemplo (alumnos + calificaciones) 🧪

Para tener 20 alumnos y ~120 calificaciones listas para probar:

```powershell
mysql -u root -p db_sys_universities < seed_data.sql
```

> En PowerShell:
> ```powershell
> cmd /c "mysql -u root -p db_sys_universities < seed_data.sql"
> ```

O desde el cliente de MySQL interactivo:

```sql
USE db_sys_universities;
SOURCE seed_data.sql;
```
