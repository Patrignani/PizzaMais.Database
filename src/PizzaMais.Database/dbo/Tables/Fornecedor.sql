﻿CREATE TABLE [dbo].[Fornecedor]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Nome] VARCHAR(80) NOT NULL,
	[Documento] VARCHAR(14) NOT NULL,
	[TipoDocumento] SMALLINT,
	[Ativo] BIT NOT NULL,
	[DataAtualizacao] DATETIME NULL,
	[DataCriacao] DATETIME NOT NULL,
	[UsuarioIdCriacao] INT NOT NULL,
	[UsuarioIdAtualizacao] INT NULL
)