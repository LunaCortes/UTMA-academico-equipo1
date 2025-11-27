-- ============================================================
-- Script: Insertar usuario admin de prueba con contraseña hasheada
-- Fecha: Noviembre 2025
-- Propósito: Crear usuario de prueba para testing de autenticación
-- ============================================================

-- Nota: Las contraseñas en este script se deben generar con hash BCrypt
-- Ejemplo: contraseña "admin123" hasheada con BCrypt
-- 
-- Para generar un hash BCrypt, usa online en https://bcrypt.online/
-- o en PowerShell:
-- $password = "admin123"
-- $hash = [System.Security.Cryptography.HashAlgorithm]::Create("SHA1").ComputeHash([System.Text.Encoding]::UTF8.GetBytes($password))
-- [System.Convert]::ToHexString($hash)

-- Verificar si existe usuario admin
SELECT * FROM `cat_usuarios` WHERE `tUsuario` = 'admin';

-- Opción 1: Actualizar si existe
UPDATE `cat_usuarios`
SET 
    `tNombre` = 'Administrador del Sistema',
    `tCorreo` = 'admin@utma.edu.mx',
    `tPassword` = SHA1('admin123'),  -- ⚠️ CAMBIAR CONTRASEÑA EN PRODUCCIÓN
    `bAdmin` = 1,
    `tCodEstatus` = 'AC',
    `fhFechaActualizacion` = NOW()
WHERE `tUsuario` = 'admin';

-- Opción 2: Insertar si no existe
INSERT IGNORE INTO `cat_usuarios` (
    `eCodEmpresa`,
    `eCodDepartamento`,
    `eCodPerfil`,
    `bAdmin`,
    `tNombre`,
    `tCorreo`,
    `tUsuario`,
    `tPassword`,
    `tCodEstatus`,
    `fhFechaRegistro`
) VALUES (
    1,                                   -- Empresa
    1,                                   -- Departamento (SISTEMAS)
    1,                                   -- Perfil (SuperAdmin)
    1,                                   -- Es admin
    'Administrador del Sistema',         -- Nombre
    'admin@utma.edu.mx',                 -- Email
    'admin',                             -- Usuario (login)
    SHA1('admin123'),                    -- Contraseña hasheada (CAMBIAR EN PRODUCCIÓN)
    'AC',                                -- Estatus (Activo)
    NOW()                                -- Fecha de registro
);

-- Verificar que se insertó correctamente
SELECT `eCodUsuario`, `tUsuario`, `tNombre`, `tCorreo`, `bAdmin`, `tCodEstatus` 
FROM `cat_usuarios` 
WHERE `tUsuario` = 'admin';

-- ============================================================
-- ⚠️ IMPORTANTE PARA PRODUCCIÓN:
-- ============================================================
-- 1. Cambiar contraseña "admin123" por una más segura
-- 2. Usar BCrypt en lugar de SHA1 para mejor seguridad
-- 3. Revise el servicio JwtService para implementar validación de contraseña
-- 4. Nunca subir este script con contraseña real al repositorio
-- ============================================================
