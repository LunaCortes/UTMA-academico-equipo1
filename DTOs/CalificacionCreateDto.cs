using System.ComponentModel.DataAnnotations;

namespace utma_academico_aspnetcore.DTOs
{
    /// <summary>
    /// DTO para crear una calificación.
    /// </summary>
    public class CalificacionCreateDto
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
    }
}
