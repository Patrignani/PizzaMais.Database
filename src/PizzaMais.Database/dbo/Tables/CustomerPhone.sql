CREATE TABLE [dbo].[CustomerPhone]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[CustomerId] INT NOT NULL,
	[PhoneId] INT NOT NULL,
	[Main] BIT NULL,
	FOREIGN KEY ([CustomerId]) REFERENCES [Customer](Id),
	FOREIGN KEY ([PhoneId]) REFERENCES [Phone](Id)
)
