--crear la base de datos
create database Ejercisioexamen;
--usar base de datos
use Ejercisioexamen;
-- crear las tablas solicitqadas--
create table  proveedors(
idprov int not null identity (1,1),
nombre varchar (50) not null,
limite_credito money not null,
constraint pk_proveedors
primary key (idprov),
constraint unico_nombre_proveedor
unique (nombre)
);


create table Categoria(
idcatego int not null,
nombre varchar(50) not null
constraint pk_categoria
primary key (idcatego),
constraint unico_nombre
unique (nombre)
);

CREATE TABLE Producto(
    idprod int not null,
    nombre varchar(50) not null,
    precio money not null,
    existencia int not null,
    proveedor int,
    idcatego int,
    constraint pk_producto
    primary key(idprod),
    constraint fk_producto_prov
    foreign key (proveedor)
    references proveedors(idprov),
    constraint fk_producto_categoria
    foreign key (idcatego)
    references categoria(idcatego)
);

-- Insertar datos en las tablas
insert into proveedors(nombre, limite_credito)
values('Coca-cola', 98777),
      ('Pecsi', 234567),
      ('Hay me Pica', 44566),
      ('Hay me Duele', 45677),
      ('Tengo Miedo', 22344);

insert into categoria
values(1, 'Lacteos'),
(2, 'Linea Blanca'),
(3, 'Dulces'),
(4, 'Vinos'),
(5, 'Abarrotes');

select * from proveedors

insert into Producto
values(1, 'Mascara', 78.9, 20, 5,5)

insert into producto(proveedor, existencia, idcatego, precio, idprod, nombre)
values(3, 34, 5, 56.7, 2, 'Manita Rascadora')

insert into producto
values (3, 'Tonayan', 1450, 56,4 ,4),
       (4, 'Caramelo', 200, 22,1 ,3),
       (5, 'Terry', 200, 24,4 ,4);


select * from Producto
select * from Categoria
select * from proveedors

--consultas  con inner join--

select c.idcatego, p.idcatego, c.nombre, p.nombre, p.precio, (p.precio*p.existencia) as importe
from Categoria as c
inner join Producto as p
on c.idcatego=p.idcatego

-- esta es otra forma de hacer lo mismo---

select *, (p.precio*p.existencia) as importe 
from Categoria as c
inner join Producto as p
on c.idcatego=p.idcatego;

-- Categoria
--idcatego
--nombre

--Producto
--precio
--existencia
--nombre
select c.idcatego, c.nombre, p.nombre, p.existencia, p.precio, (p.precio*p.existencia) as importe
from
(select idcatego, nombre from Categoria) as c
inner join 
(select nombre, precio, existencia,idcatego from Producto)as p
on c.idcatego=p.idcatego;

use NORTHWND

select o.OrderID, o.OrderDate, o.ShipCountry, o.RequiredDate
from ( select OrderId, OrderDate, ShipCountry, RequiredDate FROM Orders)AS o

select* 
from ( select OrderId, OrderDate, ShipCountry, RequiredDate FROM Orders)AS o

use Ejercisioexamen

select* from 
Categoria as c
inner join Producto as p
on c.idcatego=p.idcatego
inner join proveedors as pr
on pr.idprov=p.proveedor;


select * 
from Categoria as c
left join 
Producto as p
on c.idcatego= p.idcatego
left join proveedors as pr
on p.proveedor=pr.idprov;

select *
from Producto
where idcatego  in (3,4)

select *
from Producto
where idcatego  = 4

select c.nombre, c.idcatego, p.precio, p.existencia
from (select nombre, idcatego from Categoria) as c
left join (select precio, existencia, idcatego, nombre from Producto) as p
on c.idcatego= p.idcatego
where p.idcatego is null;

insert into Producto
values (6, 'p6', 45.6, 12, 2, null)

select c.nombre, p.nombre, p.precio, p.existencia
from  Categoria as c
full join Producto as p
on c.idcatego= p.idcatego;

select * from 
Categoria as c
full join Producto AS p
on c.idcatego= p.idcatego
inner join proveedors as pr
on pr.idprov= p.proveedor

select @@LANGUAGE
go

sp_helplanguage
go

set language Español

