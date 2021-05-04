using FluentMigrator.Builders.Create.Table;

namespace PizzaMais.Database.Migrador.Table
{
    public static class Basico
    {
        public static ICreateTableWithColumnOrSchemaOrDescriptionSyntax AddPadrao(this ICreateTableWithColumnOrSchemaOrDescriptionSyntax table)
        {
            table
                  .WithColumn("Id").AsInt32().PrimaryKey().Identity().Indexed()
                  .WithColumn("DataAtualizacao").AsDateTime2().Nullable()
                  .WithColumn("DataCriacao").AsDateTime2().NotNullable()
                  .WithColumn("UsuarioIdCriacao").AsInt32().NotNullable()
                  .WithColumn("UsuarioIdAtualizacao").AsInt32().Nullable()
                  .WithColumn("Ativo").AsBoolean().NotNullable();

            return table;
        }
    }
}
