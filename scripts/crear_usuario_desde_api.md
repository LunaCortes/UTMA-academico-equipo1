# Crear Usuario desde la API

## Opción 1: Usar Swagger

1. Inicia el servidor: `dotnet run`
2. Abre Swagger: `https://localhost:XXXXX/swagger`
3. Primero haz login como administrador:
   - Endpoint: `POST /api/auth/login`
   - Body:
   ```json
   {
     "emailUsuario": "admin@clinica.com",
     "passwordUsuario": "admin123"
   }
   ```
4. Copia el token de la respuesta
5. Haz clic en "Authorize" en Swagger y pega: `Bearer TU_TOKEN_AQUI`
6. Crea el usuario:
   - Endpoint: `POST /api/usuarios`
   - Body:
   ```json
   {
     "nombreUsuario": "nuevo_usuario",
     "emailUsuario": "nuevo@clinica.com",
     "passwordUsuario": "contraseña123",
     "idRol": 1
   }
   ```

## Opción 2: Usar cURL o Postman

```bash
# 1. Login
curl -X POST https://localhost:XXXXX/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"emailUsuario":"admin@clinica.com","passwordUsuario":"admin123"}'

# 2. Crear usuario (reemplaza TOKEN con el token obtenido)
curl -X POST https://localhost:XXXXX/api/usuarios \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer TOKEN" \
  -d '{
    "nombreUsuario": "nuevo_usuario",
    "emailUsuario": "nuevo@clinica.com",
    "passwordUsuario": "contraseña123",
    "idRol": 1
  }'
```

## Roles disponibles:
- 1 = Administrador
- 2 = Médico
- 3 = Paciente
- 4 = Recepcionista

