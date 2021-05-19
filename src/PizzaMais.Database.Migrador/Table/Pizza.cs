using FluentMigrator.Builders.Create;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PizzaMais.Database.Migrador.Table
{
    public static class Pizza
    {
        public static ICreateExpressionRoot AddPizza(this ICreateExpressionRoot root)
        {
            root.Table("Pizza")
                .AddPadrao()
                .WithColumn("Nome").AsString(110).NotNullable().Unique()
                .WithColumn("Codigo").AsString(10).NotNullable().Unique()
                .WithColumn("Preco").AsDecimal(18, 2).NotNullable();

            return root;
        }
    }
}
