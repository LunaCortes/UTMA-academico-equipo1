# 🔧 Configurar Conexión a MySQL

## Error Actual
```
Access denied for user 'root'@'localhost' (using password: YES)
```

Esto significa que la contraseña de MySQL en `appsettings.Development.json` no es correcta.

## Solución

### Opción 1: Actualizar appsettings.Development.json (Rápido)

1. Abre `appsettings.Development.json`
2. Reemplaza `TU_PASSWORD_AQUI` con tu contraseña real de MySQL:
   ```json
   "ConnectionStrings": {
     "AcademicoDb": "Server=localhost;Database=sistemaGestionCitasMedicas;User=root;Password=TU_CONTRASEÑA_REAL"
   }
   ```

### Opción 2: Usar User-Secrets (Recomendado - Más Seguro) ✅

1. Configura la cadena de conexión en user-secrets:
   ```powershell
   dotnet user-secrets set "ConnectionStrings:AcademicoDb" "Server=localhost;Database=sistemaGestionCitasMedicas;User=root;Password=TU_CONTRASEÑA_REAL"
   ```

2. Deja el appsettings.Development.json con un placeholder:
   ```json
   "ConnectionStrings": {
     "AcademicoDb": "RELLENAR_CON_USER_SECRETS"
   }
   ```

### Verificar la Contraseña Correcta

Para verificar cuál es tu contraseña de MySQL, intenta conectarte:

```powershell
# Prueba sin contraseña (si MySQL no tiene contraseña)
mysql -u root -e "SELECT 1;"

# O prueba con diferentes contraseñas comunes
mysql -u root -p -e "SELECT 1;"
# (te pedirá la contraseña interactivamente)
```

### Si No Recuerdas la Contraseña

1. **Reiniciar MySQL y cambiar contraseña:**
   - Detén el servicio MySQL
   - Inicia MySQL en modo seguro
   - Cambia la contraseña del usuario root

2. **O crea un nuevo usuario:**
   ```sql
   CREATE USER 'app_user'@'localhost' IDENTIFIED BY 'nueva_contraseña';
   GRANT ALL PRIVILEGES ON sistemaGestionCitasMedicas.* TO 'app_user'@'localhost';
   FLUSH PRIVILEGES;
   ```

## Después de Configurar

1. Reinicia el servidor:
   ```powershell
   dotnet run --project utma-academico-aspnetcore.csproj
   ```

2. Verifica que funcione abriendo Swagger:
   - `https://localhost:5001/swagger` o `https://localhost:5000/swagger`

