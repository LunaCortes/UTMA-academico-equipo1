# UTMA-Académico — ASP.NET Core Web API 🎓

**Backend académico universitario – Equipo 1**  
Proyecto basado en la plantilla oficial del profesor (2025).

> **Estado actual:** ¡Listo para desarrollo! ✅  
> Seguridad mejorada: secretos fuera del repositorio, autenticación JWT + ApiKey y usuario admin de prueba incluido.

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
   ```
5. Abrir Swagger en el navegador y probar los endpoints:
   - `https://localhost:PUERTO/swagger`

Más detalles en la siguiente sección.

---

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

---

### 4. Ejecutar la API y abrir Swagger 🚀

Desde la raíz del proyecto:

```powershell
dotnet run --project utma-academico-aspnetcore.csproj
```

En la consola verás algo como:

```text
Now listening on: https://localhost:XXXXX
```

Abre tu navegador en:

```text
https://localhost:XXXXX/swagger
```

(Reemplaza `XXXXX` por el puerto que aparece en la consola).  
Deberías ver el listado de endpoints de la API.

---

### 5. Probar autenticación (obtener token JWT) 🔒

En Swagger:

1. Busca `POST /api/auth/login`.
2. Haz clic en **Try it out**.
3. Usa este body:

```json
{
  "usuario": "admin",
  "apiKey": "utma_academico_dev"
}
```

4. Presiona **Execute**.
5. Copia el valor de `token` de la respuesta.

---

### 6. Probar endpoints protegidos 🧪

1. En Swagger, haz clic en el botón **Authorize**.
2. Escribe:

```text
Bearer TU_TOKEN_AQUI
```

3. Prueba cualquier endpoint que tenga candado (🔒):
   - **Sin token** → debe responder `401 Unauthorized`.
   - **Con token** → debe devolver datos (`200 OK`).

---

### 7. (Opcional) Configurar Postman 🧪📮

1. Crea un entorno llamado `UTMA-Dev`.
2. Agrega una variable `token` (valor inicial vacío).
3. Crea un request:
   - `POST https://localhost:XXXXX/api/auth/login`
   - Body: el mismo JSON de la sección anterior.
4. En la pestaña **Tests** del request, pega:

```javascript
if (pm.response.code === 200) {
    const json = pm.response.json();
    pm.environment.set("token", json.token);
    console.log("Token guardado:", json.token);
}
```

5. En todos los demás requests protegidos, agrega el header:

```text
Authorization: Bearer {{token}}
```

Postman actualizará el token automáticamente cada vez que hagas login.

---

## Flujo funcional básico del sistema 🧭

- El cliente (Swagger, Postman, app front) **hace login** con `usuario` + `apiKey`.
- La API valida la ApiKey y el usuario en BD y **genera un JWT**.
- Las siguientes peticiones protegidas se hacen con el header  
  `Authorization: Bearer <token>`.
- Los controladores usan **EF Core** para consultar MySQL y devolver JSON.

Para más detalles técnicos, revisa el manual: `UTMA-Academico-Manual.md`.

---

## Cómo crear una nueva funcionalidad (Git Flow) 🌱

Desde la raíz del proyecto:

```powershell
# 1. Asegúrate de estar en develop y actualizado
git checkout develop
git pull origin develop

# 2. Crea tu rama de feature
git checkout -b feature/nombre-de-tu-feature

# 3. Trabaja, commitea y pushea
git add .
git commit -m "feat: descripción clara de lo que hiciste"
git push -u origin feature/nombre-de-tu-feature
```

Luego abre el Pull Request en GitHub:

- **base**: `develop`  
- **compare**: tu rama `feature/...`

---

## Checklist antes de abrir un PR ✅

- `dotnet build` sin errores.
- `dotnet run` + Swagger funciona.
- Configuré mis **user-secrets**.
- No subí ningún secreto ni `appsettings.json` con datos reales.
- Probé login → el token funciona.
- Endpoints protegidos devuelven `401` sin token.
- La rama está basada en `develop` actualizado.
- Los mensajes de commit son claros y en español.
- Asigné al menos un revisor en el PR.

---

## Troubleshooting rápido 🧯

- **No inicia (falta connection string)**  
  Ejecuta de nuevo `dotnet user-secrets list` y verifica `ConnectionStrings:AcademicoDb`.

- **401 en todos lados**  
  Verifica que la ApiKey sea exactamente `utma_academico_dev` y que estés enviando el header `Authorization: Bearer <token>`.

- **La base de datos no existe**  
  Asegúrate de haber ejecutado los scripts SQL en orden: primero `db_sys_universities.sql`, luego `setup_admin_user.sql`.

- **El puerto cambia cada vez**  
  Es normal en .NET. Copia siempre el puerto que aparece en la consola al abrir Swagger o Postman.

- **Token inválido**  
  Regenera la `Jwt:Key` (32 bytes) en `user-secrets` y reinicia la API.

Si todo esto falla, revisa también el script `scripts/verificar_proyecto.ps1` para una verificación automática básica del proyecto. 🎯


