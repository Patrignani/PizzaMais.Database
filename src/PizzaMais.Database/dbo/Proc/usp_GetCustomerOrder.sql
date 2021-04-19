CREATE PROCEDURE [dbo].[usp_GetCustomerOrder]
(
	@Value varchar(13)
)
AS
BEGIN
	SELECT TOP 8 
		C.Id, 
		C.Nome, 
		CP.TelefoneId,
		P.Numero AS TelefoneNumero, 
		CA.EnderecoId,
		A.CEP,
		A.Rua, 
		A.Bairro,
		A.Numero AS EnderecoNumero, 
		A.Complemento,
		A.CidadeId,
		CI.Nome AS CITY   
	FROM 
		Cliente C INNER JOIN ClienteEndereco CA 
			ON C.ID = CA.ClienteId
		INNER JOIN Endereco A 
			ON A.ID = CA.EnderecoId AND CA.Principal = 1
		LEFT JOIN Cidade CI 
			ON CI.ID = A.CidadeId
		INNER JOIN ClienteTelefone CP 
			ON CP.ClienteId = C.ID
		INNER JOIN Telefone P 
			ON P.ID = CP.TelefoneId
	WHERE 
		P.Numero LIKE   @value +'%'

END

