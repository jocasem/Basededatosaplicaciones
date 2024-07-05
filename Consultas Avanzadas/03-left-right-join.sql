create database pruebajoinsg1
use pruebajoinsg1

create table proveedor(
	provid int not null identity(1,1),
	nombre varchar(50) not null,
	limite_credito money not null,
	constraint pk_proveedor
	primary key (provid),
	constraint unico_nombre
	unique (nombre)
);

create table productos(
 productid int not null identity(1,1),
 nombre varchar(50) not null,
 precio money not null,
 existencia int not null,
 proveedor int,
 constraint pk_proovedor
 primary key(productid),
 constraint unico_nombre_proveedor
 unique (nombre),
 constraint fk_proveedor_producto
 foreign key (proveedor)
 references proveedor(provid)
 );
  drop table productos;
  

 -- agregar registros a las tablas prveedor y producto

 insert into proveedor(nombre,limite_credito)
	 values 
	 ('proveedor1', 5000),
	 ('proveedor2', 6778),
	 ('proveedor4', 6788),
	 ('proveedor5', 5677),
	 ('proveedor6', 6666);

	 select * from proveedor

	 insert into productos (nombre, precio, existencia, proveedor)
	 values
	 ('producto1', 56, 34, 1),
	 ('producto2', 56, 12, 1),
	 ('producto3', 45.6, 33, 2),
	 ('producto4', 22.34, 666, 3); 
	 -- inner join funciona solo cuando los datops coinciden entre si--
	 select*from 
	 proveedor as p
	 inner join productos as pr
	 on pr.proveedor=p.provid;

	 use NORTHWND

	 select s.CompanyName as 'Proveedor',sum(od.UnitPrice*od.Quantity) as 'Total de ventas'
from Suppliers as s
inner join Products as p
on s.SupplierID = p.SupplierID
inner join [Order Details] as od
on p.ProductID = od.ProductID
inner join Orders as o
on od.OrderID = o.OrderID
where o.OrderDate between '1996-09-01' and '1996-12-31' 
group by s.CompanyName
order by 'Total de ventas' desc;
	
	use NORTHWND
	select c.CategoryName, p.ProductName, p.UnitsInStock, p.unitprice, p.discontinued
	from(
		select categoryname, categoryid from Categories
	) as c
	inner join(
	select productname , UnitsInStock, Categoryid, UnitPrice, Discontinued from Products
	)as p
	on c.categoryid=p.categoryid

	SELECT 
    c.CategoryName as 'Category',
    p.ProductName as 'Product',
    SUM(od.UnitPrice * od.Quantity) as 'Total Sales $'
FROM 
    Categories as c
INNER JOIN 
    Products as p 
    ON c.CategoryID = p.CategoryID
INNER JOIN 
    [Order Details] as od 
    ON p.ProductID = od.ProductID
INNER JOIN 
    Orders as o 
    ON o.OrderID = od.OrderID
WHERE 
    o.OrderDate BETWEEN '1996-09-01' and '1996-12-31'
GROUP BY 
    c.CategoryName,
    p.ProductName
ORDER BY 
    'Total Sales $' DESC;



	--lest join

	use  pruebajoinsg1
	
	select 
	from
	proveedor as p
	left join productos  as p
	on pr.proveedor= p.provid
	where proveedor= null 'null';

	use NORTHWND
	
	select 
	CompanyName as 'nombre compañia', 
	Address as 'direccion', 
	Region as 'region', 
	Country as 'pais',
	Phone as 'telefono'
	from Suppliers
	where SupplierID= '';

	select RegionDescription
	from Region;

	select TerritoryDescription, TerritoryID, RegionID
	from Territories

	select c.CompanyName, o.employeeid
	inner join oreders o
	on c.CustomersId=o.CustomersId
	from Customers as c