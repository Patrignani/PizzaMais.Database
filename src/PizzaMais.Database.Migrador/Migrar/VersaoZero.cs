using FluentMigrator;
using PizzaMais.Database.Migrador.Table;

namespace PizzaMais.Database.Migrador.Migrar
{
    [Migration(0)]
    public class VersaoZero : Migration
    {
        public override void Up()
        {
            Create
                .AddFornecedor()
                .AddBorda()
                .AddIngrediente()
                .AddUnidadeMedida()
                .AddProdutoRevenda()
                .AddPizza()
                .AddPizzaIngrediente();
        }

        public override void Down()
        {
            Delete.Table("Fornecedor");
            Delete.Table("Borda");
            Delete.Table("Ingrediente");
            Delete.Table("UnidadeMedida");
            Delete.Table("ProdutoRevenda");
            Delete.Table("Pizza");
            Delete.Table("PizzaIngrediente");
        }
    }
}
