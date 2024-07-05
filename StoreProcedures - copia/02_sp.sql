set language español
use NORTHWND
-- store procedures
-- create procedure ó proc
create procedure dp_prueba_g1
as 
begin
	print 'hola mundo';
end

-- ejecutar store procedure
exec dp_prueba_g1

-- declaracion de variables
declare @n int
declare @i int

set @n = 5
set @i = 1

print ('El valor de n es:' + cast(@n as varchar))
print ('El valor de n es:' + cast(@i as varchar))



-- nueva base de datos
create database prueba_sp
use prueba_sp

create proc sp_1
as
begin

declare @n int
declare @i int

set @n = 5
set @i = 1

print ('El valor de n es:' + cast(@n as varchar))
print ('El valor de n es:' + cast(@i as varchar))
end
-- ejecutar 10 veces sp_1 solamente si el sentinela es 1

--declare @n  as int = 10
--exec sp_1
declare @n as int = 10, @i int = 10
while @i<=@n
begin
	print (i);
	set @i 
end

create procedure sp_2
as

-- store procedure  con parametros de entrada
declare @n  as int=10, @i int=1
while @i<=@n
begin
	print(@i);
	set @i+=1
end

---Store procedure

execute sp_2;


create or alter procedure sp_3
@n int
as
begin
declare @i int=1

if @n >0
begin
	while @i<=@n
	begin
		print (@i);
		set @i+=1
	end
end
else
begin 
	print 'El valor de n debe ser mayor a 0'
end
end


exec sp_3 10
exec sp_3 @n=20



create or alter procedure sp_4
@n int
as
begin
declare @i int=1
declare @acum int =0

if @n >0
begin
	while @i<=@n
	begin
		set @acum+=@i
		set @i+=1
	end
	print ('la suma de los valores es :' + cast(@acum as varchar))
end
else
begin 
	print 'El valor de n debe ser mayor a 0'
end
end

exec sp_4 10

--seleccionar de la base de datos northwnd todas las ordenes de compra para un año determinado usando store procedure

use NORTHWND


create or alter proc ordenesanio
 @anio int
 as
 begin
	select * 
	from Orders
	where year (OrderDate) = @anio;
end

exec ObtenerOrndenesPorAnio @anio= 1997
-- cuantas ordenes se han realizado por año









--1 crer un store procedure , que muestre total de ventas  para cada cliente por un rango por un rango de años