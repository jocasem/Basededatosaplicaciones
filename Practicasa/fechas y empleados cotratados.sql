-- crear un stgore procedure que reciba dos fechas y devuelva una lista de empledos (nombre full name) que fueron contratados en esas fechas
use NORTHWND
go

select CONCAT(FirstName, ' ', LastName),HireDate
from Employees
where HireDate between '1992-05-01' and '1993-05-03'