using FluentMigrator.Builders.Create;

namespace PizzaMais.Database.Migrador.Table
{
    public static class Telefone
    {
        public static ICreateExpressionRoot AddTelefone(this ICreateExpressionRoot root)
        {
            root.Table("Telefone")
                .AddPadrao()
                .WithColumn("Numero").AsString(15).NotNullable().Unique()
                .WithColumn("TipoNumero").AsInt32().NotNullable()
                .WithColumn("Padrao").AsBoolean().NotNullable();

            return root;
        }
    }
}
