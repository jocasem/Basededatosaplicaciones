
-- realiza un sp que muestre el total de los campos hechas por cada uno de los clientes

use NORTHWND;
go
create or alter proc spu_consultar_camprasclientes
@anioinicial int,
@aniofinal int
as
begin
select c.CompanyName, sum (od.Quantity*od.UnitPrice) as 'Total'
from  Customers as c
inner join Orders as o
on c.CustomerID = o.CustomerID
inner join [Order Details] as od
on o.OrderID= od.OrderID
where year (orderDate) between @anioinicial and @aniofinal
group by c.CompanyName
end
go 