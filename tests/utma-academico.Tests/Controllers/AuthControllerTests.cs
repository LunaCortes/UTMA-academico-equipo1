using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using utma_academico.Controllers;
using utma_academico.Services;
using utma_academico.Tests.Helpers;
using Xunit;
using Microsoft.AspNetCore.Mvc;
using utma_academico.Data;
using utma_academico.Models;

namespace utma_academico.Tests.Controllers
{
    public class AuthControllerTests
    {
        [Fact]
        public async Task Login_Returns_Token_When_ApiKey_Valid_And_User_Exists()
        {
            var config = TestHelpers.CreateConfigurationWithJwtAndApiKey();
            using var db = TestHelpers.CreateInMemoryContext();

            // Seed user
            db.Usuarios.Add(new Usuario { UsuarioLogin = "jvargas" });
            await db.SaveChangesAsync();

            var jwtSvc = new JwtService(config);
            var controller = new AuthController(db, jwtSvc, config);

            var dto = new utma_academico.DTOs.LoginDto { Usuario = "jvargas", ApiKey = "utma_local_dev_key" };
            var result = await controller.Login(dto) as OkObjectResult;
            Assert.NotNull(result);

            var body = result.Value as utma_academico.DTOs.TokenResponseDto;
            Assert.NotNull(body);
            Assert.False(string.IsNullOrEmpty(body.Token));
        }

        [Fact]
        public async Task Login_Throws_Unauthorized_When_ApiKey_Invalid()
        {
            var config = TestHelpers.CreateConfigurationWithJwtAndApiKey();
            using var db = TestHelpers.CreateInMemoryContext();
            var jwtSvc = new JwtService(config);
            var controller = new AuthController(db, jwtSvc, config);

            var dto = new utma_academico.DTOs.LoginDto { Usuario = "jvargas", ApiKey = "wrong" };
            await Assert.ThrowsAsync<utma_academico.Exceptions.ApiException>(async () => await controller.Login(dto));
        }

        [Fact]
        public async Task Login_Throws_When_User_Not_Found()
        {
            var config = TestHelpers.CreateConfigurationWithJwtAndApiKey();
            using var db = TestHelpers.CreateInMemoryContext();
            var jwtSvc = new JwtService(config);
            var controller = new AuthController(db, jwtSvc, config);

            var dto = new utma_academico.DTOs.LoginDto { Usuario = "noexists", ApiKey = "utma_local_dev_key" };
            await Assert.ThrowsAsync<utma_academico.Exceptions.ApiException>(async () => await controller.Login(dto));
        }
    }
}
