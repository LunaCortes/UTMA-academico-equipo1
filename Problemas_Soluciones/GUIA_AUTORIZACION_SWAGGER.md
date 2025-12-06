# 🔐 Guía: Cómo Autorizar en Swagger

## Problema: Error 401 Unauthorized

Si obtienes error 401 después de hacer login, sigue estos pasos:

## Pasos para Autorizar Correctamente

### 1. Hacer Login
1. Ve a `POST /api/auth/login` en Swagger
2. Haz clic en **"Try it out"**
3. Ingresa las credenciales:
   ```json
   {
     "emailUsuario": "admin@clinica.com",
     "passwordUsuario": "admin123"
   }
   ```
4. Haz clic en **"Execute"**
5. **Copia el token completo** de la respuesta (campo `token`)

### 2. Autorizar en Swagger
1. **Busca el botón "Authorize"** (arriba a la derecha en Swagger, con un candado 🔒)
2. Haz clic en **"Authorize"**
3. En el campo **"Value"**, pega el token con este formato exacto:
   ```
   Bearer TU_TOKEN_AQUI
   ```
   - **IMPORTANTE**: Debe incluir la palabra "Bearer" seguida de un **espacio** y luego el token
   - Ejemplo: `Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...`
4. Haz clic en **"Authorize"**
5. Cierra el diálogo haciendo clic fuera o en "Close"

### 3. Verificar Autorización
- Deberías ver un candado **cerrado** 🔒 junto a los endpoints protegidos
- Si el candado está **abierto** 🔓, la autorización no se aplicó correctamente

### 4. Probar Endpoint Protegido
1. Ve a cualquier endpoint protegido (por ejemplo: `GET /api/pacientes`)
2. Haz clic en **"Try it out"**
3. Haz clic en **"Execute"**
4. Debería funcionar sin error 401

## Solución de Problemas

### ❌ Error: "Unauthorized" o 401
**Causas posibles:**
1. El token no se copió completo
2. Falta la palabra "Bearer" o el espacio
3. El token expiró (válido por 120 minutos)
4. El servidor no se reinició después de cambios

**Solución:**
- Genera un nuevo token haciendo login nuevamente
- Verifica que el formato sea: `Bearer TOKEN_COMPLETO`
- Reinicia el servidor si hiciste cambios

### ✅ Verificar que Funciona
Si ves una respuesta 200 OK con datos, la autorización está funcionando correctamente.

## Ejemplo Visual

```
1. Login → Obtener token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
2. Authorize → Pegar: "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
3. Probar endpoint → Debería funcionar ✅
```

