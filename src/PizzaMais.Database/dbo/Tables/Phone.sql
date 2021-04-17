CREATE TABLE [dbo].[Phone]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Number] VARCHAR(15) NOT NULL,
	[PhoneType] INT NOT NULL,
	[Active] BIT NOT NULL,
	[DateLastChange] DATETIME NULL,
	[DateCreation] DATETIME NOT NULL,
	[UserIdCreation] INT NOT NULL,
	[UserIdLastChange] INT NULL
)
GO
CREATE UNIQUE INDEX AK_Phone_Number 
   ON [dbo].[Phone] (Number);   