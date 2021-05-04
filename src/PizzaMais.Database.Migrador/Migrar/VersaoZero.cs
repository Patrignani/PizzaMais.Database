using FluentMigrator;
using PizzaMais.Database.Migrador.Table;

namespace PizzaMais.Database.Migrador.Migrar
{
    [Migration(0)]
    public class VersaoZero : Migration
    {
        public override void Up()
        {
            Create.AddFornecedor();   
        }

        public override void Down()
        {
            Delete.Table("Fornecedor");
        }
    }
}
