using FluentMigrator.Builders.Create;

namespace PizzaMais.Database.Migrador.Table
{
    public static class Ingrediente
    {
        public static ICreateExpressionRoot AddIngrediente(this ICreateExpressionRoot root)
        {
            root.Table("Ingrediente")
                .AddPadrao()
                .WithColumn("Nome").AsString(110).NotNullable().Unique();

            return root;
        }
    }
}
