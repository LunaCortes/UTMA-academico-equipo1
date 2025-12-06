using System.ComponentModel.DataAnnotations;

namespace utma_academico_aspnetcore.DTOs
{
    /// <summary>
    /// DTO para solicitar un token JWT usando email y contraseña
    /// </summary>
    public class LoginMedicoDto
    {
        /// <summary>
        /// Email del usuario
        /// </summary>
        [Required(ErrorMessage = "El email es requerido")]
        [EmailAddress(ErrorMessage = "El formato del email no es válido")]
        public string EmailUsuario { get; set; } = null!;

        /// <summary>
        /// Contraseña del usuario
        /// </summary>
        [Required(ErrorMessage = "La contraseña es requerida")]
        public string PasswordUsuario { get; set; } = null!;
    }
}

