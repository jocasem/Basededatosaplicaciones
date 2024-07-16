use NORTHWND

-- las transacciones en sql son fundamentales para asegurar la concistencia y la integridad 
-- de los datos en una base de datos

--Un atransaccion es un aunidad de trabajo  que se ejecuta
-- de manera completamete exitosa  o no se ejecuta en absoluto

-- sigue el principio ACID:
-- Amoicidad: toda la transaccion se completa o no se realiza nada
--Consistencia: la transaccion lleva la base de datos de un estado valido 
--              a otro
-- Aislamiento: las transacciones concurrentes no interfieren entre sí
-- Durabilidad: una vez que se completa los cambios son permanentes

-- comando a utilizar:

-- 1 begin transaction: inicua una nueva trasnacción
-- 2 commit transaction: confirma todos los cambios realizados durante la transacción
-- 3 rollback transaction: revierte todos los cambios realiados durnte la transacción

select* from Categories
go

--delete  from Categories
--where CategoryID in (10,12)

begin transaction;

insert into Categories(CategoryName, Description)
values ('los remediales', 'estara muy bien');
go

rollback transaction

delete from Categories
where CategoryID = 12;

commit transaction; 

create database pruebatransacciones;
go

use pruebatransacciones;
go
create table empleado(
	emplid int not null,
	nombre varchar (30) not null,
	salario money not null,
	constraint pk_empleado
	primary key (emplid),
	constraint chk_sqalario
	check (salario>0.0 and salario>= 50000)

);
go



create or alter proc spu_agregar_empleado
-- parametro de entrada
@emplid int,
@nombre varchar(30),
@salario money
as
	begin
		begin try
				begin transaction;
			-- inestra en la tabla empleados
			insert into empleado (emplid, nombre, salario)
			values(@emplid,@nombre,@salario);
			-- se completa la transacción si todo va bien
			commit transaction;
	
		end try
	
		begin catch
		rollback transaction;
		-- obtener el error
		declare @MesajeError nvarchar(4000);
		set @MesajeError = ERROR_MESSAGE();
		print @MesajeError;
		end catch;
	end;
go

exec spu_agregar_empleado 1, 'Monica', 2100.0;
go
exec spu_agregar_empleado 1, 'Toribio', 21000.0;
go

select* from empleado

