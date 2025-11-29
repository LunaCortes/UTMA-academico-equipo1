using System.ComponentModel.DataAnnotations;

namespace utma_academico_aspnetcore.DTOs
{
    /// <summary>
    /// DTO para actualizar un alumno existente.
    /// </summary>
    public class AlumnoUpdateDto
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

        /// <summary>
        /// Código de estatus (AC = Activo, EL = Eliminado)
        /// </summary>
        [StringLength(2)]
        public string? CodEstatus { get; set; }
    }
}



