CREATE TABLE [dbo].[Cidade]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Nome] VARCHAR(150) NOT NULL,
	[Ativo] BIT NOT NULL,
	[DataAtualizacao] DATETIME NULL,
	[DataCriacao] DATETIME NOT NULL,
	[UsuarioIdCriacao] INT NOT NULL,
	[UsuarioIdAtualizacao] INT NULL
)
