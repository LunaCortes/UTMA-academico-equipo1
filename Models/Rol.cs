using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace utma_academico_aspnetcore.Models
{
    /// <summary>
    /// Modelo para la tabla catRoles - Roles del sistema
    /// </summary>
    [Table("catRoles")]
    public class Rol
    {
        [Key]
        [Column("idRol")]
        public int idRol { get; set; }

        [Required]
        [Column("nombreRol")]
        public string nombreRol { get; set; } = null!;

        [Column("descripcionRol")]
        public string? descripcionRol { get; set; }

        [Column("fechaCreacion")]
        public DateTime fechaCreacion { get; set; }

        [Column("fechaActualizacion")]
        public DateTime fechaActualizacion { get; set; }

        // Navigation property
        [JsonIgnore]
        public ICollection<UsuarioMedico> Usuarios { get; set; } = new List<UsuarioMedico>();
    }
}

