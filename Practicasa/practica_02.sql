-- procedimiento almacenado (sp) para actualizar el precio de un producto y registrar el cambio
--proceso:
--1.- crear un procedimiento almacenado (sp) actualizar precio producto
--2.- crear una tabla que se llame cambio de precios, los cambios seran cmabio id de tipo entero y debe ser un identity y primari key
-- producto id de tipo entero(int) 
-- presio anterior (money) 
-- precio nuevo (money)
-- fecha de cambio (date time) en trasact es (get date)
--3.- el precdimiento alamacenado debe aceptar dos parametros:
--    el prducto que a cambiar y el nuevo precio
--4.- el prcedimiento debe actalizar el precio y el producto en la tabla products
--5.- el precedimiento debe insertar un registro en la tabla cabio de precio con los detalles del cambio
use NORTHWND
go

CREATE PROCEDURE ActualizarPrecioProducto
    @ProductID INT,
    @NuevoPrecio MONEY
AS
BEGIN
    -- Actualizar el precio en la tabla Products
    UPDATE Products
    SET Precio = @NuevoPrecio
    WHERE ProductoID = @ProductoID;

    -- Insertar un registro en la tabla CambioDePrecios
    INSERT INTO CambioDePrecios (ProductoID, PrecioAnterior, PrecioNuevo, FechaCambio)
    VALUES (@ProductoID, (SELECT Precio FROM Products WHERE ProductoID = @ProductoID), @NuevoPrecio, GETDATE());
END;
