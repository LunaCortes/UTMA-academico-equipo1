-- Script para crear usuario adminLuna directamente en la base de datos
-- IMPORTANTE: Este script crea el usuario con un hash BCrypt temporal
-- Después de ejecutar, usa la API para cambiar la contraseña o actualiza el hash

USE sistemaGestionCitasMedicas;

-- Primero, verificar si el usuario ya existe
SELECT * FROM usuarios WHERE emailUsuario = 'adminLun@gmail.com';

-- Si no existe, insertar el usuario
-- NOTA: El hash BCrypt debe generarse. Usa https://bcrypt.online/ con contraseña "admin29"
-- O usa el endpoint POST /api/usuarios después de hacer login como admin

-- Hash BCrypt para "admin29" (generado en https://bcrypt.online/):
-- $2a$11$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy es para "admin123"
-- Necesitas generar uno nuevo para "admin29"

INSERT INTO usuarios (nombreUsuario, emailUsuario, passwordUsuario, idRol, activo, fechaCreacion, fechaActualizacion)
SELECT 
    'adminLuna',
    'adminLun@gmail.com',
    '$2a$11$REEMPLAZAR_CON_HASH_BCRYPT_DE_ADMIN29',  -- ⚠️ REEMPLAZA ESTE HASH
    1,  -- Administrador
    TRUE,
    NOW(),
    NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM usuarios WHERE emailUsuario = 'adminLun@gmail.com'
);

-- Verificar creación
SELECT idUsuario, nombreUsuario, emailUsuario, idRol, activo 
FROM usuarios 
WHERE emailUsuario = 'adminLun@gmail.com';

