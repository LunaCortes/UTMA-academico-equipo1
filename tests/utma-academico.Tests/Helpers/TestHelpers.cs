using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using utma_academico.Data;

namespace utma_academico.Tests.Helpers
{
    public static class TestHelpers
    {
        public static AcademicoDbContext CreateInMemoryContext(string dbName = null)
        {
            var options = new DbContextOptionsBuilder<AcademicoDbContext>()
                .UseInMemoryDatabase(dbName ?? Guid.NewGuid().ToString())
                .Options;

            return new AcademicoDbContext(options);
        }

        public static IConfiguration CreateConfigurationWithJwtAndApiKey(string apiKey = "utma_local_dev_key")
        {
            var dict = new System.Collections.Generic.Dictionary<string, string?>()
            {
                { "Jwt:Key", "VerySecret_SymmetricKey_ChangeThisInProduction_UTMA2025" },
                { "Jwt:Issuer", "utma" },
                { "Jwt:Audience", "utma_users" },
                { "Jwt:DurationMinutes", "240" },
                { "Authentication:TestApiKey", apiKey }
            };
            return new ConfigurationBuilder().AddInMemoryCollection(dict).Build();
        }
    }
}
