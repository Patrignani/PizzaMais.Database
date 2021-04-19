CREATE TABLE [dbo].[Telefone]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Numero] VARCHAR(15) NOT NULL,
	[TipoTelefone] INT NOT NULL,
	[Ativo] BIT NOT NULL,
	[DataAtualizacao] DATETIME NULL,
	[DataCriacao] DATETIME NOT NULL,
	[UsuarioIdCriacao] INT NOT NULL,
	[UsuarioIdAtualizacao] INT NULL
)
GO
CREATE UNIQUE INDEX AK_Phone_Number 
   ON [dbo].[Telefone] (Numero);   