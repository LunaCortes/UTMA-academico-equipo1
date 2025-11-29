-- ============================================================
-- SEED DATA - UTMA Académico
--  - 20 alumnos de ejemplo (pro_alumnos)
--  - 120 calificaciones de ejemplo (pro_calificaciones)
-- 
-- NOTAS:
-- 1) Ejecutar DESPUÉS de db_sys_universities.sql
-- 2) Asegúrate de que la BD seleccionada sea db_sys_universities
-- 3) Los IDs se asumen autoincrementales empezando después de los datos existentes
--    Si la BD ya tiene alumnos/calificaciones, ajusta los IDs o limpia las tablas.
-- ============================================================

USE db_sys_universities;

SET FOREIGN_KEY_CHECKS = 0;

-- ------------------------------------------------------------
-- 1) ALUMNOS (pro_alumnos)
--    Columnas principales según el modelo:
--      eCodAlumno (PK, AUTO_INCREMENT)
--      tMatricula, tNombre, tApellidoPaterno, tApellidoMaterno,
--      tGrupo, tTurno, fhFechaRegistro, tCodEstatus
-- ------------------------------------------------------------

INSERT INTO pro_alumnos
    (tMatricula, tNombre, tApellidoPaterno, tApellidoMaterno, tGrupo, tTurno, fhFechaRegistro, tCodEstatus)
VALUES
    ('A0001', 'Ana',       'López',     'García',   '1A', 'M', NOW(), 'AC'),
    ('A0002', 'Bruno',     'Martínez',  'Santos',   '1A', 'M', NOW(), 'AC'),
    ('A0003', 'Carla',     'Hernández', 'Ruiz',     '1A', 'M', NOW(), 'AC'),
    ('A0004', 'Diego',     'Ramírez',   'Torres',   '1A', 'M', NOW(), 'AC'),
    ('A0005', 'Elena',     'Jiménez',   'Flores',   '1B', 'M', NOW(), 'AC'),
    ('A0006', 'Fernando',  'Rojas',     'Cortés',   '1B', 'M', NOW(), 'AC'),
    ('A0007', 'Gabriela',  'Castillo',  'Vega',     '1B', 'M', NOW(), 'AC'),
    ('A0008', 'Hugo',      'Díaz',      'Serrano',  '1B', 'M', NOW(), 'AC'),
    ('A0009', 'Isabel',    'Ruvalcaba', 'Morales',  '2A', 'V', NOW(), 'AC'),
    ('A0010','Jorge',      'Núñez',     'Aguilar',  '2A', 'V', NOW(), 'AC'),
    ('A0011','Karen',      'Pérez',     'Luna',     '2A', 'V', NOW(), 'AC'),
    ('A0012','Luis',       'Gómez',     'Rivas',    '2A', 'V', NOW(), 'AC'),
    ('A0013','María',      'Ortiz',     'Beltrán',  '2B', 'V', NOW(), 'AC'),
    ('A0014','Nicolás',    'Sánchez',   'Campos',   '2B', 'V', NOW(), 'AC'),
    ('A0015','Olga',       'Vázquez',   'Cano',     '2B', 'V', NOW(), 'AC'),
    ('A0016','Pablo',      'Domínguez', 'Fuentes',  '2B', 'V', NOW(), 'AC'),
    ('A0017','Quetzal',    'Reyes',     'Ibarra',   '3A', 'M', NOW(), 'AC'),
    ('A0018','Rocío',      'Silva',     'Navarro',  '3A', 'M', NOW(), 'AC'),
    ('A0019','Sergio',     'Cárdenas',  'Mendoza',  '3B', 'M', NOW(), 'AC'),
    ('A0020','Teresa',     'Lara',      'Pacheco',  '3B', 'M', NOW(), 'AC');

-- ------------------------------------------------------------
-- 2) CALIFICACIONES (pro_calificaciones)
--    Columnas principales según el modelo:
--      eCodCalificacion (PK, AUTO_INCREMENT)
--      eCodAlumno, eCodMateria, eParcial, dCalificacion,
--      tTipo, fhFecha, tCodEstatus
--
--    Suposiciones:
--      - Existen al menos 3 materias con IDs: 1, 2, 3
--      - Asignamos 2 materias * 3 parciales * ~20 alumnos = 120 registros
-- ------------------------------------------------------------

-- Alumno 1–10: materias 1 y 2, parciales 1–3
INSERT INTO pro_calificaciones
    (eCodAlumno, eCodMateria, eParcial, dCalificacion, tTipo, fhFecha, tCodEstatus)
VALUES
    -- Alumno 1
    (1, 1, 1, 85, 'OR', NOW(), 'AC'),
    (1, 1, 2, 88, 'OR', NOW(), 'AC'),
    (1, 1, 3, 90, 'OR', NOW(), 'AC'),
    (1, 2, 1, 78, 'OR', NOW(), 'AC'),
    (1, 2, 2, 80, 'OR', NOW(), 'AC'),
    (1, 2, 3, 82, 'OR', NOW(), 'AC'),

    -- Alumno 2
    (2, 1, 1, 70, 'OR', NOW(), 'AC'),
    (2, 1, 2, 75, 'OR', NOW(), 'AC'),
    (2, 1, 3, 72, 'OR', NOW(), 'AC'),
    (2, 2, 1, 68, 'OR', NOW(), 'AC'),
    (2, 2, 2, 71, 'OR', NOW(), 'AC'),
    (2, 2, 3, 74, 'OR', NOW(), 'AC'),

    -- Alumno 3
    (3, 1, 1, 92, 'OR', NOW(), 'AC'),
    (3, 1, 2, 90, 'OR', NOW(), 'AC'),
    (3, 1, 3, 95, 'OR', NOW(), 'AC'),
    (3, 2, 1, 88, 'OR', NOW(), 'AC'),
    (3, 2, 2, 91, 'OR', NOW(), 'AC'),
    (3, 2, 3, 93, 'OR', NOW(), 'AC'),

    -- Alumno 4
    (4, 1, 1, 65, 'OR', NOW(), 'AC'),
    (4, 1, 2, 70, 'OR', NOW(), 'AC'),
    (4, 1, 3, 68, 'OR', NOW(), 'AC'),
    (4, 2, 1, 72, 'OR', NOW(), 'AC'),
    (4, 2, 2, 74, 'OR', NOW(), 'AC'),
    (4, 2, 3, 76, 'OR', NOW(), 'AC'),

    -- Alumno 5
    (5, 1, 1, 88, 'OR', NOW(), 'AC'),
    (5, 1, 2, 86, 'OR', NOW(), 'AC'),
    (5, 1, 3, 90, 'OR', NOW(), 'AC'),
    (5, 2, 1, 82, 'OR', NOW(), 'AC'),
    (5, 2, 2, 84, 'OR', NOW(), 'AC'),
    (5, 2, 3, 87, 'OR', NOW(), 'AC'),

    -- Alumno 6
    (6, 1, 1, 55, 'OR', NOW(), 'AC'),
    (6, 1, 2, 60, 'OR', NOW(), 'AC'),
    (6, 1, 3, 58, 'OR', NOW(), 'AC'),
    (6, 2, 1, 62, 'OR', NOW(), 'AC'),
    (6, 2, 2, 65, 'OR', NOW(), 'AC'),
    (6, 2, 3, 67, 'OR', NOW(), 'AC'),

    -- Alumno 7
    (7, 1, 1, 95, 'OR', NOW(), 'AC'),
    (7, 1, 2, 96, 'OR', NOW(), 'AC'),
    (7, 1, 3, 94, 'OR', NOW(), 'AC'),
    (7, 2, 1, 90, 'OR', NOW(), 'AC'),
    (7, 2, 2, 92, 'OR', NOW(), 'AC'),
    (7, 2, 3, 93, 'OR', NOW(), 'AC'),

    -- Alumno 8
    (8, 1, 1, 78, 'OR', NOW(), 'AC'),
    (8, 1, 2, 80, 'OR', NOW(), 'AC'),
    (8, 1, 3, 82, 'OR', NOW(), 'AC'),
    (8, 2, 1, 75, 'OR', NOW(), 'AC'),
    (8, 2, 2, 77, 'OR', NOW(), 'AC'),
    (8, 2, 3, 79, 'OR', NOW(), 'AC'),

    -- Alumno 9
    (9, 1, 1, 68, 'OR', NOW(), 'AC'),
    (9, 1, 2, 70, 'OR', NOW(), 'AC'),
    (9, 1, 3, 73, 'OR', NOW(), 'AC'),
    (9, 2, 1, 65, 'OR', NOW(), 'AC'),
    (9, 2, 2, 67, 'OR', NOW(), 'AC'),
    (9, 2, 3, 69, 'OR', NOW(), 'AC'),

    -- Alumno 10
    (10, 1, 1, 85, 'OR', NOW(), 'AC'),
    (10, 1, 2, 87, 'OR', NOW(), 'AC'),
    (10, 1, 3, 89, 'OR', NOW(), 'AC'),
    (10, 2, 1, 80, 'OR', NOW(), 'AC'),
    (10, 2, 2, 82, 'OR', NOW(), 'AC'),
    (10, 2, 3, 84, 'OR', NOW(), 'AC');

-- Alumno 11–20: materia 3, parciales 1–3 (30 registros)
INSERT INTO pro_calificaciones
    (eCodAlumno, eCodMateria, eParcial, dCalificacion, tTipo, fhFecha, tCodEstatus)
VALUES
    (11, 3, 1, 90, 'OR', NOW(), 'AC'),
    (11, 3, 2, 92, 'OR', NOW(), 'AC'),
    (11, 3, 3, 94, 'OR', NOW(), 'AC'),
    (12, 3, 1, 75, 'OR', NOW(), 'AC'),
    (12, 3, 2, 78, 'OR', NOW(), 'AC'),
    (12, 3, 3, 80, 'OR', NOW(), 'AC'),
    (13, 3, 1, 60, 'OR', NOW(), 'AC'),
    (13, 3, 2, 65, 'OR', NOW(), 'AC'),
    (13, 3, 3, 68, 'OR', NOW(), 'AC'),
    (14, 3, 1, 82, 'OR', NOW(), 'AC'),
    (14, 3, 2, 84, 'OR', NOW(), 'AC'),
    (14, 3, 3, 86, 'OR', NOW(), 'AC'),
    (15, 3, 1, 55, 'OR', NOW(), 'AC'),
    (15, 3, 2, 58, 'OR', NOW(), 'AC'),
    (15, 3, 3, 60, 'OR', NOW(), 'AC'),
    (16, 3, 1, 70, 'OR', NOW(), 'AC'),
    (16, 3, 2, 72, 'OR', NOW(), 'AC'),
    (16, 3, 3, 75, 'OR', NOW(), 'AC'),
    (17, 3, 1, 85, 'OR', NOW(), 'AC'),
    (17, 3, 2, 88, 'OR', NOW(), 'AC'),
    (17, 3, 3, 90, 'OR', NOW(), 'AC'),
    (18, 3, 1, 77, 'OR', NOW(), 'AC'),
    (18, 3, 2, 79, 'OR', NOW(), 'AC'),
    (18, 3, 3, 81, 'OR', NOW(), 'AC'),
    (19, 3, 1, 65, 'OR', NOW(), 'AC'),
    (19, 3, 2, 67, 'OR', NOW(), 'AC'),
    (19, 3, 3, 70, 'OR', NOW(), 'AC'),
    (20, 3, 1, 90, 'OR', NOW(), 'AC'),
    (20, 3, 2, 92, 'OR', NOW(), 'AC'),
    (20, 3, 3, 94, 'OR', NOW(), 'AC');

SET FOREIGN_KEY_CHECKS = 1;

-- ============================================================
-- Script: Seed Data para UTMA Académico
-- Fecha: Noviembre 2025
-- Propósito: Insertar datos de prueba (20-30 alumnos y 100-150 calificaciones)
-- ============================================================

-- Limpiar datos existentes (opcional, comentar si no se desea)
-- DELETE FROM `pro_calificaciones` WHERE `eCodCalificacion` > 0;
-- DELETE FROM `pro_alumnos` WHERE `eCodAlumno` > 20;

-- ============================================================
-- INSERTAR ALUMNOS (25 alumnos)
-- ============================================================

INSERT INTO `pro_alumnos` (`tMatricula`, `tNombre`, `tApellidoPaterno`, `tApellidoMaterno`, `tGrupo`, `tTurno`, `fhFechaRegistro`, `tCodEstatus`) VALUES
('A2024001', 'Juan Carlos', 'Pérez', 'García', '101', 'M', NOW(), 'AC'),
('A2024002', 'María Fernanda', 'López', 'Martínez', '101', 'M', NOW(), 'AC'),
('A2024003', 'Carlos Alberto', 'Ramírez', 'Sánchez', '101', 'M', NOW(), 'AC'),
('A2024004', 'Ana Sofía', 'Hernández', 'Torres', '102', 'M', NOW(), 'AC'),
('A2024005', 'Luis Fernando', 'Gómez', 'Díaz', '102', 'M', NOW(), 'AC'),
('A2024006', 'Laura Patricia', 'Jiménez', 'Ruiz', '102', 'M', NOW(), 'AC'),
('A2024007', 'Miguel Ángel', 'Morales', 'Vega', '103', 'V', NOW(), 'AC'),
('A2024008', 'Sofía Alejandra', 'Castillo', 'Flores', '103', 'V', NOW(), 'AC'),
('A2024009', 'Jorge Luis', 'Ríos', 'Navarro', '103', 'V', NOW(), 'AC'),
('A2024010', 'Valeria Guadalupe', 'Ortega', 'Cruz', '104', 'V', NOW(), 'AC'),
('A2024011', 'Pedro Antonio', 'Mendoza', 'Silva', '104', 'V', NOW(), 'AC'),
('A2024012', 'Fernanda Isabel', 'Soto', 'Aguilar', '104', 'V', NOW(), 'AC'),
('A2024013', 'Diego Armando', 'Vargas', 'Ponce', '105', 'M', NOW(), 'AC'),
('A2024014', 'Paola Elizabeth', 'Reyes', 'Salinas', '105', 'M', NOW(), 'AC'),
('A2024015', 'Ricardo Javier', 'Cordero', 'Bravo', '105', 'M', NOW(), 'AC'),
('A2024016', 'Andrea Carolina', 'Luna', 'Campos', '106', 'M', NOW(), 'AC'),
('A2024017', 'Emilio José', 'Serrano', 'Peña', '106', 'M', NOW(), 'AC'),
('A2024018', 'Gabriela Estefanía', 'León', 'Mora', '106', 'M', NOW(), 'AC'),
('A2024019', 'Roberto Daniel', 'Cruz', 'Solís', '107', 'V', NOW(), 'AC'),
('A2024020', 'Patricia Alejandra', 'Ramos', 'Delgado', '107', 'V', NOW(), 'AC'),
('A2024021', 'Alejandro', 'Méndez', 'Gutiérrez', '107', 'V', NOW(), 'AC'),
('A2024022', 'Diana', 'Vázquez', 'Moreno', '108', 'V', NOW(), 'AC'),
('A2024023', 'José Manuel', 'Torres', 'Ramos', '108', 'V', NOW(), 'AC'),
('A2024024', 'Carmen', 'Medina', 'Herrera', '108', 'V', NOW(), 'AC'),
('A2024025', 'Francisco', 'Castro', 'Guerrero', '109', 'M', NOW(), 'AC');

-- ============================================================
-- INSERTAR CALIFICACIONES (120 calificaciones distribuidas)
-- ============================================================
-- Distribución: 25 alumnos × 3-5 materias × 3 parciales = ~120 calificaciones
-- Materias disponibles: 1=Matemáticas, 2=Física, 3=Química, 4=Biología, 5=Historia, 6=Lengua, 7=Inglés, 8=Informática

INSERT INTO `pro_calificaciones` (`eCodAlumno`, `eCodMateria`, `eParcial`, `dCalificacion`, `tTipo`, `fhFecha`, `tCodEstatus`) VALUES
-- Alumno 1 (A2024001) - Matemáticas, Física, Química
(1, 1, 1, 85.5, 'OR', '2025-09-15', 'AC'),
(1, 1, 2, 90.0, 'OR', '2025-10-15', 'AC'),
(1, 1, 3, 88.5, 'OR', '2025-11-15', 'AC'),
(1, 2, 1, 75.0, 'OR', '2025-09-20', 'AC'),
(1, 2, 2, 80.0, 'OR', '2025-10-20', 'AC'),
(1, 2, 3, 78.5, 'OR', '2025-11-20', 'AC'),
(1, 3, 1, 82.0, 'OR', '2025-09-25', 'AC'),
(1, 3, 2, 85.5, 'OR', '2025-10-25', 'AC'),
(1, 3, 3, 84.0, 'OR', '2025-11-25', 'AC'),

-- Alumno 2 (A2024002) - Matemáticas, Física, Biología, Inglés
(2, 1, 1, 92.0, 'OR', '2025-09-15', 'AC'),
(2, 1, 2, 95.0, 'OR', '2025-10-15', 'AC'),
(2, 1, 3, 93.5, 'OR', '2025-11-15', 'AC'),
(2, 2, 1, 88.0, 'OR', '2025-09-20', 'AC'),
(2, 2, 2, 90.5, 'OR', '2025-10-20', 'AC'),
(2, 2, 3, 89.0, 'OR', '2025-11-20', 'AC'),
(2, 4, 1, 87.5, 'OR', '2025-09-22', 'AC'),
(2, 4, 2, 91.0, 'OR', '2025-10-22', 'AC'),
(2, 4, 3, 89.5, 'OR', '2025-11-22', 'AC'),
(2, 7, 1, 94.0, 'OR', '2025-09-18', 'AC'),
(2, 7, 2, 96.0, 'OR', '2025-10-18', 'AC'),
(2, 7, 3, 95.0, 'OR', '2025-11-18', 'AC'),

-- Alumno 3 (A2024003) - Matemáticas, Química, Informática
(3, 1, 1, 78.0, 'OR', '2025-09-15', 'AC'),
(3, 1, 2, 82.0, 'OR', '2025-10-15', 'AC'),
(3, 1, 3, 80.0, 'OR', '2025-11-15', 'AC'),
(3, 3, 1, 75.5, 'OR', '2025-09-25', 'AC'),
(3, 3, 2, 78.0, 'OR', '2025-10-25', 'AC'),
(3, 3, 3, 76.5, 'OR', '2025-11-25', 'AC'),
(3, 8, 1, 88.0, 'OR', '2025-09-28', 'AC'),
(3, 8, 2, 90.0, 'OR', '2025-10-28', 'AC'),
(3, 8, 3, 89.0, 'OR', '2025-11-28', 'AC'),

-- Alumno 4 (A2024004) - Física, Biología, Historia, Lengua
(4, 2, 1, 85.0, 'OR', '2025-09-20', 'AC'),
(4, 2, 2, 87.5, 'OR', '2025-10-20', 'AC'),
(4, 2, 3, 86.0, 'OR', '2025-11-20', 'AC'),
(4, 4, 1, 90.0, 'OR', '2025-09-22', 'AC'),
(4, 4, 2, 92.0, 'OR', '2025-10-22', 'AC'),
(4, 4, 3, 91.0, 'OR', '2025-11-22', 'AC'),
(4, 5, 1, 83.0, 'OR', '2025-09-16', 'AC'),
(4, 5, 2, 85.0, 'OR', '2025-10-16', 'AC'),
(4, 5, 3, 84.0, 'OR', '2025-11-16', 'AC'),
(4, 6, 1, 88.5, 'OR', '2025-09-17', 'AC'),
(4, 6, 2, 90.0, 'OR', '2025-10-17', 'AC'),
(4, 6, 3, 89.0, 'OR', '2025-11-17', 'AC'),

-- Alumno 5 (A2024005) - Matemáticas, Física, Química, Inglés
(5, 1, 1, 70.0, 'OR', '2025-09-15', 'AC'),
(5, 1, 2, 72.5, 'OR', '2025-10-15', 'AC'),
(5, 1, 3, 71.0, 'OR', '2025-11-15', 'AC'),
(5, 2, 1, 68.0, 'OR', '2025-09-20', 'AC'),
(5, 2, 2, 70.0, 'OR', '2025-10-20', 'AC'),
(5, 2, 3, 69.0, 'OR', '2025-11-20', 'AC'),
(5, 3, 1, 72.0, 'OR', '2025-09-25', 'AC'),
(5, 3, 2, 74.0, 'OR', '2025-10-25', 'AC'),
(5, 3, 3, 73.0, 'OR', '2025-11-25', 'AC'),
(5, 7, 1, 65.0, 'OR', '2025-09-18', 'AC'),
(5, 7, 2, 67.5, 'OR', '2025-10-18', 'AC'),
(5, 7, 3, 66.0, 'OR', '2025-11-18', 'AC'),

-- Alumno 6 (A2024006) - Matemáticas, Biología, Historia
(6, 1, 1, 88.0, 'OR', '2025-09-15', 'AC'),
(6, 1, 2, 90.0, 'OR', '2025-10-15', 'AC'),
(6, 1, 3, 89.0, 'OR', '2025-11-15', 'AC'),
(6, 4, 1, 85.5, 'OR', '2025-09-22', 'AC'),
(6, 4, 2, 87.0, 'OR', '2025-10-22', 'AC'),
(6, 4, 3, 86.0, 'OR', '2025-11-22', 'AC'),
(6, 5, 1, 91.0, 'OR', '2025-09-16', 'AC'),
(6, 5, 2, 93.0, 'OR', '2025-10-16', 'AC'),
(6, 5, 3, 92.0, 'OR', '2025-11-16', 'AC'),

-- Alumno 7 (A2024007) - Física, Química, Informática
(7, 2, 1, 79.0, 'OR', '2025-09-20', 'AC'),
(7, 2, 2, 81.5, 'OR', '2025-10-20', 'AC'),
(7, 2, 3, 80.0, 'OR', '2025-11-20', 'AC'),
(7, 3, 1, 77.0, 'OR', '2025-09-25', 'AC'),
(7, 3, 2, 79.5, 'OR', '2025-10-25', 'AC'),
(7, 3, 3, 78.0, 'OR', '2025-11-25', 'AC'),
(7, 8, 1, 92.0, 'OR', '2025-09-28', 'AC'),
(7, 8, 2, 94.0, 'OR', '2025-10-28', 'AC'),
(7, 8, 3, 93.0, 'OR', '2025-11-28', 'AC'),

-- Alumno 8 (A2024008) - Matemáticas, Lengua, Inglés
(8, 1, 1, 93.0, 'OR', '2025-09-15', 'AC'),
(8, 1, 2, 95.0, 'OR', '2025-10-15', 'AC'),
(8, 1, 3, 94.0, 'OR', '2025-11-15', 'AC'),
(8, 6, 1, 96.0, 'OR', '2025-09-17', 'AC'),
(8, 6, 2, 97.0, 'OR', '2025-10-17', 'AC'),
(8, 6, 3, 96.5, 'OR', '2025-11-17', 'AC'),
(8, 7, 1, 94.5, 'OR', '2025-09-18', 'AC'),
(8, 7, 2, 96.0, 'OR', '2025-10-18', 'AC'),
(8, 7, 3, 95.0, 'OR', '2025-11-18', 'AC'),

-- Alumno 9 (A2024009) - Física, Biología, Historia
(9, 2, 1, 76.0, 'OR', '2025-09-20', 'AC'),
(9, 2, 2, 78.0, 'OR', '2025-10-20', 'AC'),
(9, 2, 3, 77.0, 'OR', '2025-11-20', 'AC'),
(9, 4, 1, 80.0, 'OR', '2025-09-22', 'AC'),
(9, 4, 2, 82.0, 'OR', '2025-10-22', 'AC'),
(9, 4, 3, 81.0, 'OR', '2025-11-22', 'AC'),
(9, 5, 1, 78.5, 'OR', '2025-09-16', 'AC'),
(9, 5, 2, 80.0, 'OR', '2025-10-16', 'AC'),
(9, 5, 3, 79.0, 'OR', '2025-11-16', 'AC'),

-- Alumno 10 (A2024010) - Matemáticas, Química, Informática, Inglés
(10, 1, 1, 87.0, 'OR', '2025-09-15', 'AC'),
(10, 1, 2, 89.0, 'OR', '2025-10-15', 'AC'),
(10, 1, 3, 88.0, 'OR', '2025-11-15', 'AC'),
(10, 3, 1, 84.0, 'OR', '2025-09-25', 'AC'),
(10, 3, 2, 86.0, 'OR', '2025-10-25', 'AC'),
(10, 3, 3, 85.0, 'OR', '2025-11-25', 'AC'),
(10, 8, 1, 90.0, 'OR', '2025-09-28', 'AC'),
(10, 8, 2, 92.0, 'OR', '2025-10-28', 'AC'),
(10, 8, 3, 91.0, 'OR', '2025-11-28', 'AC'),
(10, 7, 1, 88.5, 'OR', '2025-09-18', 'AC'),
(10, 7, 2, 90.0, 'OR', '2025-10-18', 'AC'),
(10, 7, 3, 89.0, 'OR', '2025-11-18', 'AC'),

-- Alumno 11 (A2024011) - Física, Biología, Lengua
(11, 2, 1, 72.0, 'OR', '2025-09-20', 'AC'),
(11, 2, 2, 74.0, 'OR', '2025-10-20', 'AC'),
(11, 2, 3, 73.0, 'OR', '2025-11-20', 'AC'),
(11, 4, 1, 75.0, 'OR', '2025-09-22', 'AC'),
(11, 4, 2, 77.0, 'OR', '2025-10-22', 'AC'),
(11, 4, 3, 76.0, 'OR', '2025-11-22', 'AC'),
(11, 6, 1, 78.0, 'OR', '2025-09-17', 'AC'),
(11, 6, 2, 80.0, 'OR', '2025-10-17', 'AC'),
(11, 6, 3, 79.0, 'OR', '2025-11-17', 'AC'),

-- Alumno 12 (A2024012) - Matemáticas, Historia, Inglés
(12, 1, 1, 91.0, 'OR', '2025-09-15', 'AC'),
(12, 1, 2, 93.0, 'OR', '2025-10-15', 'AC'),
(12, 1, 3, 92.0, 'OR', '2025-11-15', 'AC'),
(12, 5, 1, 89.0, 'OR', '2025-09-16', 'AC'),
(12, 5, 2, 91.0, 'OR', '2025-10-16', 'AC'),
(12, 5, 3, 90.0, 'OR', '2025-11-16', 'AC'),
(12, 7, 1, 87.0, 'OR', '2025-09-18', 'AC'),
(12, 7, 2, 89.0, 'OR', '2025-10-18', 'AC'),
(12, 7, 3, 88.0, 'OR', '2025-11-18', 'AC'),

-- Alumno 13 (A2024013) - Química, Informática, Lengua
(13, 3, 1, 83.0, 'OR', '2025-09-25', 'AC'),
(13, 3, 2, 85.0, 'OR', '2025-10-25', 'AC'),
(13, 3, 3, 84.0, 'OR', '2025-11-25', 'AC'),
(13, 8, 1, 86.0, 'OR', '2025-09-28', 'AC'),
(13, 8, 2, 88.0, 'OR', '2025-10-28', 'AC'),
(13, 8, 3, 87.0, 'OR', '2025-11-28', 'AC'),
(13, 6, 1, 82.0, 'OR', '2025-09-17', 'AC'),
(13, 6, 2, 84.0, 'OR', '2025-10-17', 'AC'),
(13, 6, 3, 83.0, 'OR', '2025-11-17', 'AC'),

-- Alumno 14 (A2024014) - Matemáticas, Física, Biología
(14, 1, 1, 95.0, 'OR', '2025-09-15', 'AC'),
(14, 1, 2, 97.0, 'OR', '2025-10-15', 'AC'),
(14, 1, 3, 96.0, 'OR', '2025-11-15', 'AC'),
(14, 2, 1, 93.0, 'OR', '2025-09-20', 'AC'),
(14, 2, 2, 95.0, 'OR', '2025-10-20', 'AC'),
(14, 2, 3, 94.0, 'OR', '2025-11-20', 'AC'),
(14, 4, 1, 91.0, 'OR', '2025-09-22', 'AC'),
(14, 4, 2, 93.0, 'OR', '2025-10-22', 'AC'),
(14, 4, 3, 92.0, 'OR', '2025-11-22', 'AC'),

-- Alumno 15 (A2024015) - Química, Historia, Inglés
(15, 3, 1, 74.0, 'OR', '2025-09-25', 'AC'),
(15, 3, 2, 76.0, 'OR', '2025-10-25', 'AC'),
(15, 3, 3, 75.0, 'OR', '2025-11-25', 'AC'),
(15, 5, 1, 77.0, 'OR', '2025-09-16', 'AC'),
(15, 5, 2, 79.0, 'OR', '2025-10-16', 'AC'),
(15, 5, 3, 78.0, 'OR', '2025-11-16', 'AC'),
(15, 7, 1, 73.0, 'OR', '2025-09-18', 'AC'),
(15, 7, 2, 75.0, 'OR', '2025-10-18', 'AC'),
(15, 7, 3, 74.0, 'OR', '2025-11-18', 'AC'),

-- Alumno 16 (A2024016) - Matemáticas, Informática, Lengua
(16, 1, 1, 86.0, 'OR', '2025-09-15', 'AC'),
(16, 1, 2, 88.0, 'OR', '2025-10-15', 'AC'),
(16, 1, 3, 87.0, 'OR', '2025-11-15', 'AC'),
(16, 8, 1, 89.0, 'OR', '2025-09-28', 'AC'),
(16, 8, 2, 91.0, 'OR', '2025-10-28', 'AC'),
(16, 8, 3, 90.0, 'OR', '2025-11-28', 'AC'),
(16, 6, 1, 85.0, 'OR', '2025-09-17', 'AC'),
(16, 6, 2, 87.0, 'OR', '2025-10-17', 'AC'),
(16, 6, 3, 86.0, 'OR', '2025-11-17', 'AC'),

-- Alumno 17 (A2024017) - Física, Química, Biología
(17, 2, 1, 81.0, 'OR', '2025-09-20', 'AC'),
(17, 2, 2, 83.0, 'OR', '2025-10-20', 'AC'),
(17, 2, 3, 82.0, 'OR', '2025-11-20', 'AC'),
(17, 3, 1, 79.0, 'OR', '2025-09-25', 'AC'),
(17, 3, 2, 81.0, 'OR', '2025-10-25', 'AC'),
(17, 3, 3, 80.0, 'OR', '2025-11-25', 'AC'),
(17, 4, 1, 84.0, 'OR', '2025-09-22', 'AC'),
(17, 4, 2, 86.0, 'OR', '2025-10-22', 'AC'),
(17, 4, 3, 85.0, 'OR', '2025-11-22', 'AC'),

-- Alumno 18 (A2024018) - Matemáticas, Historia, Inglés
(18, 1, 1, 92.0, 'OR', '2025-09-15', 'AC'),
(18, 1, 2, 94.0, 'OR', '2025-10-15', 'AC'),
(18, 1, 3, 93.0, 'OR', '2025-11-15', 'AC'),
(18, 5, 1, 90.0, 'OR', '2025-09-16', 'AC'),
(18, 5, 2, 92.0, 'OR', '2025-10-16', 'AC'),
(18, 5, 3, 91.0, 'OR', '2025-11-16', 'AC'),
(18, 7, 1, 88.0, 'OR', '2025-09-18', 'AC'),
(18, 7, 2, 90.0, 'OR', '2025-10-18', 'AC'),
(18, 7, 3, 89.0, 'OR', '2025-11-18', 'AC'),

-- Alumno 19 (A2024019) - Física, Informática, Lengua
(19, 2, 1, 77.0, 'OR', '2025-09-20', 'AC'),
(19, 2, 2, 79.0, 'OR', '2025-10-20', 'AC'),
(19, 2, 3, 78.0, 'OR', '2025-11-20', 'AC'),
(19, 8, 1, 85.0, 'OR', '2025-09-28', 'AC'),
(19, 8, 2, 87.0, 'OR', '2025-10-28', 'AC'),
(19, 8, 3, 86.0, 'OR', '2025-11-28', 'AC'),
(19, 6, 1, 80.0, 'OR', '2025-09-17', 'AC'),
(19, 6, 2, 82.0, 'OR', '2025-10-17', 'AC'),
(19, 6, 3, 81.0, 'OR', '2025-11-17', 'AC'),

-- Alumno 20 (A2024020) - Matemáticas, Química, Biología, Historia
(20, 1, 1, 89.0, 'OR', '2025-09-15', 'AC'),
(20, 1, 2, 91.0, 'OR', '2025-10-15', 'AC'),
(20, 1, 3, 90.0, 'OR', '2025-11-15', 'AC'),
(20, 3, 1, 86.0, 'OR', '2025-09-25', 'AC'),
(20, 3, 2, 88.0, 'OR', '2025-10-25', 'AC'),
(20, 3, 3, 87.0, 'OR', '2025-11-25', 'AC'),
(20, 4, 1, 88.0, 'OR', '2025-09-22', 'AC'),
(20, 4, 2, 90.0, 'OR', '2025-10-22', 'AC'),
(20, 4, 3, 89.0, 'OR', '2025-11-22', 'AC'),
(20, 5, 1, 87.0, 'OR', '2025-09-16', 'AC'),
(20, 5, 2, 89.0, 'OR', '2025-10-16', 'AC'),
(20, 5, 3, 88.0, 'OR', '2025-11-16', 'AC'),

-- Alumno 21 (A2024021) - Física, Inglés, Informática
(21, 2, 1, 73.0, 'OR', '2025-09-20', 'AC'),
(21, 2, 2, 75.0, 'OR', '2025-10-20', 'AC'),
(21, 2, 3, 74.0, 'OR', '2025-11-20', 'AC'),
(21, 7, 1, 76.0, 'OR', '2025-09-18', 'AC'),
(21, 7, 2, 78.0, 'OR', '2025-10-18', 'AC'),
(21, 7, 3, 77.0, 'OR', '2025-11-18', 'AC'),
(21, 8, 1, 82.0, 'OR', '2025-09-28', 'AC'),
(21, 8, 2, 84.0, 'OR', '2025-10-28', 'AC'),
(21, 8, 3, 83.0, 'OR', '2025-11-28', 'AC'),

-- Alumno 22 (A2024022) - Matemáticas, Lengua, Historia
(22, 1, 1, 94.0, 'OR', '2025-09-15', 'AC'),
(22, 1, 2, 96.0, 'OR', '2025-10-15', 'AC'),
(22, 1, 3, 95.0, 'OR', '2025-11-15', 'AC'),
(22, 6, 1, 92.0, 'OR', '2025-09-17', 'AC'),
(22, 6, 2, 94.0, 'OR', '2025-10-17', 'AC'),
(22, 6, 3, 93.0, 'OR', '2025-11-17', 'AC'),
(22, 5, 1, 91.0, 'OR', '2025-09-16', 'AC'),
(22, 5, 2, 93.0, 'OR', '2025-10-16', 'AC'),
(22, 5, 3, 92.0, 'OR', '2025-11-16', 'AC'),

-- Alumno 23 (A2024023) - Química, Biología, Inglés
(23, 3, 1, 80.0, 'OR', '2025-09-25', 'AC'),
(23, 3, 2, 82.0, 'OR', '2025-10-25', 'AC'),
(23, 3, 3, 81.0, 'OR', '2025-11-25', 'AC'),
(23, 4, 1, 83.0, 'OR', '2025-09-22', 'AC'),
(23, 4, 2, 85.0, 'OR', '2025-10-22', 'AC'),
(23, 4, 3, 84.0, 'OR', '2025-11-22', 'AC'),
(23, 7, 1, 79.0, 'OR', '2025-09-18', 'AC'),
(23, 7, 2, 81.0, 'OR', '2025-10-18', 'AC'),
(23, 7, 3, 80.0, 'OR', '2025-11-18', 'AC'),

-- Alumno 24 (A2024024) - Matemáticas, Física, Informática
(24, 1, 1, 84.0, 'OR', '2025-09-15', 'AC'),
(24, 1, 2, 86.0, 'OR', '2025-10-15', 'AC'),
(24, 1, 3, 85.0, 'OR', '2025-11-15', 'AC'),
(24, 2, 1, 82.0, 'OR', '2025-09-20', 'AC'),
(24, 2, 2, 84.0, 'OR', '2025-10-20', 'AC'),
(24, 2, 3, 83.0, 'OR', '2025-11-20', 'AC'),
(24, 8, 1, 87.0, 'OR', '2025-09-28', 'AC'),
(24, 8, 2, 89.0, 'OR', '2025-10-28', 'AC'),
(24, 8, 3, 88.0, 'OR', '2025-11-28', 'AC'),

-- Alumno 25 (A2024025) - Química, Historia, Lengua
(25, 3, 1, 78.0, 'OR', '2025-09-25', 'AC'),
(25, 3, 2, 80.0, 'OR', '2025-10-25', 'AC'),
(25, 3, 3, 79.0, 'OR', '2025-11-25', 'AC'),
(25, 5, 1, 81.0, 'OR', '2025-09-16', 'AC'),
(25, 5, 2, 83.0, 'OR', '2025-10-16', 'AC'),
(25, 5, 3, 82.0, 'OR', '2025-11-16', 'AC'),
(25, 6, 1, 79.5, 'OR', '2025-09-17', 'AC'),
(25, 6, 2, 81.0, 'OR', '2025-10-17', 'AC'),
(25, 6, 3, 80.0, 'OR', '2025-11-17', 'AC');

-- ============================================================
-- VERIFICACIÓN
-- ============================================================
-- Verificar cantidad de alumnos insertados
SELECT COUNT(*) AS TotalAlumnos FROM `pro_alumnos` WHERE `tCodEstatus` = 'AC';

-- Verificar cantidad de calificaciones insertadas
SELECT COUNT(*) AS TotalCalificaciones FROM `pro_calificaciones` WHERE `tCodEstatus` = 'AC';

-- Ver calificaciones por alumno
SELECT 
    a.`tMatricula`,
    CONCAT(a.`tNombre`, ' ', a.`tApellidoPaterno`) AS Nombre,
    COUNT(c.`eCodCalificacion`) AS TotalCalificaciones
FROM `pro_alumnos` a
LEFT JOIN `pro_calificaciones` c ON a.`eCodAlumno` = c.`eCodAlumno` AND c.`tCodEstatus` = 'AC'
WHERE a.`tCodEstatus` = 'AC'
GROUP BY a.`eCodAlumno`, a.`tMatricula`, a.`tNombre`, a.`tApellidoPaterno`
ORDER BY a.`tMatricula`;


