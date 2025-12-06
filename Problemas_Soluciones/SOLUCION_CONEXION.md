# 🔧 Solución: Error de Conexión a MySQL

## Error Actual
```
Access denied for user 'root'@'localhost' (using password: YES)
```

## ✅ Solución Rápida

El servidor necesita **reiniciarse** para tomar la nueva configuración de contraseña.

### Pasos:

1. **Detén el servidor actual:**
   - Ve a la terminal donde está corriendo el servidor
   - Presiona `Ctrl + C` para detenerlo

2. **Reinicia el servidor:**
   ```powershell
   dotnet run --project utma-academico-aspnetcore.csproj
   ```

3. **Verifica que funcione:**
   - Abre: `http://localhost:5234/swagger/index.html`
   - Intenta hacer login

## 🔍 Verificar la Contraseña

Si el error persiste después de reiniciar, verifica tu contraseña de MySQL:

```powershell
# Prueba la contraseña directamente
mysql -u root -p12345678 -e "SELECT 1;"
```

Si este comando funciona, la contraseña es correcta y solo necesitas reiniciar el servidor.

## 🔐 Alternativa: Usar User-Secrets (Más Seguro)

Si prefieres no tener la contraseña en el archivo, usa user-secrets:

```powershell
# Configurar la cadena de conexión en user-secrets
dotnet user-secrets set "ConnectionStrings:AcademicoDb" "Server=localhost;Database=sistemaGestionCitasMedicas;User=root;Password=12345678"
```

Luego actualiza `appsettings.Development.json`:
```json
{
  "ConnectionStrings": {
    "AcademicoDb": "RELLENAR_CON_USER_SECRETS"
  }
}
```

## ⚠️ Si la Contraseña es Diferente

Si tu contraseña de MySQL NO es `12345678`, actualiza el archivo `appsettings.Development.json`:

```json
{
  "ConnectionStrings": {
    "AcademicoDb": "Server=localhost;Database=sistemaGestionCitasMedicas;User=root;Password=TU_CONTRASEÑA_REAL"
  }
}
```

Y luego **reinicia el servidor**.

