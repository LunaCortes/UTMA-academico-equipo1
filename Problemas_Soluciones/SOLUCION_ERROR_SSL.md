# 🔒 Solución: Error SSL WRONG_VERSION_NUMBER

## Problema

```
EPROTO 312448:error:100000f7:SSL routines:OPENSSL_internal:WRONG_VERSION_NUMBER
```

Este error ocurre cuando hay una **incompatibilidad entre HTTP y HTTPS**:
- Intentas conectarte con **HTTPS** a un servidor que solo escucha en **HTTP**
- O intentas conectarte con **HTTP** a un servidor que solo escucha en **HTTPS**
- El certificado SSL no está configurado correctamente

---

## 🔍 Diagnóstico

### Verificar en qué puerto está corriendo el servidor

Cuando ejecutas `dotnet run`, la consola muestra:
```
Now listening on: https://localhost:7275
Now listening on: http://localhost:5234
```

**IMPORTANTE:** Usa la URL correcta según el protocolo:
- Si dice `https://localhost:XXXX` → Usa **HTTPS**
- Si dice `http://localhost:XXXX` → Usa **HTTP**

---

## ✅ Soluciones

### Solución 1: Usar HTTP en Desarrollo (Recomendado)

Si estás en desarrollo y no necesitas HTTPS, puedes deshabilitar la redirección HTTPS:

#### Opción A: Ejecutar solo en HTTP

Edita `Properties/launchSettings.json` y cambia el perfil por defecto:

```json
{
  "profiles": {
    "http": {
      "commandName": "Project",
      "dotnetRunMessages": true,
      "launchBrowser": true,
      "launchUrl": "swagger",
      "applicationUrl": "http://localhost:5234",
      "environmentVariables": {
        "ASPNETCORE_ENVIRONMENT": "Development"
      }
    }
  }
}
```

Ejecuta con:
```powershell
dotnet run --project utma-academico-aspnetcore.csproj --launch-profile http
```

#### Opción B: Deshabilitar redirección HTTPS temporalmente

En `Program.cs`, comenta temporalmente la línea:

```csharp
// app.UseHttpsRedirection();  // Comentado para desarrollo
```

**⚠️ IMPORTANTE:** Solo haz esto en desarrollo. En producción siempre usa HTTPS.

---

### Solución 2: Usar HTTPS Correctamente

Si quieres usar HTTPS, asegúrate de:

1. **Confiar en el certificado de desarrollo de .NET:**
   ```powershell
   dotnet dev-certs https --trust
   ```

2. **Verificar que el certificado existe:**
   ```powershell
   dotnet dev-certs https --check
   ```

3. **Regenerar el certificado si es necesario:**
   ```powershell
   dotnet dev-certs https --clean
   dotnet dev-certs https --trust
   ```

4. **Usar la URL HTTPS correcta:**
   - Si el servidor muestra `https://localhost:7275`
   - Usa exactamente esa URL: `https://localhost:7275/swagger`

---

### Solución 3: Configurar el Perfil Correcto

El proyecto tiene dos perfiles en `launchSettings.json`:

- **`http`**: Solo HTTP en puerto 5234
- **`https`**: HTTP y HTTPS en puertos 5234 y 7275

Para usar solo HTTP:
```powershell
dotnet run --project utma-academico-aspnetcore.csproj --launch-profile http
```

Para usar HTTPS:
```powershell
dotnet run --project utma-academico-aspnetcore.csproj --launch-profile https
```

---

### Solución 4: Actualizar URLs en Archivos de Prueba

Si estás usando `PRUEBAS_ENDPOINTS.http` o Postman:

#### Para HTTP:
```http
@baseUrl = http://localhost:5234
```

#### Para HTTPS:
```http
@baseUrl = https://localhost:7275
```

**Asegúrate de usar el protocolo correcto según el puerto que esté escuchando el servidor.**

---

## 🧪 Verificación

### Paso 1: Verificar qué está escuchando el servidor

Ejecuta:
```powershell
dotnet run --project utma-academico-aspnetcore.csproj
```

Observa la salida:
```
Now listening on: https://localhost:7275
Now listening on: http://localhost:5234
```

### Paso 2: Probar la conexión

#### Si el servidor está en HTTP:
- Abre: `http://localhost:5234/swagger`
- En archivos `.http`: usa `http://localhost:5234`

#### Si el servidor está en HTTPS:
- Abre: `https://localhost:7275/swagger`
- En archivos `.http`: usa `https://localhost:7275`
- Acepta el certificado de desarrollo si el navegador lo solicita

---

## 🔧 Configuración Recomendada para Desarrollo

### Para Desarrollo Local (HTTP)

1. **Ejecutar solo en HTTP:**
   ```powershell
   dotnet run --project utma-academico-aspnetcore.csproj --launch-profile http
   ```

2. **Usar URLs HTTP:**
   - Swagger: `http://localhost:5234/swagger`
   - API: `http://localhost:5234/api/...`

3. **Actualizar archivos de prueba:**
   ```http
   @baseUrl = http://localhost:5234
   ```

### Para Desarrollo con HTTPS

1. **Confiar en certificado de desarrollo:**
   ```powershell
   dotnet dev-certs https --trust
   ```

2. **Ejecutar con perfil HTTPS:**
   ```powershell
   dotnet run --project utma-academico-aspnetcore.csproj --launch-profile https
   ```

3. **Usar URLs HTTPS:**
   - Swagger: `https://localhost:7275/swagger`
   - API: `https://localhost:7275/api/...`

---

## ⚠️ Notas Importantes

1. **En desarrollo:** HTTP es suficiente y más simple
2. **En producción:** Siempre usa HTTPS
3. **JWT funciona en ambos:** El token JWT funciona tanto en HTTP como HTTPS
4. **Swagger funciona en ambos:** Swagger está disponible en HTTP y HTTPS

---

## 🐛 Si el Problema Persiste

1. **Reinicia el servidor** después de cambiar la configuración
2. **Limpia la caché del navegador** si estás usando Swagger
3. **Verifica que no haya otro proceso** usando el mismo puerto
4. **Revisa el firewall** si el problema persiste

---

## 📝 Resumen Rápido

**Para desarrollo rápido (HTTP):**
```powershell
# 1. Ejecutar en HTTP
dotnet run --project utma-academico-aspnetcore.csproj --launch-profile http

# 2. Abrir en navegador
http://localhost:5234/swagger
```

**Para desarrollo con HTTPS:**
```powershell
# 1. Confiar en certificado
dotnet dev-certs https --trust

# 2. Ejecutar en HTTPS
dotnet run --project utma-academico-aspnetcore.csproj --launch-profile https

# 3. Abrir en navegador
https://localhost:7275/swagger
```

