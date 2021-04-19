CREATE TABLE [dbo].[TipoPagamento]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Nome] VARCHAR(50) NOT NULL,
	[Ativo] BIT NOT NULL,
	[DataAtualizacao] DATETIME NULL,
	[DataCriacao] DATETIME NOT NULL,
	[UsuarioIdCriacao] INT NOT NULL,
	[UsuarioIdAtualizacao] INT NULL
)
