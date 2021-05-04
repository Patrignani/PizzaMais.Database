using FluentMigrator.Builders.Alter;
using FluentMigrator.Builders.Create;
using FluentMigrator.Builders.Update;

namespace PizzaMais.Database.Migrador.Table
{
    public static class Fornecedor
    {
        public static ICreateExpressionRoot AddFornecedor(this ICreateExpressionRoot root)
        {
            root.Table("Fornecedor")
                .AddPadrao()
                .WithColumn("Nome").AsString(40).NotNullable().Unique()
                 .WithColumn("Documento").AsString(20).NotNullable().Unique()
                 .WithColumn("TipoDocumento").AsInt16().NotNullable();

            return root;
        }

        public static IAlterExpressionRoot EditFornecedor(this IAlterExpressionRoot root)
        {
            root.Table("Fornecedor").AlterColumn("TipoDocumento").AsInt16().NotNullable();


            return root;
        }
    }
}
