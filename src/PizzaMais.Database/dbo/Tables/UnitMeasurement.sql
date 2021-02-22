CREATE TABLE [dbo].[UnitMeasurement]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Name] VARCHAR(80)  NOT NULL,
	[Active] BIT NOT NULL,
	[DateLastChange] DATETIME NULL,
	[DateCreation] DATETIME NOT NULL,
	[UserIdCreation] INT NOT NULL,
	[UserIdLastChange] INT NULL
)
