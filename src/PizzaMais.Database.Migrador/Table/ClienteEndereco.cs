using FluentMigrator.Builders.Create;

namespace PizzaMais.Database.Migrador.Table
{
    public static class ClienteEndereco
    {
        public static ICreateExpressionRoot AddClienteEndereco(this ICreateExpressionRoot root)
        {
            root.Table("ClienteEndereco")
                .WithColumn("Id").AsInt32().PrimaryKey().Identity().Indexed()
                .WithColumn("ClienteId").AsInt32().NotNullable().ForeignKey("Cliente", "Id")
                .WithColumn("EnderecoId").AsInt32().NotNullable().ForeignKey("Endereco", "Id");

            return root;
        }
    }
}
