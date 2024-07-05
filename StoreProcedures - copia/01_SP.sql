set language Español
use NORTHWND
--declaracion y uso de variables en transact-SQL

--declaracion de una variable
declare @numeroCal int 
declare @calif decimal(10,2)

--asignacion de variables

set @numeroCal =10
if @numeroCal<= 0
begin
set @numeroCal=1
end
declare @i=1
while ()
