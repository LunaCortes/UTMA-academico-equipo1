using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace utma_academico_aspnetcore.Models
{
    // Mapea la tabla de calificaciones `pro_calificaciones`.
    // Cada instancia de esta clase representa una fila en la tabla.
    [Table("pro_calificaciones")]
    public class Calificacion
    {
        // PK -> eCodCalificacion
        [Key]
        [Column("eCodCalificacion")]
        public int Id { get; set; }

        // FK a alumno -> eCodAlumno
        // Este campo almacena la referencia al alumno al que pertenece la calificación.
        [Column("eCodAlumno")]
        public int AlumnoId { get; set; }

        // Navigation property (opcional) hacia Alumno.
        // Permite acceder al objeto Alumno relacionado cuando EF carga la relación.
        [ForeignKey("AlumnoId")]
        public Alumno? Alumno { get; set; }

        // FK a materia -> eCodMateria
        [Column("eCodMateria")]
        public int MateriaId { get; set; }

        // Navigation property (opcional) hacia Materia.
        [ForeignKey("MateriaId")]
        public Materia? Materia { get; set; }

        // Parcial (1-3) -> eParcial
        // Indica a qué parcial corresponde la calificación.
        [Column("eParcial")]
        public int Parcial { get; set; }

        // Calificación numérica -> dCalificacion (decimal en BD)
        // Aquí se almacena el valor numérico de la calificación.
        [Column("dCalificacion")]
        public decimal CalificacionValor { get; set; }

        // Tipo de calificación -> tTipo (por ejemplo 'OR' = ordinario)
        [Column("tTipo")]
        public string? Tipo { get; set; }

        // Fecha asociada -> fhFecha
        [Column("fhFecha")]
        public DateTime Fecha { get; set; }

        // Código de estatus en la tabla -> tCodEstatus
        // Utilizar para marcar filas activas/inactivas ('AC', 'EL', etc.).
        [Column("tCodEstatus")]
        public string? CodEstatus { get; set; }
    }
}
