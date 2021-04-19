CREATE TABLE [dbo].[Borda]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Nome] VARCHAR(80)  NOT NULL,
	[Preco] DECIMAL(18,2) NOT NULL,
	[Ativo] BIT NOT NULL,
	[DataAtualizacao] DATETIME NULL,
	[DataCriacao] DATETIME NOT NULL,
	[UsuarioIdCriacao] INT NOT NULL,
	[UsuarioIdAtualizacao] INT NULL
)
