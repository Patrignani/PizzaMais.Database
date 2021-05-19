using FluentMigrator.Builders.Create;

namespace PizzaMais.Database.Migrador.Table
{
    public static class ProdutoRevenda
    {
        public static ICreateExpressionRoot AddProdutoRevenda(this ICreateExpressionRoot root)
        {
            root.Table("ProdutoRevenda")
                .AddPadrao()
                .WithColumn("Nome").AsString(110).NotNullable().Unique()
                .WithColumn("Codigo").AsString(10).NotNullable().Unique()
                .WithColumn("FornecedorId").AsInt32().NotNullable().ForeignKey("Fornecedor","Id")
                .WithColumn("Quantidade").AsDecimal(10,4).Nullable()
                .WithColumn("UnidadeMedidaId").AsInt32().Nullable().ForeignKey("UnidadeMedida", "Id")
                .WithColumn("Preco").AsDecimal(18, 2).NotNullable();

            return root;
        }
    }
}
