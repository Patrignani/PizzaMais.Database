using FluentMigrator.Builders.Create;

namespace PizzaMais.Database.Migrador.Table
{
    public static class Borda
    {
        public static ICreateExpressionRoot AddBorda(this ICreateExpressionRoot root)
        {
            root.Table("Borda")
                .AddPadrao()
                .WithColumn("Nome").AsString(110).NotNullable().Unique()
                .WithColumn("Preco").AsDecimal(18, 2).NotNullable();

            return root;
        }
    }
}
