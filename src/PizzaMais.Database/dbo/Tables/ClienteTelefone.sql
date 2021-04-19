CREATE TABLE [dbo].[ClienteTelefone]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[ClienteId] INT NOT NULL,
	[TelefoneId] INT NOT NULL,
	[Principal] BIT NULL,
	FOREIGN KEY ([ClienteId]) REFERENCES [Cliente](Id),
	FOREIGN KEY ([TelefoneId]) REFERENCES [Telefone](Id)
)

GO

CREATE NONCLUSTERED INDEX CustomerPhone_PhoneId_CustomerId
ON [dbo].[ClienteTelefone] (TelefoneId) INCLUDE ([ClienteId])


