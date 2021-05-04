using FluentMigrator.Runner;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using PizzaMais.Database.Migrador.Middleware;
using Serilog;
using System;

namespace PizzaMais.Database.Migrador
{
    class Program
    {
        public static IConfigurationRoot _configuration;

        static void Main(string[] args)
        {
            // Initialize serilog logger
            Log.Logger = new LoggerConfiguration()
                 .WriteTo.Console(Serilog.Events.LogEventLevel.Debug)
                 .MinimumLevel.Debug()
                 .Enrich.FromLogContext()
                 .CreateLogger();

            Log.Information("Creating service collection");
            IServiceCollection serviceCollection = new ServiceCollection();
            _configuration = serviceCollection.ConfigureServices();

            Log.Information("Building service provider");
            IServiceProvider serviceProvider = serviceCollection.BuildServiceProvider(false);

            try
            {
                Log.Information("Starting Migration");
                using (var scope = serviceProvider.CreateScope())
                {
                    _configuration.InitDataBase();
                    UpdateDatabase(scope.ServiceProvider);
                }
                Log.Information("Ending Migration");
            }
            catch (Exception ex)
            {
                Log.Fatal(ex, "Error running service");
            }
            finally
            {
                Log.CloseAndFlush();
            }
        }

        public static void UpdateDatabase(IServiceProvider serviceProvider)
        {

            var runner = serviceProvider.GetRequiredService<IMigrationRunner>();
            runner.MigrateUp();
           
        }
    }
}
