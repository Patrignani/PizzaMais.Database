CREATE TABLE [dbo].[Andress]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Cep] INT NULL,
	[Street] VARCHAR(180) NOT NULL,
	[District] VARCHAR(180) NOT NULL,
	[CityId] INT NULL,
	[Active] BIT NOT NULL,
	[DateLastChange] DATETIME NULL,
	[DateCreation] DATETIME NOT NULL,
	[UserIdCreation] INT NOT NULL,
	[UserIdLastChange] INT NULL

	FOREIGN KEY ([CityId]) REFERENCES [City](Id)
)