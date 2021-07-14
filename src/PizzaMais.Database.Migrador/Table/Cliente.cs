using FluentMigrator.Builders.Create;

namespace PizzaMais.Database.Migrador.Table
{
    public static class Cliente
    {
        public static ICreateExpressionRoot AddCliente(this ICreateExpressionRoot root)
        {
            root.Table("Cliente")
                .AddPadrao()
                .WithColumn("Nome").AsString(110).NotNullable().Unique();

            return root;
        }
    }
}
