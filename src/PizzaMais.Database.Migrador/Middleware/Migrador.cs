using FluentMigrator.Runner;
using PizzaMais.Database.Migrador.Migrar;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaMais.Database.Migrador.Middleware
{
    public static class Migrador
    {
        private static List<Type> Versoes()
        {
            var versoes = new List<Type>
            {
                typeof(VersaoZero)
            };


            return versoes;
        }

        public static IMigrationRunnerBuilder Builder(this IMigrationRunnerBuilder runnerBuilder)
        {
            var veroes = Versoes();
            veroes.ForEach(x => {
                runnerBuilder.ScanIn(x.Assembly).For.Migrations();
            });

          

            return runnerBuilder;
        }
    }
}
