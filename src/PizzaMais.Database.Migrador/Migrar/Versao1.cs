using FluentMigrator;
using PizzaMais.Database.Migrador.Table;

namespace PizzaMais.Database.Migrador.Migrar
{
    [Migration(1)]
    public class Versao1 : Migration
    {
        public override void Up()
        {
            Alter.EditFornecedor();
        }

        public override void Down()
        {
            Delete.Table("Fornecedor");
        }
    }

  
}
