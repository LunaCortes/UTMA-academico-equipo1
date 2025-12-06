# Guía para Crear Nuevos Usuarios

Hay 3 formas de crear usuarios en el sistema:

## Método 1: Usar la API (RECOMENDADO) ✅

Este es el método más fácil y seguro, ya que el sistema genera automáticamente el hash BCrypt.

### Pasos:

1. **Inicia el servidor:**
   ```powershell
   dotnet run --project utma-academico-aspnetcore.csproj
   ```

2. **Abre Swagger:**
   - Ve a: `https://localhost:XXXXX/swagger`

3. **Haz login como administrador:**
   - Endpoint: `POST /api/auth/login`
   - Body:
   ```json
   {
     "emailUsuario": "admin@clinica.com",
     "passwordUsuario": "admin123"
   }
   ```
   - Copia el `token` de la respuesta

4. **Autoriza en Swagger:**
   - Haz clic en el botón **"Authorize"** (arriba a la derecha)
   - Pega: `Bearer TU_TOKEN_AQUI`
   - Haz clic en "Authorize"

5. **Crea el usuario:**
   - Endpoint: `POST /api/usuarios`
   - Body:
   ```json
   {
     "nombreUsuario": "nuevo_usuario",
     "emailUsuario": "nuevo@clinica.com",
     "passwordUsuario": "mi_contraseña_segura",
     "idRol": 1
   }
   ```

### Roles disponibles:
- `1` = Administrador
- `2` = Médico  
- `3` = Paciente
- `4` = Recepcionista

---

## Método 2: Usar SQL directamente

Si prefieres insertar directamente en la base de datos:

1. **Genera el hash BCrypt de tu contraseña:**
   - Visita: https://bcrypt.online/
   - Ingresa tu contraseña
   - Copia el hash generado

2. **Ejecuta el SQL:**
   ```sql
   USE sistemaGestionCitasMedicas;
   
   INSERT INTO usuarios (nombreUsuario, emailUsuario, passwordUsuario, idRol, activo, fechaCreacion, fechaActualizacion)
   VALUES (
       'nombre_usuario',
       'email@clinica.com',
       'HASH_BCRYPT_AQUI',  -- Pega el hash generado en bcrypt.online
       1,                    -- Rol: 1=Admin, 2=Médico, 3=Paciente, 4=Recepcionista
       TRUE,
       NOW(),
       NOW()
   );
   ```

3. **Ejecuta desde PowerShell:**
   ```powershell
   mysql -u root -p12345678 sistemaGestionCitasMedicas < crear_usuario_simple.sql
   ```

---

## Método 3: Script C# para generar hash

Si tienes un proyecto C#:

```csharp
using BCrypt.Net;

string password = "mi_contraseña";
string hash = BCrypt.Net.BCrypt.HashPassword(password);
Console.WriteLine($"Hash: {hash}");
```

---

## ⚠️ IMPORTANTE

- **Nunca** insertes contraseñas en texto plano
- **Siempre** usa BCrypt para hashear contraseñas
- El método 1 (API) es el más seguro porque genera el hash automáticamente

