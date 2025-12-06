-- Script simple para crear un nuevo usuario
-- IMPORTANTE: Las contraseñas deben estar hasheadas con BCrypt
-- Para generar el hash, usa: https://bcrypt.online/ o el script C# GenerarHashUsuario.cs

-- Ejemplo: Crear usuario administrador
-- Contraseña: admin123
-- Hash BCrypt (generado en https://bcrypt.online/): 
-- $2a$11$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy

USE sistemaGestionCitasMedicas;

-- Insertar nuevo usuario administrador
INSERT INTO usuarios (nombreUsuario, emailUsuario, passwordUsuario, idRol, activo, fechaCreacion, fechaActualizacion)
VALUES (
    'nuevo_admin',                    -- Cambia el nombre de usuario
    'nuevo_admin@clinica.com',        -- Cambia el email
    '$2a$11$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy',  -- Hash de "admin123" - GENERA UNO NUEVO
    1,                                  -- 1=Administrador, 2=Médico, 3=Paciente, 4=Recepcionista
    TRUE,
    NOW(),
    NOW()
);

-- Verificar que se creó
SELECT idUsuario, nombreUsuario, emailUsuario, idRol, activo 
FROM usuarios 
WHERE emailUsuario = 'nuevo_admin@clinica.com';

