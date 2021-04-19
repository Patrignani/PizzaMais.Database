CREATE TABLE [dbo].[ClienteEndereco]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[ClienteId] INT NOT NULL,
	[EnderecoId] INT NOT NULL,
	[Principal] BIT NULL,
	FOREIGN KEY ([ClienteId]) REFERENCES [Cliente](Id),
	FOREIGN KEY ([EnderecoId]) REFERENCES [Endereco](Id)
)
GO
CREATE NONCLUSTERED INDEX CustomerAndress_AndressId_CustomerId
ON [dbo].[ClienteEndereco] ([EnderecoId]) INCLUDE ([ClienteId])