using Dapper;
using FluentMigrator.Runner;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Npgsql;
using System;
using System.IO;

namespace PizzaMais.Database.Migrador.Middleware
{
    public static class Startup
    {
        public static IConfigurationRoot ConfigureServices(this IServiceCollection serviceCollection)
        {
            // Build configuration
            IConfigurationRoot configuration = new ConfigurationBuilder()
                .SetBasePath(Directory.GetParent(AppContext.BaseDirectory).FullName)
                .AddJsonFile("appsettings.json", false)
                .Build();

            serviceCollection.AddSingleton(configuration);
            serviceCollection.ConfigurarFluent(configuration);

            return configuration;

        }

        public static void InitDataBase(this IConfiguration configuration) {
            var connectionStringBuilder = new NpgsqlConnectionStringBuilder(configuration.GetConnectionString("PizzaMais"));
            var databaseName = connectionStringBuilder.Database;
            connectionStringBuilder.Database = "";

            using (var connection = new NpgsqlConnection(connectionStringBuilder.ConnectionString))
            {
                connection.Open();
                var result = connection.ExecuteScalar<int>(@"SELECT COUNT(datname) FROM pg_database WHERE datname =@DatabaseName", new { DatabaseName = databaseName });

                if (result == 0)
                {
                    connection.Execute($@"CREATE DATABASE ""{databaseName}""  WITH
                                              OWNER = postgres
                                              ENCODING = 'UTF8'
                                              CONNECTION LIMIT = -1");
                }
            }
        }

        public static IServiceCollection ConfigurarFluent(this IServiceCollection serviceCollection, IConfigurationRoot configuration)
        {
            Console.WriteLine(configuration.GetConnectionString("PizzaMais"));
            serviceCollection
                .AddFluentMigratorCore()
                .ConfigureRunner(rb => rb
                    .AddPostgres()
                    .WithGlobalConnectionString(configuration.GetConnectionString("PizzaMais"))
                        .Builder()
                        )
                    .AddLogging(lb => lb.AddFluentMigratorConsole());

            return serviceCollection;
        }
    }
}
