CREATE TABLE [dbo].[City]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Name] VARCHAR(150) NOT NULL,
	[Active] BIT NOT NULL,
	[DateLastChange] DATETIME NULL,
	[DateCreation] DATETIME NOT NULL,
	[UserIdCreation] INT NOT NULL,
	[UserIdLastChange] INT NULL
)
