# 🔒 Solución: Error 401 Unauthorized después del Login

## Problema
Aunque el login funciona y genera un token, al intentar usar endpoints protegidos aparece error 401 Unauthorized.

## Posibles Causas y Soluciones

### 1. ✅ Verificar que el token se esté enviando correctamente

En Swagger:
1. Haz login en `POST /api/auth/login`
2. Copia el token de la respuesta
3. Haz clic en el botón **"Authorize"** (arriba a la derecha en Swagger)
4. Pega el token con el formato: `Bearer TU_TOKEN_AQUI`
   - **IMPORTANTE**: Debe incluir la palabra "Bearer" seguida de un espacio y luego el token
5. Haz clic en "Authorize"
6. Cierra el diálogo
7. Prueba cualquier endpoint protegido

### 2. ✅ Verificar formato del token en el header

El header debe ser exactamente:
```
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

**NO** debe ser:
- `BearerTU_TOKEN` (sin espacio)
- `TU_TOKEN` (sin "Bearer")
- `bearer TU_TOKEN` (minúsculas, aunque debería funcionar)

### 3. ✅ Verificar configuración de Issuer/Audience

He corregido la configuración para que coincida:
- **Issuer**: "UTMA" (en appsettings.Development.json)
- **Audience**: "UTMA" (en appsettings.Development.json)

### 4. ✅ Verificar que el token no haya expirado

Los tokens expiran después de 120 minutos (2 horas) por defecto. Si el token es viejo, genera uno nuevo.

## Pasos para Probar

1. **Reinicia el servidor** (para aplicar los cambios de configuración):
   ```powershell
   # Detén el servidor (Ctrl+C)
   dotnet run --project utma-academico-aspnetcore.csproj
   ```

2. **Haz login nuevamente**:
   - Endpoint: `POST /api/auth/login`
   - Body:
   ```json
   {
     "emailUsuario": "admin@clinica.com",
     "passwordUsuario": "admin123"
   }
   ```

3. **Autoriza en Swagger**:
   - Copia el token completo
   - Haz clic en "Authorize"
   - Pega: `Bearer TU_TOKEN_COMPLETO_AQUI`
   - Haz clic en "Authorize"

4. **Prueba un endpoint protegido**:
   - Por ejemplo: `GET /api/pacientes`
   - Debería funcionar sin error 401

## Si el problema persiste

Verifica en la consola del servidor si hay errores de validación del token. Los errores comunes son:
- Token expirado
- Issuer/Audience no coinciden
- Firma del token inválida

