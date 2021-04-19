CREATE TABLE [dbo].[Endereco]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Cep] INT NULL,
	[Rua] VARCHAR(180) NOT NULL,
	[Bairro] VARCHAR(180) NOT NULL,
	[Numero] INT NULL,
	[Complemento] VARCHAR(120) NULL,
	[CidadeId] INT NULL,
	[Ativo] BIT NOT NULL,
	[DataAtualizacao] DATETIME NULL,
	[DataCriacao] DATETIME NOT NULL,
	[UsuarioIdCriacao] INT NOT NULL,
	[UsuarioIdAtualizacao] INT NULL

	FOREIGN KEY ([CidadeId]) REFERENCES [Cidade](Id)
)
GO
CREATE NONCLUSTERED INDEX CustomerAndress_City
ON [dbo].[Endereco] ([CidadeId])