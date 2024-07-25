--MERGE INTO <target table> AS TGT
--USING <SOURCE TABLE> AS SRC  
--  ON <merge predicate>
--WHEN MATCHED [AND <predicate>] -- two clauses allowed:  
--  THEN <action> -- one with UPDATE one with DELETE
--WHEN NOT MATCHED [BY TARGET] [AND <predicate>] -- one clause allowed:  
--  THEN INSERT... –- if indicated, action must be INSERT
--WHEN NOT MATCHED BY SOURCE [AND <predicate>] -- two clauses allowed:  
--  THEN <action>; -- one with UPDATE one with DELETE

create database mergeEscuelita
go

use NORTHWND

use mergeEscuelita
CREATE TABLE StudentsC1(
    StudentID       INT
    ,StudentName    VARCHAR(50)
    ,StudentStatus  BIT
);
go

INSERT INTO StudentsC1(StudentID, StudentName, StudentStatus) VALUES(1,'Axel Romero',1)
INSERT INTO StudentsC1(StudentID, StudentName, StudentStatus) VALUES(2,'Sofía Mora',1)
INSERT INTO StudentsC1(StudentID, StudentName, StudentStatus) VALUES(3,'Rogelio Rojas',0)
INSERT INTO StudentsC1(StudentID, StudentName, StudentStatus) VALUES(4,'Mariana Rosas',1)
INSERT INTO StudentsC1(StudentID, StudentName, StudentStatus) VALUES(5,'Roman Zavaleta',1)
go

CREATE TABLE StudentsC2(
    StudentID       INT
    ,StudentName    VARCHAR(50)
    ,StudentStatus  BIT
);
go

select* from StudentsC1

select * from
StudentsC1 as c1
inner join
StudentsC2 as c2
on c1.StudentID = c2.StudentID


select* from StudentsC1

select c1.StudentID, c1.StudentName, c1.StudentStatus
from
StudentsC1 as c1
left join
StudentsC2 as c2
on c1.StudentID = c2.StudentID
where c2.StudentID is null

insert into StudentsC2
values (1, 'Axwcl romero', 0)

truncate table Studentsc2

-----------------------------------------------------STORE PROCEDURE--------------------------------------

--store procedure que agrega y actializa los registros nuevos y registros mmodificados de la tabla
-- studentsC1 a StudentsC2 utilizando consultas con left join e inner join

create or alter procedure spu_carga_delta_S1_S2
--parametros
as
begin
-- porgramacion del store procedure
	begin transaction;
	begin try
	--procedimiento a ejecutar de forma exitosa
	-- insertar nievps registro de la tabla student1 a student2
	insert into StudentsC2(StudentID, StudentName, StudentStatus) 
	select c1.StudentID, c1.StudentName, c1.StudentStatus
	from
	StudentsC1 as c1
	left join
	StudentsC2 as c2
	on c1.StudentID = c2.StudentID
	where c2.StudentID is null
	-- se actualizan los registrso que han tenido algun cambio en la tabla source 
	--(studentc1) y se cambian en la tabla target (studentC2)
	
	update c2
	set c2.StudentName= c1.StudentName,
	c2.studentStatus = c1.StudentStatus
	from
	StudentsC1 as c1
	inner join
	StudentsC2 as c2
	on c1.StudentID = c2.StudentID	
	--}Confirmar la transaaccion

	commit transaction;
	
	end try
	begin catch
	declare @mensajeError varchar (100);
	set @mensajeError= ERROR_MESSAGE();
	print @mensajeError;
	end catch

end

exec spu_carga_delta_S1_S2

----------------------------------------comprobacion---------------------------------------------

select c1.StudentID, c1.StudentName, c1.StudentStatus
	from
	StudentsC1 as c1
	inner join
	StudentsC2 as c2
	on c1.StudentID = c2.StudentID
	where c2.StudentID is null

	select* from StudentsC1
	select * from StudentsC2

	update StudentsC1
	set StudentName= 'Axel Ramero'
	where StudentID= 1

	go

	update StudentsC1
	set StudentStatus= 1
	where StudentID= 3
	go

	update StudentsC1
	set StudentStatus= 1
	where StudentID in (1,4,5)

	insert into StudentsC1
	values (6, 'monico Hernandez', 0)

	select @@VERSION

	CREATE or ALTER PROCEDURE spu_carga_delta_s1_s_2_merge
as 
begin

----------------------------------------------------------------------SP------------------------
--STORE PROCEDURE que agrega y actualiza los registro nuevos y registros modificados
--de la tabla C1 a C2 utilizando consultas con left join e inner join
GO
CREATE OR ALTER PROCEDURE spu_carga_delta_s1_s2_merge
--PARAMETROS
as
BEGIN
--PROGRAMACION DE SP
begin transaction;
begin try
--merge funcion de sql
		MERGE INTO StudentsC2 AS TGT
		USING (
		  SELECT studentid, studentName, studentStatus
		  FROM StudentsC1
		)AS SRC
		on (
		   TGT.StudentID = SRC.StudentID
		)
		--para actualizar
		WHEN MATCHED THEN 
		UPDATE 
		SET TGT.StudentName =  SRC.StudentName,
		    TGT.StudentStatus =  SRC.StudentStatus
			--para insertar 
		WHEN NOT MATCHED THEN
		INSERT (StudentID, StudentName, StudentStatus)
		values (SRC.StudentID, SRC.StudentName, SRC.StudentStatus);
		--confirmar la transaccion 
		commit transaction;
end try
begin catch
	  ROLLBACK TRANSACTION;
      Declare @mensajeError varchar(100);
	  set @mensajeError = ERROR_MESSAGE();
	  print @mensajeError;
end catch;
END;
GO
 truncate table studentc2;

 select * from StudentsC1
  select * from StudentsC2

 exec spu_carga_delta_s1_s2_merge

 update StudentsC1
 set StudentName = 'Juana de Arco'
 WHERE StudentID = 2

 -- que hagan las eliminaciones que se hicieron en el source (students1)
 -- y se afectan en el target (student2)

 -- agregar al merge un nuevo when para eliminar


 -- Crear un procedimiento almacenado para sincronizar los datos entre students1 y students2

CREATE PROCEDURE SyncStudentsData AS
BEGIN
    -- Eliminar registros en students2 que también existen en students1
    DELETE s2
    FROM students2 s2
    INNER JOIN students1 s1 ON s2.student_id = s1.student_id;

    -- Insertar registros en students2 que existen en students1 pero no en students2
    INSERT INTO students2 (student_id, student_name)
    SELECT s1.student_id, s1.student_name
    FROM students1 s1
    LEFT JOIN students2 s2 ON s1.student_id = s2.student_id
    WHERE s2.student_id IS NULL;
END;