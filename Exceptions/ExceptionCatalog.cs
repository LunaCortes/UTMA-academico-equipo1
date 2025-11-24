using System.Net;

namespace utma_academico_aspnetcore.Exceptions
{
    /// <summary>
    /// Catálogo centralizado de excepciones predefinidas con códigos y estados HTTP.
    /// Usar ExceptionCatalog.AlumnoNotFound(id) para lanzar una ApiException consistente.
    /// </summary>
    public static class ExceptionCatalog
    {
        public static ApiException AlumnoNotFound(int id) =>
            new ApiException(Constants.ErrorAlumnoNotFound, $"Alumno con id {id} no encontrado.", (int)HttpStatusCode.NotFound);

        public static ApiException MateriaNotFound(int id) =>
            new ApiException(Constants.ErrorMateriaNotFound, $"Materia con id {id} no encontrada.", (int)HttpStatusCode.NotFound);

        public static ApiException UsuarioNotFound(string username) =>
            new ApiException(Constants.ErrorUsuarioNotFound, $"Usuario '{username}' no encontrado.", (int)HttpStatusCode.NotFound);

        public static ApiException Unauthorized(string reason = "No autorizado") =>
            new ApiException(Constants.ErrorUnauthorized, reason, (int)HttpStatusCode.Unauthorized);

        public static ApiException BadRequest(string message, string code = Constants.ErrorBadRequest) =>
            new ApiException(code, message, (int)HttpStatusCode.BadRequest);

        public static ApiException Internal(string? details = null) =>
            new ApiException(Constants.ErrorInternal, "Error interno del servidor.", (int)HttpStatusCode.InternalServerError, details);
    }
}
