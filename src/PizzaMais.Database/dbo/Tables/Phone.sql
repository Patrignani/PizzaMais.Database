CREATE TABLE [dbo].[Phone]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Number] INT NOT NULL,
	[PhoneType] INT NOT NULL,
	[Active] BIT NOT NULL,
	[DateLastChange] DATETIME NULL,
	[DateCreation] DATETIME NOT NULL,
	[UserIdCreation] INT NOT NULL,
	[UserIdLastChange] INT NULL
)
