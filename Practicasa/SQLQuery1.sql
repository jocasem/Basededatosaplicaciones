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