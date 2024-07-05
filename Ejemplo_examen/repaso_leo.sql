use NORTHWND;

select s.Companyname as 'nombre de compañia', p.ProductName as 'nombre de producto', CONCAT(e.firstname,' ', e.lastname) as 'nombre completo'
from Suppliers as s
inner join Products as p
on s.SupplierID=p.SupplierID
inner join [Order Details] as od
on p.ProductID=od.ProductID
inner join Orders as o
on od.OrderID=o.OrderID
inner join Employees as e
on o.EmployeeID=e.EmployeeID
where s.CompanyName like '%n';

select s.Companyname as 'nombre de compañia', p.ProductName as 'nombre de producto', CONCAT(e.firstname,' ', e.lastname) as 'nombre completo'
from Suppliers as s
inner join Products as p
on s.SupplierID=p.SupplierID
inner join [Order Details] as od
on p.ProductID=od.ProductID
inner join Orders as o
on od.OrderID=o.OrderID
inner join Employees as e
on o.EmployeeID=e.EmployeeID
group by s.CompanyName, p.productname, e.firstname, e.lastname


set language Español