# 🔐 Ejemplo: Cómo Usar Bearer Token en Swagger

## Paso 1: Obtener el Token

Haz login en `POST /api/auth/login` con:
```json
{
  "emailUsuario": "admin@clinica.com",
  "passwordUsuario": "admin123"
}
```

**Respuesta ejemplo:**
```json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxIiwiZW1haWwiOiJhZG1pbkBjbGluaWNhLmNvbSIsInJvbGUiOiJBZG1pbmlzdHJhZG9yIiwibmFtZSI6ImFkbWluQGNsaW5pY2EuY29tIiwiaWRVc3VhcmlvIjoiMSIsImp0aSI6ImFiYzEyMy1kZWY0NTYtNzg5MCIsImV4cCI6MTczMzQ1Njc4MH0.xyz123abc456def789",
  "expiresAt": "2024-12-05T15:30:00Z"
}
```

## Paso 2: Copiar el Token

Copia **SOLO** la parte del token (sin las comillas):
```
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxIiwiZW1haWwiOiJhZG1pbkBjbGluaWNhLmNvbSIsInJvbGUiOiJBZG1pbmlzdHJhZG9yIiwibmFtZSI6ImFkbWluQGNsaW5pY2EuY29tIiwiaWRVc3VhcmlvIjoiMSIsImp0aSI6ImFiYzEyMy1kZWY0NTYtNzg5MCIsImV4cCI6MTczMzQ1Njc4MH0.xyz123abc456def789
```

## Paso 3: Autorizar en Swagger

1. Haz clic en el botón **"Authorize"** 🔒 (arriba a la derecha)

2. En el campo **"Value"**, pega esto (incluyendo la palabra "Bearer" y un espacio):

```
Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxIiwiZW1haWwiOiJhZG1pbkBjbGluaWNhLmNvbSIsInJvbGUiOiJBZG1pbmlzdHJhZG9yIiwibmFtZSI6ImFkbWluQGNsaW5pY2EuY29tIiwiaWRVc3VhcmlvIjoiMSIsImp0aSI6ImFiYzEyMy1kZWY0NTYtNzg5MCIsImV4cCI6MTczMzQ1Njc4MH0.xyz123abc456def789
```

## ⚠️ IMPORTANTE

### ✅ Formato CORRECTO:
```
Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```
- Palabra "Bearer" (con B mayúscula)
- Un **espacio** después de "Bearer"
- El token completo sin comillas

### ❌ Formatos INCORRECTOS:
```
Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...  ❌ Sin espacio
bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...  ❌ "bearer" minúscula (aunque debería funcionar)
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...         ❌ Sin "Bearer"
"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..." ❌ Con comillas
```

## Ejemplo Visual en Swagger

Cuando hagas clic en "Authorize", verás un diálogo como este:

```
┌─────────────────────────────────────────┐
│ Available authorizations                │
├─────────────────────────────────────────┤
│ Bearer (JWT)                            │
│                                         │
│ Value: [Bearer eyJhbGciOiJIUzI1NiIs...]│
│                                         │
│         [Authorize]  [Close]            │
└─────────────────────────────────────────┘
```

## Verificar que Funcionó

Después de autorizar:
- Los endpoints protegidos mostrarán un candado cerrado 🔒
- Al probar un endpoint, deberías ver respuesta 200 OK en lugar de 401

## Ejemplo Completo

**1. Login:**
```json
POST /api/auth/login
{
  "emailUsuario": "admin@clinica.com",
  "passwordUsuario": "admin123"
}
```

**2. Respuesta:**
```json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxIiwiZW1haWwiOiJhZG1pbkBjbGluaWNhLmNvbSIsInJvbGUiOiJBZG1pbmlzdHJhZG9yIiwibmFtZSI6ImFkbWluQGNsaW5pY2EuY29tIiwiaWRVc3VhcmlvIjoiMSIsImp0aSI6ImFiYzEyMy1kZWY0NTYtNzg5MCIsImV4cCI6MTczMzQ1Njc4MH0.xyz123abc456def789",
  "expiresAt": "2024-12-05T15:30:00Z"
}
```

**3. En "Authorize", pegar:**
```
Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxIiwiZW1haWwiOiJhZG1pbkBjbGluaWNhLmNvbSIsInJvbGUiOiJBZG1pbmlzdHJhZG9yIiwibmFtZSI6ImFkbWluQGNsaW5pY2EuY29tIiwiaWRVc3VhcmlvIjoiMSIsImp0aSI6ImFiYzEyMy1kZWY0NTYtNzg5MCIsImV4cCI6MTczMzQ1Njc4MH0.xyz123abc456def789
```

**4. Probar endpoint:**
```
GET /api/pacientes
→ Debería devolver 200 OK con la lista de pacientes
```

