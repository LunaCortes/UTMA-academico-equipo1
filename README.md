# UTMA-Académico — ASP.NET Core Web API
> **Proyecto final – Equipo 1**  
> Plantilla original: Ing. Jorge Luis Vargas Mancilla (Universidad de Colima)  
> Adaptación segura y limpia para entrega final – Noviembre 2025

---

## Equipo de desarrollo

| Nombre                            | Matrícula     | Rol                              | GitHub            |
|-----------------------------------|---------------|----------------------------------|-------------------|
| José Guillermo Mottu Vázquez      | 2023XXXX      | Backend Lead – Auth & Seguridad  | @guillermomottu   |
| Luna Ximena Cortés González       | 2023XXXX      | Documentación, Testing & Postman | @LunaCortes       |

---

## Flujo COMPLETO de configuración (OBLIGATORIO seguir este orden)

### ETAPA 1 – Crear repositorio limpio (anti-plagio)

1. **Clonar la plantilla del profesor**
   ```powershell
   git clone https://github.com/jlvargas/utma-academico-plantilla.git
   cd utma-academico-plantilla

Eliminar historial .git (anti-plagio)PowerShellrm -r -fo .git          # PowerShell (Windows)
# o en Linux/Mac:
# rm -rf .git
Crear repositorio PRIVADO en GitHub (sin README, sin .gitignore, sin licencia)
Nombre sugerido: UTMA-academico-equipo1
Visibilidad: Private (o público si lo permiten)

Inicializar Git limpio + primer commitPowerShellgit init
git add .
git commit -m "chore: initial commit - clean project from template"
Crear y pushear ramas main y developPowerShellgit branch -M main
git remote add origin https://github.com/LunaCortes/UTMA-academico-equipo1.git
git push -u origin main

git checkout -b develop
git push -u origin develop
Actualizar README.md con información del equipo
→ Ya lo estás leyendo, reemplaza matrículas si es necesario
Renombrar y limpiar archivos de configuraciónPowerShell# Renombrar para desarrollo
mv appsettings.json appsettings.Development.json

# Abrir appsettings.Development.json y BORRAR cualquier contraseña o clave JWT
# Dejar solo placeholders:
# "ConnectionStrings": { "AcademicoDb": "Server=localhost;Database=db_sys_universities;User=root;Password=TU_PASSWORD_AQUI" }
# "Jwt": { "Key": "TU_CLAVE_JWT_SEGURA_AQUI" }
Commit limpio de la configuración basePowerShellgit add appsettings.Development.json README.md
git commit -m "chore: clean secrets and update README with team info"
git push
Todos los integrantes clonan y pruebanPowerShellgit clone https://github.com/LunaCortes/UTMA-academico-equipo1.git
cd UTMA-academico-equipo1
git checkout develop→ En este punto la API NO debe arrancar (falta user-secrets). Es correcto.


ETAPA 2 – Configuración segura local (cada integrante)

Crear rama de trabajo desde developPowerShellgit checkout develop
git pull
git checkout -b refactor/secure-setup
Configurar User Secrets (NUNCA subir al repositorio)PowerShell# Inicializar user-secrets (solo una vez)
dotnet user-secrets init

# Generar clave JWT segura (32 bytes → 256 bits)
$bytes = New-Object byte[] 32
[Security.Cryptography.RandomNumberGenerator]::Create().GetBytes($bytes)
[Convert]::ToBase64String($bytes)
# → Copia el resultado

# Guardar secretos
dotnet user-secrets set "ConnectionStrings:AcademicoDb" "Server=localhost;Database=db_sys_universities;User=root;Password=TU_PASSWORD_REAL"
dotnet user-secrets set "Jwt:Key" "PEGA_AQUÍ_TU_CLAVE_BASE64"
dotnet user-secrets set "Authentication:TestApiKey" "utma_academico_dev"

# Verificar
dotnet user-secrets list
Crear base de datos MySQLPowerShellcd bd
mysql -u root -p < db_sys_universities.sql
Insertar usuario admin de prueba (contraseña hasheada con BCrypt)PowerShellmysql -u root -p < setup_admin_user.sqlEl script setup_admin_user.sql ya contiene el hash BCrypt de admin123
Cambiar en producción
Probar login y obtener tokenPowerShelldotnet runAbrir: https://localhost:7XXX/swagger (el puerto lo dice la consola)→ POST /api/auth/loginJSON{
  "usuario": "admin",
  "apiKey": "utma_academico_dev"
}→ Copia el token JWT
Verificar protección de endpoints
Sin token → GET /api/alumnos → 401 Unauthorized
Con token (Authorize → Bearer …) → 200 OK + lista de alumnos

(Opcional) Configurar colección Postman
Importar colección del repo (o crear una nueva)
Crear entorno UTMA-Dev
Añadir variable token (inicial vacío)
En el request de login → pestaña Tests:JavaScriptif (pm.response.code === 200) {
    pm.environment.set("token", pm.response.json().token);
}
En todos los requests protegidos → Header:textAuthorization: Bearer {{token}}

Commit final + Pull RequestPowerShellgit add .
git commit -m "refactor: secure setup complete

- Remove hardcoded secrets from config
- Force user-secrets usage
- Add BCrypt hashed admin user
- Full local setup documentation in README"

git push -u origin refactor/secure-setup→ Abrir PR:
base: develop
compare: refactor/secure-setup
Asignar revisores
Esperar aprobación → Merge (Delete branch)



Checklist final antes de seguir desarrollando

 Repositorio privado creado y ramas main/develop existen
 No existe ningún .git del profesor
 appsettings.json NO está en el repo (solo appsettings.Development.json con placeholders)
 User-secrets configurados en todas las máquinas
 Base de datos creada y usuario admin insertado
 Login funciona y token se genera
 Endpoints protegidos dan 401 sin token
 PR mergeado a develop
 Todos hicieron git pull en develop