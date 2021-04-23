CREATE TABLE [dbo].[UnidadeMedida]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Nome] VARCHAR(80)  NOT NULL,
	[Sigla] VARCHAR(5)  NOT NULL,
	[Ativo] BIT NOT NULL,
	[DataAtualizacao] DATETIME NULL,
	[DataCriacao] DATETIME NOT NULL,
	[UsuarioIdCriacao] INT NOT NULL,
	[UsuarioIdAtualizacao] INT NULL
)
GO
CREATE UNIQUE INDEX uidx_nome
ON [dbo].[UnidadeMedida] (Nome, Sigla);