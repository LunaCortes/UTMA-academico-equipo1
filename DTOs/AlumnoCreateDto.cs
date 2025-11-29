using System.ComponentModel.DataAnnotations;

namespace utma_academico_aspnetcore.DTOs
{
    /// <summary>
    /// DTO para crear un nuevo alumno.
    /// </summary>
    public class AlumnoCreateDto
    {
        /// <summary>
        /// Matrícula del alumno (única)
        /// </summary>
        [Required]
        [StringLength(20)]
        public string Matricula { get; set; } = null!;

        /// <summary>
        /// Nombre(s) del alumno
        /// </summary>
        [Required]
        [StringLength(100)]
        public string Nombre { get; set; } = null!;

        /// <summary>
        /// Apellido paterno
        /// </summary>
        [Required]
        [StringLength(100)]
        public string ApellidoPaterno { get; set; } = null!;

        /// <summary>
        /// Apellido materno (opcional)
        /// </summary>
        [StringLength(100)]
        public string? ApellidoMaterno { get; set; }

        /// <summary>
        /// Grupo del alumno
        /// </summary>
        [StringLength(10)]
        public string? Grupo { get; set; }

        /// <summary>
        /// Turno (M = Matutino, V = Vespertino)
        /// </summary>
        [StringLength(2)]
        public string? Turno { get; set; }
    }
}



