using System;
using System.ComponentModel.DataAnnotations;

namespace utma_academico_aspnetcore.DTOs
{
    /// <summary>
    /// DTO para crear o registrar una asistencia.
    /// </summary>
    public class AsistenciaCreateDto
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
        /// Fecha de la asistencia
        /// </summary>
        [Required]
        public DateTime Fecha { get; set; }

        /// <summary>
        /// Indica si estuvo presente (true) o ausente (false)
        /// </summary>
        [Required]
        public bool Presente { get; set; }
    }
}
