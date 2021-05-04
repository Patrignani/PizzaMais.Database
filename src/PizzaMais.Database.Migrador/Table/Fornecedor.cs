using FluentMigrator.Builders.Create;

namespace PizzaMais.Database.Migrador.Table
{
    public static class Fornecedor
    {
        public static ICreateExpressionRoot AddFornecedor(this ICreateExpressionRoot root)
        {
            root.Table("Fornecedor")
                .AddPadrao()
                .WithColumn("Nome").AsString(110).NotNullable().Unique()
                 .WithColumn("Documento").AsString(20).NotNullable().Unique()
                 .WithColumn("TipoDocumento").AsInt16().NotNullable();

            return root;
        }
    }
}
