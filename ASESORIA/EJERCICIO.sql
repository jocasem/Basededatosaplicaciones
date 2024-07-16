create database ASESORIA



--promotores
-- tabla:
create table empleado(
 idEmpleado int pk identity (1,1)
 nombre varchar (20)
 apellido 1 varchar (20)
 apellido 2 varchar (20)
salario money
);

create  or alter proc spu_agregar_empleado

@nombre varchar (20);
@apellido1 varchar (20);
@apellido2 varchar (20);
@salario money
as
begin

insert into empleado (nombre, apellido1, apellido2, salario)
values (@nombre, @apellido1, @apellido2, @salario);
end
go

// invocacion del sp
--forma 1
exec spu_agregar_empleado 'Ricardo', 'Ramirez', 'Hernandez', 50000;

--forma 2 con default

execute spu_agregar_empleado default  'Gonzales', 'Rubio', 60000;

-- forma 3

exec spu_agregar_empleado @salario = 30000, @nombre= 'Soyla', @apellido2= 'Del Corral', @apellido1= 'Vaca';