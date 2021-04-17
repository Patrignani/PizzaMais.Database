CREATE TABLE [dbo].[Andress]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Cep] INT NULL,
	[Street] VARCHAR(180) NOT NULL,
	[District] VARCHAR(180) NOT NULL,
	[Number] INT NULL,
	[Complement] VARCHAR(120) NULL,
	[CityId] INT NULL,
	[Active] BIT NOT NULL,
	[DateLastChange] DATETIME NULL,
	[DateCreation] DATETIME NOT NULL,
	[UserIdCreation] INT NOT NULL,
	[UserIdLastChange] INT NULL

	FOREIGN KEY ([CityId]) REFERENCES [City](Id)
)
GO
CREATE NONCLUSTERED INDEX CustomerAndress_City
ON [dbo].[Andress] ([CityId])