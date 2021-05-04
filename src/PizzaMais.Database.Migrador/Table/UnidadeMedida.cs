using FluentMigrator.Builders.Create;

namespace PizzaMais.Database.Migrador.Table
{
    public static class UnidadeMedida
    {
        public static ICreateExpressionRoot AddUnidadeMedida(this ICreateExpressionRoot root)
        {
            root.Table("UnidadeMedida")
                .AddPadrao()
                .WithColumn("Nome").AsString(110).NotNullable().Unique()
                .WithColumn("Sigla").AsString(5).NotNullable().Unique();

            return root;
        }
    }
}
