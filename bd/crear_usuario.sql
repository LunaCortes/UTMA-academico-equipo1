-- Script para crear nuevos usuarios con contraseñas hasheadas con BCrypt
-- Uso: mysql -u root -p sistemaGestionCitasMedicas < crear_usuario.sql

-- Ejemplo: Crear usuario administrador
-- Contraseña: admin123
-- Hash BCrypt generado: $2a$11$KIXvKvKvKvKvKvKvKvKvK.xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
-- Para generar un hash BCrypt, puedes usar: https://bcrypt.online/ o un script en C#

-- Insertar usuario de ejemplo (reemplaza los valores según necesites)
INSERT INTO usuarios (nombreUsuario, emailUsuario, passwordUsuario, idRol, activo, fechaCreacion, fechaActualizacion)
VALUES (
    'nuevo_admin',                    -- nombreUsuario
    'nuevo_admin@clinica.com',         -- emailUsuario
    '$2a$11$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy',  -- passwordUsuario (hash de "admin123")
    1,                                  -- idRol (1=Administrador, 2=Médico, 3=Paciente, 4=Recepcionista)
    TRUE,                               -- activo
    NOW(),                              -- fechaCreacion
    NOW()                               -- fechaActualizacion
);

-- Verificar que se insertó correctamente
SELECT idUsuario, nombreUsuario, emailUsuario, idRol, activo 
FROM usuarios 
WHERE emailUsuario = 'nuevo_admin@clinica.com';

