namespace utma_academico_aspnetcore
{
    /// <summary>
    /// Constantes de la aplicación (códigos de error y otros valores reuseables)
    /// </summary>
    public static class Constants
    {
        // Errores
        public const string ErrorAlumnoNotFound = "ERR_ALUMNO_NOT_FOUND";
        public const string ErrorMateriaNotFound = "ERR_MATERIA_NOT_FOUND";
        public const string ErrorUsuarioNotFound = "ERR_USUARIO_NOT_FOUND";
        public const string ErrorUnauthorized = "ERR_UNAUTHORIZED";
        public const string ErrorBadRequest = "ERR_BAD_REQUEST";
        public const string ErrorInternal = "ERR_INTERNAL";

        // Otros
        public const string AuthorizationHeader = "Authorization";
    }
}
