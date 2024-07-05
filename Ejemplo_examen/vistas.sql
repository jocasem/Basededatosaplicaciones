set language Español

use NORTHWND

--vista a objetos en la base de datos--

create  or alter view vista_ventas
as
select c.CustomerID as 'clave_cliente', c.CompanyName as  'cliente',
CONCAT(e.FirstName, ' ', e.LastName) as 'nombre',
o.OrderDate as 'fechadelaorden', DATEPART(year, o.OrderDate) as 'añodecompra',
datename (mm, o.OrderDate) as 'Mesdecompra',
DATEPART(QUARTER, o.OrderDate) as 'trimestre',
UPPER(p.ProductName) as 'nombredeproducto',
od.Quantity as 'cantidadvendida',
od.UnitPrice as 'preciodeventa',
p.SupplierID as 'proveedorid'
from
Orders as o
inner join Customers as c
on o.CustomerID= c.CustomerID
inner join Employees as e
on e.EmployeeID=o.EmployeeID
inner join [Order Details] as od
on od.OrderID=o.OrderID
inner join Products as p
on p.ProductID=od.ProductID;

-- para visualizar una vistga

select clave_cliente, nombre, nombredeproducto, fechadelaorden,
(cantidadvendida*preciodeventa) as 'importe'
from vista_ventas
where nombredeproducto= 'chai'
and (cantidadvendida*preciodeventa)>600
and DATEPART(year, fechadelaorden)=1996

select* from vista_ventas as vv
inner join Suppliers as s
on s.SupplierID=vv.proveedorid
