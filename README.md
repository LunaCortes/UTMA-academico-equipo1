# 🎓 UTMA-Académico — ASP.NET Core Web API

> **Guía rápida de configuración local para estudiantes**

---

## 📋 Equipo de desarrollo

| Nombre | Rol |
|--------|-----|
| Alumno 1 - Jose Guillermo Mottu Vazquez 
| Alumno 2 - Luna Ximena Cortes Gonzalez 


---

## 🚀 Inicio rápido (5 minutos)

### Paso 1: Clonar el repositorio

```powershell
git clone <REPO_URL>
cd utma-academico-aspnetcore
git checkout develop
```

### Paso 2: Configurar `dotnet user-secrets` (cada integrante)

Los secretos (contraseñas, claves JWT) se guardan **localmente en tu máquina**, no en Git.

#### 2.1 Inicializar user-secrets

```powershell
cd C:\Users\TU_USUARIO\Documents\utma-academico-aspnetcore

# Ejecuta esto solo una vez por proyecto
dotnet user-secrets init --project .\utma-academico-aspnetcore.csproj
```

#### 2.2 Añadir valores sensibles

Genera primero una clave JWT segura:

```powershell
# Genera una clave JWT (copia la salida)
$bytes = New-Object byte[] 32
[System.Security.Cryptography.RandomNumberGenerator]::Create().GetBytes($bytes)
[Convert]::ToBase64String($bytes)
```

Luego, añade los secretos (reemplaza valores):

```powershell
# Cadena de conexión MySQL
dotnet user-secrets set "ConnectionStrings:AcademicoDb" "Server=localhost;Database=db_sys_universities;User=root;Password=tu_contraseña" --project .\utma-academico-aspnetcore.csproj

# Clave JWT (pega la generada arriba)
dotnet user-secrets set "Jwt:Key" "TU_CLAVE_JWT_BASE64_AQUI" --project .\utma-academico-aspnetcore.csproj

# API Key de prueba
dotnet user-secrets set "Authentication:TestApiKey" "utma_academico_dev" --project .\utma-academico-aspnetcore.csproj
```

#### 2.3 Verificar que quedaron guardados

```powershell
dotnet user-secrets list --project .\utma-academico-aspnetcore.csproj
```

> ✅ Deberías ver las 3 claves listadas

### Paso 3: Construir la API

```powershell
dotnet build .\utma-academico-aspnetcore.csproj
```

### Paso 4: Ejecutar y probar Swagger

```powershell
dotnet run --project .\utma-academico-aspnetcore.csproj
```

En la consola verás algo como:

```
Now listening on: https://localhost:5001
```

**Abre en tu navegador:** `https://localhost:5001/swagger`

> 🎉 ¡Si ves la interfaz Swagger, todo está funcionando!

---

## 🔧 Troubleshooting (solución de problemas)

### ❌ Error: "Connection string failed"

**Solución:** Verifica que tus `user-secrets` están correctos:

```powershell
dotnet user-secrets list --project .\utma-academico-aspnetcore.csproj
```

Revisa que:
- MySQL esté corriendo (`Server=localhost`)
- El usuario y contraseña sean válidos
- La base de datos `db_sys_universities` exista

### ❌ Error: "Cannot init user-secrets"

**Solución:** Asegúrate de estar en la carpeta correcta:

```powershell
# Verifica que estés aquí
Get-Location

# Debe mostrar: C:\Users\...\utma-academico-aspnetcore
```

### ❌ Error: Caracteres especiales en la clave JWT

**Solución:** No uses apóstrofos (`'`) ni comillas sin cerrar. Regenera usando el comando Base64:

```powershell
# Elimina la clave anterior
dotnet user-secrets remove "Jwt:Key" --project .\utma-academico-aspnetcore.csproj

# Genera una nueva sin caracteres especiales
$bytes = New-Object byte[] 32
[System.Security.Cryptography.RandomNumberGenerator]::Create().GetBytes($bytes)
[Convert]::ToBase64String($bytes)
```

---

## 🌳 Git Flow: Crear rama y abrir PR

### Paso 1: Crear rama `feature/setup-base`

```powershell
git checkout -b feature/setup-base
```

### Paso 2: Commitear cambios

```powershell
# Añadir archivos modificados
git add appsettings.Development.json README.md

# Crear commit
git commit -m "chore: add appsettings.Development.json and setup docs"

# Subir rama al remoto
git push -u origin feature/setup-base
```

### Paso 3: Abrir Pull Request

#### Opción A: GitHub Web (más fácil)

1. Ve a https://github.com/LunaCortes/UTMA-academico-equipo1
2. Haz clic en **Compare & pull request**
3. Selecciona:
   - **Base:** `develop`
   - **Compare:** `feature/setup-base`
4. Añade descripción y asigna revisores
5. Haz clic en **Create pull request**

#### Opción B: GitHub CLI

```powershell
gh pr create \
  --base develop \
  --head feature/setup-base \
  --title "Setup: base config and docs" \
  --body "Añade appsettings.Development.json con placeholders y pasos para configurar user-secrets localmente."
```

### Paso 4: Mergear (después de revisión)

```powershell
# Espera a que un compañero apruebe el PR en GitHub
# Luego, desde la interfaz web, haz clic en "Merge pull request"

# O con GitHub CLI:
gh pr merge --merge
```

---

## 📁 Estructura del proyecto

```
utma-academico-aspnetcore/
├── Controllers/           # Endpoints HTTP
│   ├── AuthController.cs
│   ├── AlumnosController.cs
│   ├── CalificacionesController.cs
│   └── ...
├── Models/                # Entidades (Alumno, Asistencia, etc.)
├── Data/                  # DbContext (AcademicoDbContext.cs)
├── DTOs/                  # Objetos para entrada/salida (LoginDto, etc.)
├── Services/              # JwtService para generar tokens
├── Middleware/            # ErrorHandlingMiddleware para manejo de errores
├── appsettings.Development.json  # Configuración con PLACEHOLDERS (sin secretos)
├── Program.cs             # Configuración de la app
└── README.md              # Este archivo
```

---

## 🔐 Seguridad y buenas prácticas

✅ **Hazlo:**
- Usa `dotnet user-secrets` para guardar valores sensibles **localmente**
- Revisa que `appsettings.json` no esté en git: `git ls-files | grep appsettings.json`
- Reemplaza los valores de ejemplo antes de hacer commit

❌ **No hagas:**
- No pegues secretos en chats, PRs, ni comentarios públicos
- No subas `appsettings.json` con contraseñas al repositorio
- No uses claves JWT débiles (usa el generador Base64 proporcionado)

Para **producción**, usa:
- GitHub Secrets (para CI/CD)
- Azure Key Vault
- Variables de entorno del servidor

---

## 📚 Documentación adicional

- **[Código de Program.cs comentado](./docs/PROGRAM_COMMENTED.md)** *(opcional)*
- **[Código de ReportesController.cs comentado](./docs/CONTROLLERS_COMMENTED.md)** *(opcional)*
- **Postman Collection:** Usa `utma-academico-aspnetcore.http` para probar endpoints

---

## 🆘 ¿Necesitas ayuda?

| Problema | Solución |
|----------|----------|
| MySQL no conecta | Verifica que MySQL está corriendo y credenciales son correctas |
| Swagger no abre | Comprueba que `dotnet run` dice `Now listening on: https://localhost:5001` |
| Secret mal guardado | Usa `dotnet user-secrets remove "KEY"` y vuélvelo a crear |
| PR no se crea | Asegúrate de haber hecho `git push -u origin feature/setup-base` |

---

## 📝 Checklist antes de hacer merge

- [ ] Ejecuté `dotnet build` sin errores
- [ ] Ejecuté `dotnet run` y Swagger se abre correctamente
- [ ] Configuré `user-secrets` en mi máquina
- [ ] Creé la rama `feature/setup-base`
- [ ] Hice commit y push de los cambios
- [ ] Abrí PR hacia `develop`
- [ ] Asigné revisores
- [ ] Respondí a comentarios de revisión (si los hay)
- [ ] El PR fue aprobado
- [ ] Hice merge a `develop`

---

## ✨ Próximos pasos

Una vez mergeada esta rama:

1. Todos clonamos/pulleamos la rama `develop` actualizada
2. Cada quien configura `user-secrets` en su máquina
3. Ejecutamos `dotnet run` y probamos Swagger
4. Listo para empezar a desarrollar features 🚀

---

**Desarrollador original:** Ingeniero en Telemática — Jorge Luis Vargas Mancilla  
**Universidad:** Universidad de Colima

**Última actualización:** Noviembre 2025
