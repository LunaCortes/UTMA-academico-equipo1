-- =====================================================
-- SISTEMA DE GESTIÓN DE CITAS MÉDICAS
-- Script SQL Completo para MySQL
-- =====================================================

-- Eliminar base de datos si existe y crear nueva
DROP DATABASE IF EXISTS sistemaGestionCitasMedicas;
CREATE DATABASE sistemaGestionCitasMedicas;
USE sistemaGestionCitasMedicas;

-- =====================================================
-- TABLAS DE CATÁLOGOS
-- =====================================================

-- Catálogo de Roles del Sistema
CREATE TABLE catRoles (
    idRol INT AUTO_INCREMENT PRIMARY KEY,
    nombreRol VARCHAR(50) NOT NULL UNIQUE,
    descripcionRol TEXT,
    fechaCreacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fechaActualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Catálogo de Estados de Cita
CREATE TABLE catEstadosCita (
    idEstadoCita INT AUTO_INCREMENT PRIMARY KEY,
    nombreEstado VARCHAR(30) NOT NULL UNIQUE,
    descripcionEstado TEXT,
    fechaCreacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fechaActualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Catálogo de Especialidades Médicas
CREATE TABLE catEspecialidades (
    idEspecialidad INT AUTO_INCREMENT PRIMARY KEY,
    nombreEspecialidad VARCHAR(100) NOT NULL UNIQUE,
    descripcionEspecialidad TEXT,
    fechaCreacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fechaActualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- =====================================================
-- TABLAS PRINCIPALES
-- =====================================================

-- Tabla de Usuarios del Sistema
CREATE TABLE usuarios (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    nombreUsuario VARCHAR(50) NOT NULL UNIQUE,
    emailUsuario VARCHAR(100) NOT NULL UNIQUE,
    passwordUsuario VARCHAR(255) NOT NULL,
    idRol INT NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    fechaCreacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fechaActualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (idRol) REFERENCES catRoles(idRol)
);

-- Tabla de Pacientes
CREATE TABLE catPacientes (
    idPaciente INT AUTO_INCREMENT PRIMARY KEY,
    nombrePaciente VARCHAR(100) NOT NULL,
    apellidoPaternoPaciente VARCHAR(100) NOT NULL,
    apellidoMaternoPaciente VARCHAR(100),
    fechaNacimientoPaciente DATE NOT NULL,
    telefonoPaciente VARCHAR(15),
    emailPaciente VARCHAR(100) UNIQUE,
    direccionPaciente TEXT,
    numeroSeguroSocial VARCHAR(20) UNIQUE,
    tipoSangrePaciente VARCHAR(5),
    alergiasPaciente TEXT,
    idUsuario INT,
    fechaCreacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fechaActualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (idUsuario) REFERENCES usuarios(idUsuario)
);

-- Tabla de Médicos
CREATE TABLE catMedicos (
    idMedico INT AUTO_INCREMENT PRIMARY KEY,
    nombreMedico VARCHAR(100) NOT NULL,
    apellidoPaternoMedico VARCHAR(100) NOT NULL,
    apellidoMaternoMedico VARCHAR(100),
    cedulaProfesionalMedico VARCHAR(20) NOT NULL UNIQUE,
    idEspecialidad INT NOT NULL,
    telefonoMedico VARCHAR(15),
    emailMedico VARCHAR(100) UNIQUE,
    consultorioMedico VARCHAR(50),
    horarioInicioMedico TIME DEFAULT '08:00:00',
    horarioFinMedico TIME DEFAULT '18:00:00',
    activo BOOLEAN DEFAULT TRUE,
    idUsuario INT,
    fechaCreacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fechaActualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (idEspecialidad) REFERENCES catEspecialidades(idEspecialidad),
    FOREIGN KEY (idUsuario) REFERENCES usuarios(idUsuario)
);

-- Tabla de Horarios Disponibles
CREATE TABLE horariosDisponibles (
    idHorarioDisponible INT AUTO_INCREMENT PRIMARY KEY,
    idMedico INT NOT NULL,
    fechaDisponible DATE NOT NULL,
    horaInicioDisponible TIME NOT NULL,
    horaFinDisponible TIME NOT NULL,
    disponible BOOLEAN DEFAULT TRUE,
    fechaCreacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fechaActualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (idMedico) REFERENCES catMedicos(idMedico),
    UNIQUE KEY unique_medico_fecha_hora (idMedico, fechaDisponible, horaInicioDisponible)
);

-- Tabla de Citas Médicas
CREATE TABLE citasMedicas (
    idCitaMedica INT AUTO_INCREMENT PRIMARY KEY,
    idPaciente INT NOT NULL,
    idMedico INT NOT NULL,
    fechaCita DATE NOT NULL,
    horaCita TIME NOT NULL,
    idEstadoCita INT NOT NULL DEFAULT 1,
    motivoCita TEXT,
    observacionesCita TEXT,
    duracionEstimadaCita INT DEFAULT 30,
    costoConsulta DECIMAL(10,2),
    fechaCreacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fechaActualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (idPaciente) REFERENCES catPacientes(idPaciente),
    FOREIGN KEY (idMedico) REFERENCES catMedicos(idMedico),
    FOREIGN KEY (idEstadoCita) REFERENCES catEstadosCita(idEstadoCita),
    UNIQUE KEY unique_medico_fecha_hora_cita (idMedico, fechaCita, horaCita)
);

-- =====================================================
-- INSERCIÓN DE DATOS INICIALES
-- =====================================================

-- Insertar Roles
INSERT INTO catRoles (nombreRol, descripcionRol) VALUES 
('Administrador', 'Acceso completo al sistema'),
('Médico', 'Gestión de citas y pacientes asignados'),
('Paciente', 'Consulta y gestión de citas propias'),
('Recepcionista', 'Gestión de citas y registro de pacientes');

-- Insertar Estados de Cita
INSERT INTO catEstadosCita (nombreEstado, descripcionEstado) VALUES 
('Programada', 'Cita agendada y confirmada'),
('Completada', 'Cita realizada exitosamente'),
('Cancelada', 'Cita cancelada por el paciente o médico'),
('No Asistió', 'Paciente no se presentó a la cita'),
('Reprogramada', 'Cita movida a nueva fecha/hora');

-- Insertar Especialidades
INSERT INTO catEspecialidades (nombreEspecialidad, descripcionEspecialidad) VALUES 
('Medicina General', 'Atención médica general y preventiva'),
('Cardiología', 'Especialidad en enfermedades del corazón'),
('Dermatología', 'Especialidad en enfermedades de la piel'),
('Pediatría', 'Atención médica especializada en niños'),
('Ginecología', 'Especialidad en salud femenina'),
('Traumatología', 'Especialidad en lesiones del sistema musculoesquelético');

-- Insertar Usuarios de Ejemplo
INSERT INTO usuarios (nombreUsuario, emailUsuario, passwordUsuario, idRol) VALUES 
('admin', 'admin@clinica.com', 'admin123', 1),
('dr.martinez', 'martinez@clinica.com', 'medico123', 2),
('paciente001', 'juan.perez@email.com', 'paciente123', 3),
('recepcion', 'recepcion@clinica.com', 'recep123', 4);

-- Insertar Médicos de Ejemplo
INSERT INTO catMedicos (nombreMedico, apellidoPaternoMedico, apellidoMaternoMedico, cedulaProfesionalMedico, idEspecialidad, telefonoMedico, emailMedico, consultorioMedico, idUsuario) VALUES 
('Carlos', 'Martínez', 'López', '12345678', 1, '555-0101', 'martinez@clinica.com', 'Consultorio 101', 2),
('María', 'González', 'Hernández', '87654321', 2, '555-0102', 'gonzalez@clinica.com', 'Consultorio 201', NULL),
('Roberto', 'Sánchez', 'Díaz', '11223344', 3, '555-0103', 'sanchez@clinica.com', 'Consultorio 301', NULL);

-- Insertar Pacientes de Ejemplo
INSERT INTO catPacientes (nombrePaciente, apellidoPaternoPaciente, apellidoMaternoPaciente, fechaNacimientoPaciente, telefonoPaciente, emailPaciente, numeroSeguroSocial, tipoSangrePaciente, idUsuario) VALUES 
('Juan', 'Pérez', 'García', '1985-03-15', '555-1001', 'juan.perez@email.com', 'NSS001', 'O+', 3),
('Ana', 'López', 'Martínez', '1990-07-22', '555-1002', 'ana.lopez@email.com', 'NSS002', 'A+', NULL),
('Pedro', 'Rodríguez', 'Fernández', '1978-11-08', '555-1003', 'pedro.rodriguez@email.com', 'NSS003', 'B+', NULL);

-- Insertar Horarios Disponibles de Ejemplo
INSERT INTO horariosDisponibles (idMedico, fechaDisponible, horaInicioDisponible, horaFinDisponible) VALUES 
(1, '2024-12-02', '09:00:00', '09:30:00'),
(1, '2024-12-02', '10:00:00', '10:30:00'),
(1, '2024-12-02', '11:00:00', '11:30:00'),
(2, '2024-12-03', '14:00:00', '14:30:00'),
(2, '2024-12-03', '15:00:00', '15:30:00');

-- Insertar Citas de Ejemplo
INSERT INTO citasMedicas (idPaciente, idMedico, fechaCita, horaCita, idEstadoCita, motivoCita, costoConsulta) VALUES 
(1, 1, '2024-12-02', '09:00:00', 1, 'Consulta general de rutina', 500.00),
(2, 2, '2024-12-03', '14:00:00', 1, 'Revisión cardiológica', 800.00),
(3, 1, '2024-12-04', '10:00:00', 1, 'Seguimiento de tratamiento', 500.00);

-- =====================================================
-- ÍNDICES PARA OPTIMIZACIÓN
-- =====================================================

-- Índices en tablas principales
CREATE INDEX idx_pacientes_email ON catPacientes(emailPaciente);
CREATE INDEX idx_medicos_cedula ON catMedicos(cedulaProfesionalMedico);
CREATE INDEX idx_citas_fecha ON citasMedicas(fechaCita);
CREATE INDEX idx_citas_paciente ON citasMedicas(idPaciente);
CREATE INDEX idx_citas_medico ON citasMedicas(idMedico);
CREATE INDEX idx_horarios_medico_fecha ON horariosDisponibles(idMedico, fechaDisponible);

-- =====================================================
-- SCRIPT COMPLETADO EXITOSAMENTE
-- =====================================================