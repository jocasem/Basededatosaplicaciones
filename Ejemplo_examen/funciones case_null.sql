set language español

use NORTHWND
-- cosnulta con funcion case
select productname, unitprice, UnitsInStock, Discontinued,
disponibilidad= case discontinued
when 0 then 'no disponible'
when 1 then 'disponible'
end
from Products;

select ProductName, UnitsInStock, UnitPrice,
case 
when UnitPrice >=1 and UnitPrice<18 then 'producto barato'
when UnitPrice>= 18 and UnitPrice<=50 then 'producto medio barato'
when UnitPrice between 51 and 100 then 'producto caro'
else 'carisimo'
end as 'categoria de precios'
from Products
where ProductID in (29,38)

USE AdventureWorks2019

select BusinessEntityID,SalariedFlag 
from HumanResources.Employee
order by 
case SalariedFlag 
when 1 then BusinessEntityID
end desc,
case 
when SalariedFlag = 0 then BusinessEntityID
end asc;

select BusinessEntityID,
LastName,
TerritoryName,
CountryRegionName
from Sales.vSalesPerson
where TerritoryGroup is not null
order by 
case CountryRegionName
when 'United States' then TerritoryName
else CountryRegionName
end

--in null

select v.accountnumber,
v.name,
v.purchasingwebserviceurl as 'purchasingwebserviceurl'
from [Purchasing].[Vendor] as v;

select v.accountnumber,
v.name,
isnull (v.purchasingwebserviceurl, 'no url') 
as 'purchasingwebserviceurl'
from [Purchasing].[Vendor] as v;

select v.accountnumber,
v.name,
case
when v.purchasingwebserviceurl is null then  'no url'
end
as 'purchasingwebserviceurl'
from [Purchasing].[Vendor] as v;

