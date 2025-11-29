using System.ComponentModel.DataAnnotations;

namespace utma_academico_aspnetcore.DTOs
{
    /// <summary>
    /// DTO para actualizar una calificación existente.
    /// </summary>
    public class CalificacionUpdateDto
    {
        /// <summary>
        /// Id del alumno (eCodAlumno)
        /// </summary>
        [Required]
        public int AlumnoId { get; set; }

        /// <summary>
        /// Id de la materia (eCodMateria)
        /// </summary>
        [Required]
        public int MateriaId { get; set; }

        /// <summary>
        /// Parcial (1-3)
        /// </summary>
        [Required]
        [Range(1, 3)]
        public int Parcial { get; set; }

        /// <summary>
        /// Calificación numérica (0-100)
        /// </summary>
        [Required]
        [Range(0, 100)]
        public decimal Calificacion { get; set; }

        /// <summary>
        /// Tipo de calificación (OR = Ordinario, etc.)
        /// </summary>
        [StringLength(10)]
        public string? Tipo { get; set; }

        /// <summary>
        /// Código de estatus (AC = Activo, EL = Eliminado)
        /// </summary>
        [StringLength(2)]
        public string? CodEstatus { get; set; }
    }
}



