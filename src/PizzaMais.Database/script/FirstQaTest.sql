DECLARE @loop int = 0
DECLARE @CustumerId TABLE (ID INT)
DECLARE @PhoneId TABLE (ID INT)
DECLARE @AndressId TABLE (ID INT)
BEGIN

if not exists (select top 1  * from City)
insert into City([Name],Active, DateCreation, UserIdCreation) values('Jundiaí/SP', 1, GETDATE(), 1) 

    WHILE @loop < 10   
    BEGIN
			 insert into Customer([Name], Active, DateCreation, UserIdCreation) OUTPUT INSERTED.ID  INTO @CustumerId(ID) values('Teste' + CONVERT(varchar(10),@loop), 1, GETDATE(), 1) 
			 insert into Phone(Number,PhoneType,Active, DateCreation, UserIdCreation) OUTPUT INSERTED.ID  INTO @PhoneId(ID) 
			 values(CONVERT(varchar(15),999970000 + @loop), 1, 1, GETDATE(), 1) 
			  insert into Andress(Cep,District, street, CityId, Number,Complement,Active, DateCreation, UserIdCreation) OUTPUT INSERTED.ID  INTO @AndressId(ID)
			  values(13213000 + @loop,'Vila '+  CONVERT(varchar(10),@loop), 'Rua '+  CONVERT(varchar(10),@loop),3,@loop, CONVERT(varchar(10),@loop), 1, GETDATE(), 1) 

			  insert into CustomerAndress(CustomerId, AndressId, Main) values((select top 1 ID from @CustumerId), (select top 1 ID from @AndressId), 1)
			  insert into CustomerPhone(CustomerId, PhoneId, Main) values((select top 1 ID from @CustumerId), (select top 1 ID from @PhoneId), 1)

			 SET @loop += 1
			 delete  @CustumerId
			  delete  @PhoneId
			  delete  @AndressId
    END;

set @loop = 0
DECLARE @Count INT = (SELECT COUNT(*) FROM CUSTOMER)
DECLARE @CustomerId INT 
WHILE @loop < @Count   
    BEGIN
	set @CustomerId = (SELECT Id FROM CUSTOMER ORDER BY 1 OFFSET @loop ROWS FETCH NEXT 1 ROWS ONLY)

	 insert into Phone(Number,PhoneType,Active, DateCreation, UserIdCreation) OUTPUT INSERTED.ID  INTO @PhoneId(ID) values(CONVERT(varchar(15),45980000 + @loop), 1, 1, GETDATE(), 1) 
	  insert into CustomerPhone(CustomerId, PhoneId, Main) values(@CustomerId, (select top 1 ID from @PhoneId), 0)

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