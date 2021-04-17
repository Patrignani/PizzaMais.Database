CREATE TABLE [dbo].[CustomerAndress]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[CustomerId] INT NOT NULL,
	[AndressId] INT NOT NULL,
	[Main] BIT NULL,
	FOREIGN KEY ([CustomerId]) REFERENCES [Customer](Id),
	FOREIGN KEY ([AndressId]) REFERENCES [Andress](Id)
)
GO
CREATE NONCLUSTERED INDEX CustomerAndress_AndressId_CustomerId
ON [dbo].[CustomerAndress] ([AndressId]) INCLUDE ([CustomerId])