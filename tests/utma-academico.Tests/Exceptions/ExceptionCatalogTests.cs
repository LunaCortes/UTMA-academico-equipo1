using Xunit;
using utma_academico.Exceptions;
using utma_academico;

namespace utma_academico.Tests.Exceptions
{
    public class ExceptionCatalogTests
    {
        [Fact]
        public void ExceptionCatalog_Returns_ApiException_With_Correct_Codes()
        {
            var ex1 = ExceptionCatalog.AlumnoNotFound(5);
            Assert.Equal(Constants.ErrorAlumnoNotFound, ex1.ErrorCode);
            Assert.Equal(404, ex1.StatusCode);

            var ex2 = ExceptionCatalog.MateriaNotFound(3);
            Assert.Equal(Constants.ErrorMateriaNotFound, ex2.ErrorCode);
            Assert.Equal(404, ex2.StatusCode);

            var ex3 = ExceptionCatalog.UsuarioNotFound("u1");
            Assert.Equal(Constants.ErrorUsuarioNotFound, ex3.ErrorCode);
            Assert.Equal(404, ex3.StatusCode);

            var ex4 = ExceptionCatalog.Unauthorized();
            Assert.Equal(Constants.ErrorUnauthorized, ex4.ErrorCode);
            Assert.Equal(401, ex4.StatusCode);

            var ex5 = ExceptionCatalog.BadRequest("m");
            Assert.Equal(Constants.ErrorBadRequest, ex5.ErrorCode);
            Assert.Equal(400, ex5.StatusCode);

            var ex6 = ExceptionCatalog.Internal("d");
            Assert.Equal(Constants.ErrorInternal, ex6.ErrorCode);
            Assert.Equal(500, ex6.StatusCode);
        }
    }
}
