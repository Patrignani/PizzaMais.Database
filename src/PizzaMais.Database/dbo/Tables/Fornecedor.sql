CREATE TABLE [dbo].[Fornecedor]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Nome] VARCHAR(80) NOT NULL,
	[Documento] VARCHAR(20) NOT NULL,
	[TipoDocumento] SMALLINT,
	[Ativo] BIT NOT NULL,
	[DataAtualizacao] DATETIME NULL,
	[DataCriacao] DATETIME NOT NULL,
	[UsuarioIdCriacao] INT NOT NULL,
	[UsuarioIdAtualizacao] INT NULL
)
GO
CREATE UNIQUE INDEX uidx_fornecedor_nome
ON [dbo].Fornecedor (Nome);
GO
CREATE UNIQUE INDEX uidx_fornecedor_documento
ON [dbo].Fornecedor (Documento);