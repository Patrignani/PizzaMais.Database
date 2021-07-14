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
                .AddPizzaIngrediente()
                .AddCliente()
                .AddEndereco()
                .AddClienteEndereco()
                .AddTelefone()
                .AddClienteTelefone();
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
            Delete.Table("Cliente");
            Delete.Table("Endereco");
            Delete.Table("ClienteEndereco");
            Delete.Table("Telefone");
            Delete.Table("ClienteTelefone");
        }
    }
}
