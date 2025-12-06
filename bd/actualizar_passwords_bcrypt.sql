-- Script SQL para actualizar contraseñas con hashes BCrypt
USE sistemaGestionCitasMedicas;

-- Contraseña: admin123 (usuario: admin@clinica.com)
UPDATE usuarios SET passwordUsuario = '$2a$11$xRgvGVjjO.wYkGz0s4gXv.E6ezYuhO7MIiFHh/l1vOTTl0jOq/ena' WHERE emailUsuario = 'admin@clinica.com';

-- Contraseña: medico123 (usuario: martinez@clinica.com)
UPDATE usuarios SET passwordUsuario = '$2a$11$DaOQDAbmKXtfKdW4dau5Z.83ClkQBWcsy/hh54tdtRB8rC4X/beMe' WHERE emailUsuario = 'martinez@clinica.com';

-- Contraseña: paciente123 (usuario: juan.perez@email.com)
UPDATE usuarios SET passwordUsuario = '$2a$11$ROgVqbN6anMA8U6dVhhhm.prt.LuVPRS4zLh2y2KpRW7cm8sbGOfq' WHERE emailUsuario = 'juan.perez@email.com';

-- Contraseña: recep123 (usuario: recepcion@clinica.com)
UPDATE usuarios SET passwordUsuario = '$2a$11$jGuX4wDE7MmZySzKV6Jxj.hOtjeb/DlFLcnkl7RD5m.QXFhBMmL1a' WHERE emailUsuario = 'recepcion@clinica.com';

-- Verificar actualización
SELECT idUsuario, nombreUsuario, emailUsuario, LEFT(passwordUsuario, 30) as hash_preview FROM usuarios;
