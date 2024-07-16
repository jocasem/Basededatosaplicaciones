--1 crear un sp para actualizar los precios de un producto y posteriormnte que guarde esa modificacion en una tabla de historicos
-- products y pricios histoticos(este se debe crear) 

-- 2realizar un sp que elimine una orden de complpra completa y debe actializar lo units os stock

use NORTHWND
go

CREATE TABLE ProductPriceHistory (
    HistoryID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT NOT NULL,
    OldPrice DECIMAL(10, 2) NOT NULL,
    NewPrice DECIMAL(10, 2) NOT NULL,
    ChangeDate DATETIME NOT NULL DEFAULT GETDATE(),
    ChangedBy NVARCHAR(50) NOT NULL
);

CREATE PROCEDURE spu_UpdateProductPrice
    @ProductID INT,
    @NewPrice DECIMAL(10, 2),
    @ChangedBy NVARCHAR(50)
AS
BEGIN
   

    DECLARE @OldPrice DECIMAL(10, 2);

   
    SELECT @OldPrice = UnitPrice
    FROM Products
    WHERE ProductID = @ProductID;

    
 
    UPDATE Products
    SET UnitPrice = @NewPrice
    WHERE ProductID = @ProductID;

    
    INSERT INTO ProductPriceHistory (ProductID, OldPrice, NewPrice, ChangeDate, ChangedBy)
    VALUES (@ProductID, @OldPrice, @NewPrice, GETDATE(), @ChangedBy);


END;

EXEC spu_UpdateProductPrice @ProductID = 1, @NewPrice = 20.99, @ChangedBy = 'Admin';


select* from Products
where ProductID=54
select* from [Order Details]
where OrderID = 10349
select * from Orders
where OrderID= 10349
