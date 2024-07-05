-- funciones de agregado y agrupaciones}

-- utilizar base de datos

use NORTHWND;

--funciones de agrgado

-- seleccionar el numero de datos  totales de ordenes de compra

-- cont(*)

select count(*) as 'numero de ordenes' from Orders;

select count(*) from Customers;

-- count (campo)

select count (region) from Customers;

-- seleccionar el maximo numero de productos pedidos

select max(Quantity) as 'cantidad'
from [Order Details];



select min(Quantity) as 'cantidad'
from [Order Details];


-- seleccionar el total de las cantidades de lso productos pedidos

select sum(unitprice) from [Order Details];


-- seleccionar el total de dinero qye he vendido

select *, (Quantity * unitprice) as 'importe' from [Order Details];


select sum(Quantity * od.UnitPrice) as 'total' 
from [Order Details] as od
inner join products as p
on od.productid= p.productid
where p.productName='Aniseed Syrup';

-- seleccioanrvpromedio de las venats del producto
select avg(Quantity * od.UnitPrice) as 'total' 
from [Order Details] as od
inner join products as p
on od.productid= p.productid
where p.productName='Aniseed Syrup';

-- selecccioanr enumero de productos pro actegoria

select categoryid, COUNT(*)as 'numero producto'
from Products


select categoryid
from Products;

select count (*)
from Products;

select categoryid, count(*) as 'Total de productos'
from Products
group by categoryid;

--seleccionae el numero de productos por nombre de categoria

select c.CategoryName, count(ProductID) as 'Total de prodcutos'
from Categories as c
inner join Products as p
on c.CategoryID = p.CategoryID
where c.CategoryName in ('beverages', 'confections')
group by c.categoryname;