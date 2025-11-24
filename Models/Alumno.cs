using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace utma_academico_aspnetcore.Models
{
    // Mapear la clase a la tabla `pro_alumnos` de la base de datos
    [Table("pro_alumnos")]
    public class Alumno
    {
        // PK: columna `eCodAlumno`
        [Key]
        [Column("eCodAlumno")]
        public int Id { get; set; }

        // Matrícula (única, obligatoria) -> columna `tMatricula`
        [Required]
        [Column("tMatricula")]
        public string Matricula { get; set; } = null!;

        // Nombre(s) -> columna `tNombre`
        [Required]
        [Column("tNombre")]
        public string Nombre { get; set; } = null!;

        // Apellido paterno -> columna `tApellidoPaterno`
        [Required]
        [Column("tApellidoPaterno")]
        public string ApellidoPaterno { get; set; } = null!;

        // Apellido materno -> columna `tApellidoMaterno` (puede ser null en la BD)
        [Column("tApellidoMaterno")]
        public string? ApellidoMaterno { get; set; }

        // Grupo del alumno -> columna `tGrupo`
        [Column("tGrupo")]
        public string? Grupo { get; set; }

        // Turno (M/V etc) -> columna `tTurno`
        [Column("tTurno")]
        public string? Turno { get; set; }

        // Fecha de registro en la BD -> columna `fhFechaRegistro`
        [Column("fhFechaRegistro")]
        public DateTime FechaRegistro { get; set; }

        // Código de estatus (AC, EL, etc) -> columna `tCodEstatus`
        [Column("tCodEstatus")]
        public string? CodEstatus { get; set; }

        // Navigation property: calificaciones relacionadas
        // Se inicializa con lista vacía para evitar nulls al consultar en memoria
        [JsonIgnore]
        public ICollection<Calificacion>? Calificaciones { get; set; } = new List<Calificacion>();

        // Navigation property: asistencias relacionadas
        [JsonIgnore]
        public ICollection<Asistencia>? Asistencias { get; set; } = new List<Asistencia>();
    }
}
