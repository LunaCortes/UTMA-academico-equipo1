using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using utma_academico.DTOs;
using Xunit;

namespace utma_academico.Tests.Dto
{
    public class DtoValidationTests
    {
        private static IList<ValidationResult> Validate(object model)
        {
            var ctx = new ValidationContext(model, null, null);
            var results = new List<ValidationResult>();
            Validator.TryValidateObject(model, ctx, results, true);
            return results;
        }

        [Fact]
        public void CalificacionCreateDto_Validation_Fails_For_Invalid_Values()
        {
            var dto = new CalificacionCreateDto { AlumnoId = 0, MateriaId = 0, Parcial = 5, Calificacion = -1 };
            var results = Validate(dto);
            Assert.NotEmpty(results);
        }

        [Fact]
        public void AsistenciaCreateDto_Defaults_Are_Considered_Valid_By_DataAnnotations()
        {
            var dto = new AsistenciaCreateDto();
            var results = Validate(dto);
            // Required on non-nullable value types (int/DateTime/bool) will not trigger validation errors by default
            Assert.Empty(results);
        }
    }
}
