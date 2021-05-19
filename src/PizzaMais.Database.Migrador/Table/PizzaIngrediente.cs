using FluentMigrator.Builders.Create;

namespace PizzaMais.Database.Migrador.Table
{
    public static class PizzaIngrediente
    {
        public static ICreateExpressionRoot AddPizzaIngrediente(this ICreateExpressionRoot root)
        {
            root.Table("PizzaIngrediente")
                .WithColumn("Id").AsInt32().PrimaryKey().Identity().Indexed()
                .WithColumn("PizzaId").AsInt32().NotNullable().ForeignKey("Pizza", "Id")
                .WithColumn("IngredienteId").AsInt32().NotNullable().ForeignKey("Ingrediente", "Id");

            return root;
        }
    }
}
