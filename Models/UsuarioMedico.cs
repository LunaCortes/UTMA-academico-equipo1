using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace utma_academico_aspnetcore.Models
{
    /// <summary>
    /// Modelo para la tabla usuarios - Usuarios del sistema médico
    /// </summary>
    [Table("usuarios")]
    public class UsuarioMedico
    {
        [Key]
        [Column("idUsuario")]
        public int idUsuario { get; set; }

        [Required]
        [Column("nombreUsuario")]
        public string nombreUsuario { get; set; } = null!;

        [Required]
        [Column("emailUsuario")]
        public string emailUsuario { get; set; } = null!;

        [Required]
        [Column("passwordUsuario")]
        public string passwordUsuario { get; set; } = null!;

        [Required]
        [Column("idRol")]
        public int idRol { get; set; }

        [Column("activo")]
        public bool activo { get; set; } = true;

        [Column("fechaCreacion")]
        public DateTime fechaCreacion { get; set; }

        [Column("fechaActualizacion")]
        public DateTime fechaActualizacion { get; set; }

        // Navigation properties
        [ForeignKey("idRol")]
        [JsonIgnore]
        public Rol? Rol { get; set; }

        [JsonIgnore]
        public Paciente? Paciente { get; set; }

        [JsonIgnore]
        public Medico? Medico { get; set; }
    }
}

