--Store Procedure
--Actualice los precios de un producto y posteriormente que guarde su modificacion en una

use NORTHWND
go
create or alter proc sp_
as
begin

begin try
begin transaction

rollback transaction
end try
begin catch
print
end catch
end;
go

--realizar un store procedure que elimine una orden de compra completa y debe acualizar los unitstocks 

use NORTHWND
go


CREATE PROCEDURE sp_cancelando1
    @OrderID int
AS
BEGIN
   
    BEGIN TRY  
        BEGIN TRANSACTION; 
        DELETE FROM [Order Details]
        WHERE OrderID = @OrderID;

     
        DELETE FROM Orders
        WHERE OrderID = @OrderID;

      
        UPDATE Products
        SET UnitsInStock = (UnitsInStock + OD.Quantity)
        FROM Products as P
        INNER JOIN [Order Details] as OD 
		ON P.ProductID = OD.ProductID;

        COMMIT TRANSACTION; 
        
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION; 
         
    END CATCH
END;
GO

exec sp_cancelando1 @OrderID = 10349;

select * from [Order Details]

select * from Products
where ProductID = 54
select * from [Order Details]
where OrderID=10349
select *from Orders
where OrderID=10349

select * from Products
inner join Orders
on OrderID=OrderID