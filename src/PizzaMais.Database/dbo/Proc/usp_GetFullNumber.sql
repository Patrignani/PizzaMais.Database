CREATE PROCEDURE [dbo].[usp_GetFullNumber](
@Value varchar(13)
)
AS
BEGIN
	SELECT TOP 8 
		Numero  
	FROM 
		Telefone
	WHERE 
		Numero LIKE  @value +'%'
END
