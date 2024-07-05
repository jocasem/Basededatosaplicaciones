use NORTHWND;
--Lenjuage SQL-LMD--
--Seleccionar todos los produtos--
select *from Products;
--seleccioanr todas las categorias
select *from Categories;
--selccionar los provedores
select* from Suppliers;
--selccionar los clientes--
select *from Customers;
--  selccionar los empleados--
select *from Employees;
--seleccionar todos las la paqueterias--
select *from Shippers;
--seleccionar todas las ordenes de compras--
select*from Orders;
--seleccionar todas los detalles de ordenes--
select *from [Order Details];


--consultas simples--

--proyecciones--
select ProductID, ProductName,UnitsInStock, UnitPrice
from Products;

--Alias--
select ProductID AS NumeroProducto, ProductName AS 'Nombre Producto' ,UnitsInStock existencia, UnitPrice AS 'Precio'
from Products;

--Alias de tablas--
select Products.ProductID AS NumeroProducto, Products.ProductName AS 'Nombre Producto' ,UnitsInStock existencia, UnitPrice AS 'Precio'
from Products;
--Consulta interna(Estandar)--
select*from Products, Categories
Products as p, Categories as c
where p.CategoryID=c.CategoryID

select *from Products;
select *from Customers;

--campo calculado--
--selecccionar todos los prodecutos mostrando  le id del prodecuto, el nombre del prodecuto, la existencia el precio y el importe--

select*,(UnitPrice * UnitsInStock) as 'Importe' from Products; 

select ProductID as 'Nombre Producto', ProductName as 'Nombre del procduto',
UnitsInStock as 'Existencia', UnitPrice as 'Precio',(UnitPrice * UnitsInStock) as 'Importe'
 from Products;

 --seleccionar las primerass 10 ordenes
 
 select top 10 * from Orders;

 -- seleccionar todos los clienets ordeneados de forma acendente por el pais

 select customerId as 'Nombre del Cliente',
 companyName as 'nombre del cliente',
 address as 'Direccion',
 city as 'Ciudad',
 country as 'País'
 from Customers
 order by country asc;

  select customerId as 'Nombre del Cliente',
 companyName as 'nombre del cliente',
 address as 'Direccion',
 city as 'Ciudad',
 country as 'País'
 from Customers
 order by País asc;

 -- selecciona todos los cluentes ordenados de forma acendente por pais y dentro de cada pais
-- osdrnado por ciudad de forma decendente--

select CustomerId, CompanyName, country, city
from customers
order by country, city desc;

--operadores relacionales
--(<,>,<=,>=,== o !)

-- seleccionar los paises a los cuales se les ha enviado las ordenes

-- distint elimina datos de una columna para dejar los que se repiten pero los uno de cada uno

select  distinct shipcountry from Orders
order by 1
-- seleccionar todas las ordnes enviadas a francia

select * from orders
where shipCountry = 'france';

-- seleccionar todas las ordenes a francia mostrando el numero de orden
-- cliente al que se vendio, empleado que la realizo
-- el país al que se encvio,  la ciudad a la que se envio 
-- seleccionar las ordenes en donde no se ha asignado una region de envio

select OrdersId as 'Numero de orden',
CustomerId as'cliente',
EmployedId as 'emplead',
Shipocountry as 'pais',
Shipcity as 'ciudad' 
from orders
where shipCountry = 'france';

select OrdersId as 'Numero de orden',
CustomerId as'cliente',
EmployedId as 'emplead',
Shipocountry as 'pais',
Shipcity as 'ciudad' 
from ordersD

select OrderId as 'Numero de orden',
CustomerID as'cliente',
EmployeeID as 'emplead',
ShipCountry as 'pais',
ShipCity as 'ciudad',
ShipRegion as 'Region'
from orders
where shipRegion is null

--seleccionar los prductos con un presio mayor a 50 dolares

select UnitPrice as 'Precio' from products
where UnitPrice >50;

-- seleccionar los empleados contratados despues del premero de enero de 1990

select HireDate from Employees
where HireDate > ' 1990- 01-01'

-- seleccionar los clientes cuyo ID sea ayor que 10

select * from customers 
where Country  ='Germany'

-- mostrar los productos con una cantidad menor o igual a 100

select * from Products
where UnitsInStock <=100

-- seleccionar todas las prdenes realizadas antes del primenro de  enero de 1998

select * from Orders
where OrderDate < '1998-01-01'

-- seleccionar todas las ordenes realizadas por el empleado Fuller

select * from Orders
where EmployeeID =2

-- seleccionar todas las ordenes mostrando el numero de orden el cliente
-- y la fecha de orden dividida en año, mes y dia

select orderID, CustomerID, OrderDate,  year(OrderDate) as 'año',
Month(OrderDate) as 'Mes',
Day(OrderDate) as 'Dia'
from Orders

-- selecionar los prodctos con un precio mayor a 50 
-- y con una cantidad menor o igual a 100
select * from Products
where UnitPrice >50 and UnitsInStock <=100

-- selecccionar todas las ordenes para francia y alemania
-- el "in" sirve para seleccionar dos datos dentro de un solo "where"

select * from Orders
where shipCountry in ('france', 'Germany')

-- otra forma de hacerlo es:

select * from Orders
where shipCountry = 'France'
or shipCountry = 'Germany'
or shipCountry = 'México'

