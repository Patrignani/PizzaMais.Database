using FluentMigrator.Builders.Create;

namespace PizzaMais.Database.Migrador.Table
{
    public static class ClienteTelefone
    {
        public static ICreateExpressionRoot AddClienteTelefone(this ICreateExpressionRoot root)
        {
            root.Table("ClienteTelefone")
                    .WithColumn("Id").AsInt32().PrimaryKey().Identity().Indexed()
                    .WithColumn("ClienteId").AsInt32().NotNullable().ForeignKey("Cliente", "Id")
                    .WithColumn("TelefoneId").AsInt32().NotNullable().ForeignKey("Endereco", "Id");

            return root;
        }
    }
}
