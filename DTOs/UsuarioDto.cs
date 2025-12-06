namespace utma_academico_aspnetcore.DTOs
{
    /// <summary>
    /// DTO para respuesta de usuario
    /// </summary>
    public class UsuarioDto
    {
        public int IdUsuario { get; set; }
        public string NombreUsuario { get; set; } = null!;
        public string EmailUsuario { get; set; } = null!;
        public int IdRol { get; set; }
        public string? NombreRol { get; set; }
        public bool Activo { get; set; }
    }

    /// <summary>
    /// DTO para crear un nuevo usuario
    /// </summary>
    public class CrearUsuarioDto
    {
        public string NombreUsuario { get; set; } = null!;
        public string EmailUsuario { get; set; } = null!;
        public string PasswordUsuario { get; set; } = null!;
        public int IdRol { get; set; }
    }
}

