use NORTHWND

select  o.OrderID, o.OrderDate, c.CompanyName,
c.City, od.Quantity, od.UnitPrice
from Orders as o
inner join [Order Details] as od
on o.OrderID=od.OrderID
inner join Customers as c
on c.CustomerID=o.CustomerID
where c.City in ('San Cristóbal', 'México D.F.')
group by c.CompanyName;
having count (*)>18;
--------------------------------------------------------------------------

select c.CompanyName,
count (o.OrderID) as [numero de ordenes]
from Orders as o
inner join [Order Details] as od
on o.OrderID=od.OrderID
inner join Customers as c
on c.CustomerID=o.CustomerID
where c.City in ('San Cristóbal', 'México D.F.')
group by c.CompanyName
having count (*)>18;

----------------------------------

-- obtener los nombres de los productos y sus categoriass donde el precio promedio 
-- de los productos en la misma categoria sea mayor a 20

select c.CategoryName, p.ProductName,
avg (p.UnitPrice) as 'Promedio de Precios'
from
Categories as c
left join Products as p
on c.CategoryID= p.CategoryID
where p.CategoryID is not null
group by c.CategoryName, p.ProductName
having avg (p.UnitPrice) >20
order by CategoryName

--aquello cuyo precio se mayor a 40

