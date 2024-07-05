
--Consultas avanzadas

select c.CategoryName as 'Nombre Categoria', 
p.ProductName as 'Nombre Producto',
p.UnitPrice as 'Precio',
p.UnitsInStock as 'Existencia'
from
Categories as c
inner join Products as p
on c.CategoryID = p.CategoryID


where CategoryName ('Beverages', 'Produce')

-- seleccionar todas las ordenes que fueron emitidas por los empleados:
--Nancy Davolio, Anne Dodsworyh y Andrew Fuller.

select *from Orders
where EmployeeID=1
or EmployeeID=9
or EmployeeID=2;

select * from Orders
where  EmployeeID in (1,2,9);

-- selectcionar todas las ordenes dividiendo la fecha de orden en, año, mes y día.

select orderDate as 'Fecha de orden',
year(OrderDate) 'Año',
month (OrderDate) as'mes',
day (OrderDate) as'Día'
from Orders;
--Seleccionar todos los enobres d elos empleados

select CONCAT(FirstName, '', LastName )  as 'Nombre Completo'
from Employees;

-- Seleccionar todos los productos donde la existencia se a mayor o igual a 40
-- y el precio sea menor a 19
select ProductName as'Nombre del producto',
UnitPrice as'Precio',
UnitsInStock as 'Existencias' 
from Products
where UnitsInStock >= 40 
and UnitPrice <9;

-- Seleccionar todas las ordenes ralizadas de abril a Agosto de 1996

select OrderID, 
CustomerID, EmployeeID, OrderDate
from Orders
where OrderDate between '1996-04-01' and '1996-08-31';


-- seleccionar todas las ordenes entre 1996 y 1998

select OrderID,
CustomerID,
EmployeeID,
OrderDate
from Orders
where OrderDate between '1996-1-1' and '1999-12-31';

-- seleccionar todas las ordenes entre 1996 y 1999

select *from Orders
where YEAR(OrderDate) Between '1996' and '1999';


-- seleccionar todos los productos que comiencen con C

select *
from 
Products
where ProductName like 'c%';

-- ejem0lo de cadena

select *
from 
Products
where ProductName like 'ca%';

--seleccionar todos los  productos que terminen con s
select *
from 
Products
where ProductName like 's%';

-- seleccionar todos los productos que del producto contenga la palabra no

select *
from 
Products
where ProductName like '%no%';

--sellecionar todos los productos que contengan las letras a ó n

select *
from 
Products
where ProductName like '%[AN]%';


--seleccionar todos  los prductos que comiencen entre la letra a y la n

select *
from 
Products
where ProductName like '%[AN]%';

-- crear una tabla de datos
create database pruebaxyz;
use pruebaxyz;

-- crea una tabla a partir de una consulta con cero registros
select top 0 *
into pruebaxyz.dbo.products2
from NORTHWND.dbo.products;

-- agregar un constraint a la tabla products2

alter table products2
add constraint pk_products2
primary key (productid)

alter table products2
drop constraint 

select * from products2

--llenar una atabla a partir de una consulta

insert into pruebaxyz.dbo.products2 (ProductName, SupplierID,
CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
select ProductName, SupplierID,
CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued
from NORTHWND.dbo.products;

--  obtener el nombre del cliente y el nombre del represengtante de ventas de cada pedido

-- nombre del cliente (cosyumers)
-- nombre de empleado (Employees)
-- perdido

use NORTHWND;
select o.customerId, o.Employeeid, o.orderid, o.orderdate from 
orders as o;

select CompanyName as 'Nombre del cliente',
concat(e.FirstName, ',', e.LastName) as 'Nombre del cliente', 
o.OrderID, o.OrderDate
from Customers as c
inner join
Orders as o
on o.customerid = c.customerid
 inner join Employees as e
 on o.EmployeeID = e.EmployeeID
 inner join [order details] as od
 on od.OrderID = o.OrderID
 -- where year (OrderDate) in ('1996', '1998') otra forma de hacerlo es :
where year(OrderDate) ='1996' or
year(OrderDate) ='1998'; 

-- Ejercicio 2: Mostrar  el nombre del producto,
-- el nombre  del proveedro
-- y el precio unitario de cada producto

select p.ProductName as 'nombre de producto'
s.CompanyName as 
from Products as p
inner join Suppliers as s
on p.SupplierID=s.SupplierID

--selecionar el total de ordenes hechas por cada uno de los proveedores

select s.CompanyName  as 'Proveedores', count(*) as 'total de ordenes'
from Suppliers as s
inner join products as p
on s.SupplierID =p.SupplierID
inner join [Order Details] as od
on od.ProductID=p.ProductID
group by s.CompanyName;


-- seleccionar el total de dinero que he vendido por proveedor del ultimo trimestre de 1996

select s.CompanyName as 'proveedor', sum(od.UnitPrice*od.Quantity) as 'total de ventas $'
from Suppliers as s
inner join Products as p
on s.SupplierID= p.SupplierID
inner join [Order Details]as od
on od.ProductID =p.ProductID
inner join Orders as o
on o.OrderID=od.OrderID
where o.OrderDate between '1996-09-01' and '1996-12-31'
group by s.CompanyName
order by 'total de ventas $' desc

-- la suma total de la venta del trimestre

select sum(od.UnitPrice*od.Quantity) as 'total de ventas $'
from Suppliers as s
inner join Products as p
on s.SupplierID= p.SupplierID
inner join [Order Details]as od
on od.ProductID =p.ProductID
inner join Orders as o
on o.OrderID=od.OrderID
where o.OrderDate between '1996-09-01' and '1996-12-31'
order by 'total de ventas $' desc

select sum (unitprice * quantity) as 'total de ventas'
from [Order Details]

-- seleccionar el total de dinero vendido por categoria

select c.categoryname,
sum(od.Quantity * od.UnitPrice) as 'total de ventas' 
from [Order Details] as od
inner join products as p
on od.productid =p.productid
inner join categories as c
on c.categoryid=p.categoryid
group by c.categoryname
order by 2 desc;

-- seleccionar el total de dinero vandido por categoria y dendto por producto

select c.categoryname, p.productname,
sum(od.Quantity * od.UnitPrice) as 'total de ventas' 
from [Order Details] as od
inner join products as p
on od.productid =p.productid
inner join categories as c
on c.categoryid=p.categoryid
group by c.categoryname, p.productname
order by 2 desc;

-- seleccionar el total de productos vendidos 
select c.CategoryName as 'Nombre de categoria',
p.productname as 'producto',
sum(od.Quantity*od.UnitPrice) as 'Total'
from [Order Details] as od
inner join Products as p
on od.ProductID=p.ProductID
inner join Categories as c
on c.CategoryID=p.CategoryID
group by c.CategoryName, p.ProductName
order by 1 asc;