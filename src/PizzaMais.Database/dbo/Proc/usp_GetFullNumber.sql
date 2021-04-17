CREATE PROCEDURE [dbo].[usp_GetFullNumber](
@Value varchar(13)
)
AS
BEGIN
	SELECT TOP 8 
		Number  
	FROM 
		Phone
	WHERE 
		Number LIKE  @value +'%'
END
