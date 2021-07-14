using FluentMigrator.Builders.Create;

namespace PizzaMais.Database.Migrador.Table
{
    public static class Endereco
    {
        public static ICreateExpressionRoot AddEndereco(this ICreateExpressionRoot root)
        {
            root.Table("Endereco")
                .AddPadrao()
                .WithColumn("Logradouro").AsString(110).NotNullable()
                .WithColumn("Cep").AsString(10).NotNullable()
                .WithColumn("Bairro").AsString(110).NotNullable()
                .WithColumn("Cidade").AsString(110).NotNullable()
                .WithColumn("UF").AsString(110).NotNullable()
                .WithColumn("Complemento").AsString(110).NotNullable()
                .WithColumn("Padrao").AsBoolean().NotNullable();

            return root;
        }
    }
}
