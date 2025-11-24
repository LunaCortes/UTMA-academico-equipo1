using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using Microsoft.Extensions.Configuration;
using utma_academico.Services;
using utma_academico.Tests.Helpers;
using Xunit;

namespace utma_academico.Tests.Services
{
    public class JwtServiceTests
    {
        [Fact]
        public void GenerateToken_Returns_Valid_Jwt_With_Claims()
        {
            var config = TestHelpers.CreateConfigurationWithJwtAndApiKey();
            var svc = new JwtService(config);

            var (token, expires) = svc.GenerateToken(42, "testuser");

            Assert.False(string.IsNullOrEmpty(token));
            Assert.True(expires > System.DateTime.UtcNow);

            var handler = new JwtSecurityTokenHandler();
            var jwt = handler.ReadJwtToken(token);

            Assert.Equal("utma", jwt.Issuer);
            Assert.Contains(jwt.Claims, c => c.Type == JwtRegisteredClaimNames.Sub && c.Value == "42");
            Assert.Contains(jwt.Claims, c => c.Type == System.Security.Claims.ClaimTypes.Name && c.Value == "testuser");
        }
    }
}
