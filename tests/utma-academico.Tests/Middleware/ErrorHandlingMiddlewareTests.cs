using System;
using System.IO;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging.Abstractions;
using Microsoft.Extensions.Hosting;
using utma_academico.Middleware;
using utma_academico.Exceptions;
using Xunit;
using Microsoft.Extensions.FileProviders;

namespace utma_academico.Tests.Middleware
{
    class TestHostEnv : IHostEnvironment
    {
        public string EnvironmentName { get; set; } = Environments.Development;
        public string ApplicationName { get; set; } = "test";
        public string ContentRootPath { get; set; } = Directory.GetCurrentDirectory();
        public IFileProvider ContentRootFileProvider { get; set; } = new PhysicalFileProvider(Directory.GetCurrentDirectory());
    }

    public class ErrorHandlingMiddlewareTests
    {
        [Fact]
        public async Task Middleware_Handles_ApiException()
        {
            var env = new TestHostEnv();
            var logger = new NullLogger<ErrorHandlingMiddleware>();
            RequestDelegate next = (ctx) => throw ExceptionCatalog.BadRequest("bad");

            var middleware = new ErrorHandlingMiddleware(next, logger, env);

            var context = new DefaultHttpContext();
            context.Response.Body = new MemoryStream();

            await middleware.InvokeAsync(context);

            context.Response.Body.Seek(0, SeekOrigin.Begin);
            var text = new StreamReader(context.Response.Body).ReadToEnd();

            var doc = JsonDocument.Parse(text);
            Assert.Equal(400, context.Response.StatusCode);
            Assert.Equal("ERR_BAD_REQUEST", doc.RootElement.GetProperty("code").GetString());
            Assert.Equal("bad", doc.RootElement.GetProperty("message").GetString());
        }

        [Fact]
        public async Task Middleware_Handles_GeneralException_With_InternalCode()
        {
            var env = new TestHostEnv();
            env.EnvironmentName = Environments.Production; // don't include details
            var logger = new NullLogger<ErrorHandlingMiddleware>();
            RequestDelegate next = (ctx) => throw new InvalidOperationException("boom");

            var middleware = new ErrorHandlingMiddleware(next, logger, env);
            var context = new DefaultHttpContext();
            context.Response.Body = new MemoryStream();

            await middleware.InvokeAsync(context);

            context.Response.Body.Seek(0, SeekOrigin.Begin);
            var text = new StreamReader(context.Response.Body).ReadToEnd();
            var doc = JsonDocument.Parse(text);

            Assert.Equal(500, context.Response.StatusCode);
            Assert.Equal("ERR_INTERNAL", doc.RootElement.GetProperty("code").GetString());
            Assert.Equal("Error interno del servidor.", doc.RootElement.GetProperty("message").GetString());
            Assert.True(doc.RootElement.GetProperty("details").ValueKind == JsonValueKind.Null);
        }
    }
}
