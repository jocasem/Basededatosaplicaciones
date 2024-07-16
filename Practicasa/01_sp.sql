--crear un sp que solcite un id de una categoria y devuelva el preci de sus productos
use NORTHWND
go
create or alter proc sp_solicitgar_promedio_prod
@catego int --parametro de entrada
as 
begin
select avg (UnitPrice) as 'promedio de precio de los productos' 
from Products
where CategoryID =2;
end 
go

exec sp_solicitgar_promedio_prod 2

exec sp_solicitgar_promedio_prod @catego = 5

exec sp_solicitgar_promedio_prod @catego = 4

-- crear un stgore procedure que reciba dos fechas y devuelva una lista de empledos (nombre full name) que fueron contratados en esas fechas


select CONCAT(FirstName, ' ', LastName),HireDate
from Employees
where HireDate between '1992-05-01' and '1993-05-03'