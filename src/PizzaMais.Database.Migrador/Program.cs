using FluentMigrator.Runner;
using Microsoft.Extensions.DependencyInjection;
using PizzaMais.Database.Migrador.Migrar;
using System;

namespace PizzaMais.Database.Migrador
{
    class Program
    {
        static void Main(string[] args)
        {
            var serviceProvider = CreateServices();

            // Put the database update into a scope to ensure
            // that all resources will be disposed.
            using (var scope = serviceProvider.CreateScope())
            {
                UpdateDatabase(scope.ServiceProvider);
            }

           static IServiceProvider CreateServices()
            {
                return new ServiceCollection()
                    .AddFluentMigratorCore()
                    .ConfigureRunner(rb => rb
                        .AddPostgres()
                        .WithGlobalConnectionString("Host=localhost;Port=5432;Username=postgres;Password=masterkey;Database=PizzaMais")
                        .ScanIn(typeof(VersaoZero).Assembly).For.Migrations()
                        //.ScanIn(typeof(Versao1).Assembly).For.Migrations()
                        )
                    .AddLogging(lb => lb.AddFluentMigratorConsole())
                    .BuildServiceProvider(false);
            }
            

            static void UpdateDatabase(IServiceProvider serviceProvider)
            {

                var runner = serviceProvider.GetRequiredService<IMigrationRunner>();
                runner.MigrateUp();
            }
        }
    }
}
