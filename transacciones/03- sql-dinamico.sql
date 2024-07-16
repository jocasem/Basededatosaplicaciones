use NORTHWND
go
-- crear un store procedure que que recibe como parametro de entrada el nombre de una taqbla 
-- y visualice todos sus registros (spu_mostrar_datos_tabla)



create or alter proc spu_mostrar_datos_tabla

@tabla varchar(100)
as
begin

-- sql dinamico
	declare @sql nvarchar (max);
	set @sql = ' select* from ' + @tabla
	exec (@sql)
	
	
end;

exec spu_mostrar_datos_tabla 'customers'
exec spu_mostrar_datos_tabla 'categories'
exec spu_mostrar_datos_tabla 'products'

go

create or alter proc spu_mostrar_datos_tabla2

@tabla varchar(100)
as
begin

-- sql dinamico
	declare @sql nvarchar (max);
	set @sql = ' select* from ' + @tabla
	exec sp_executesql @sql

end;
exec spu_mostrar_datos_tabla2 'customers'
exec spu_mostrar_datos_tabla2 'categories'
exec spu_mostrar_datos_tabla2 'products'
go