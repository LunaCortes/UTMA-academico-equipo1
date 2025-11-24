using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace utma_academico_aspnetcore.Models
{
    // Mapea la tabla `pro_asistencias`
    [Table("pro_asistencias")]
    public class Asistencia
    {
        // PK -> eCodAsistencia
        [Key]
        [Column("eCodAsistencia")]
        public int Id { get; set; }

        // FK a alumno -> eCodAlumno
        [Column("eCodAlumno")]
        public int AlumnoId { get; set; }

        [ForeignKey("AlumnoId")]
        public Alumno? Alumno { get; set; }

        // FK a materia -> eCodMateria
        [Column("eCodMateria")]
        public int MateriaId { get; set; }

        [ForeignKey("MateriaId")]
        public Materia? Materia { get; set; }

        // Fecha de la asistencia -> fhFecha
        [Column("fhFecha")]
        public DateTime Fecha { get; set; }

        // tEstatus en la BD guarda 'A' (presente) o 'F' (falta)
        [Column("tEstatus")]
        public string? Estatus { get; set; }

        // tCodEstatus (metadato de la fila)
        [Column("tCodEstatus")]
        public string? CodEstatus { get; set; }
    }
}
