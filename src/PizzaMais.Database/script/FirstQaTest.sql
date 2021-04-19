DECLARE @loop int = 0
DECLARE @CustumerId TABLE (ID INT)
DECLARE @PhoneId TABLE (ID INT)
DECLARE @AndressId TABLE (ID INT)
BEGIN

if not exists (select top 1  * from Cidade)
insert into Cidade([Nome],Ativo, DataCriacao, UsuarioIdCriacao) values('Jundiaí/SP', 1, GETDATE(), 1) 

    WHILE @loop < 10   
    BEGIN
			 insert into Cliente([Nome], Ativo, DataCriacao, UsuarioIdCriacao) OUTPUT INSERTED.ID  INTO @CustumerId(ID) values('Teste' + CONVERT(varchar(10),@loop), 1, GETDATE(), 1) 
			 insert into Telefone(Numero,TipoTelefone,Ativo, DataCriacao, UsuarioIdCriacao) OUTPUT INSERTED.ID  INTO @PhoneId(ID) 
			 values(CONVERT(varchar(15),999970000 + @loop), 1, 1, GETDATE(), 1) 
			  insert into Endereco(Cep,Bairro, Rua, CidadeId, Numero,Complemento,Ativo, DataCriacao, UsuarioIdCriacao) OUTPUT INSERTED.ID  INTO @AndressId(ID)
			  values(13213000 + @loop,'Vila '+  CONVERT(varchar(10),@loop), 'Rua '+  CONVERT(varchar(10),@loop),3,@loop, CONVERT(varchar(10),@loop), 1, GETDATE(), 1) 

			  insert into ClienteEndereco(ClienteId, EnderecoId, Principal) values((select top 1 ID from @CustumerId), (select top 1 ID from @AndressId), 1)
			  insert into ClienteTelefone(ClienteId, TelefoneId, Principal) values((select top 1 ID from @CustumerId), (select top 1 ID from @PhoneId), 1)

			 SET @loop += 1
			 delete  @CustumerId
			  delete  @PhoneId
			  delete  @AndressId
    END;

set @loop = 0
DECLARE @Count INT = (SELECT COUNT(*) FROM Cliente)
DECLARE @CustomerId INT 
WHILE @loop < @Count   
    BEGIN
	set @CustomerId = (SELECT Id FROM Cliente ORDER BY 1 OFFSET @loop ROWS FETCH NEXT 1 ROWS ONLY)

	 insert into Telefone(Numero,TipoTelefone,Ativo, DataCriacao, UsuarioIdCriacao) OUTPUT INSERTED.ID  INTO @PhoneId(ID) values(CONVERT(varchar(15),45980000 + @loop), 1, 1, GETDATE(), 1) 
	  insert into ClienteTelefone(ClienteId, TelefoneId, Principal) values(@CustomerId, (select top 1 ID from @PhoneId), 0)

	  delete  @PhoneId
	 SET @loop += 1
    END;
END;

--delete Customer
--delete Phone
--delete CustomerPhone
--delete Andress
--delete CustomerAndress

--DBCC CHECKIDENT('Customer', RESEED, 0)
--DBCC CHECKIDENT('Phone', RESEED, 0)
--DBCC CHECKIDENT('CustomerPhone', RESEED, 0)
--DBCC CHECKIDENT('Andress', RESEED, 0)
--DBCC CHECKIDENT('CustomerAndress', RESEED, 0)

--select * from CustomerPhone where main = 0

--SELECT * from CustomerPhone  WHERE Main = 0