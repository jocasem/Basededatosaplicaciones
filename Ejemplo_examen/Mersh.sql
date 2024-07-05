set language Español

select
iif(1=1, 'verdadero','falso')

select
iif(1=0, 'verdadero','falso')

use AdventureWorks2019

-- function iif
select iif (1=1, 'Verdadesro', 'Falso') as Resultado

create view vista_genero
as
select e.LoginID, e.JobTitle, iif(e.Gender='F', 'Mujer', 'Hombre') as 'Sexo'
from 
HumanResources.Employee as e;

-- para poner todo en mayusculas
select upper (JobTitle) as [Titulo] from vista_genero
where Sexo= 'Mujer'
-- para ver todo en minusculas
select lower (JobTitle) as [Titulo] from vista_genero
where Sexo= 'Mujer'

-- mersh 

select OBJECT_ID(N'tempdb..#studentc´1')

IF OBJECT_ID (N'tempdb..#StudentsC1') is not NULL
begin 
	drop table #StudentsC1;
end

CREATE TABLE #StudentsC1(StudentID int, StudentName VARCHAR(50), StudentStatus  BIT);

INSERT INTO #StudentsC1(StudentID, StudentName, StudentStatus) VALUES(1,'Axel Romero',1)
INSERT INTO #StudentsC1(StudentID, StudentName, StudentStatus) VALUES(2,'Sofía Mora',1)
INSERT INTO #StudentsC1(StudentID, StudentName, StudentStatus) VALUES(3,'Rogelio Rojas',0)
INSERT INTO #StudentsC1(StudentID, StudentName, StudentStatus) VALUES(4,'Mariana Rosas',1)
INSERT INTO #StudentsC1(StudentID, StudentName, StudentStatus) VALUES(5,'Roman Zavaleta',1)

IF OBJECT_ID(N'tempdb..#StudentsC2') is not NULL
begin
drop table #StudentsC2
END

CREATE TABLE #StudentsC2(StudentID INT, StudentName VARCHAR(50), StudentStatus BIT);

INSERT INTO #StudentsC2(StudentID, StudentName, StudentStatus) VALUES(1,'Axel Romero Rendón',1)
INSERT INTO #StudentsC2(StudentID, StudentName, StudentStatus) VALUES(2,'Sofía Mora Ríos',0)
INSERT INTO #StudentsC2(StudentID, StudentName, StudentStatus) VALUES(6,'Mario Gonzalez Pae',1)
INSERT INTO #StudentsC2(StudentID, StudentName, StudentStatus) VALUES(7,'Alberto García Morales',1)

select * from #StudentsC1
select * from #StudentsC2

--para seleccionar la los datos que queremos ver de la tabla

update s2
set s2.StudentName = s1.StudentName,
	s2.StudentStatus=s1.StudentStatus
from #StudentsC1 as s1
inner join #StudentsC2 as s2
on s1.StudentID=s2.StudentID

select*from #StudentsC1 as s1
left join #StudentsC2 as s2
on s1.StudentID=s2.StudentID

select*from #StudentsC1 as s1
right join #StudentsC2 as s2
on s1.StudentID=s2.StudentID

insert into #StudentsC2(StudentID, StudentName, StudentStatus)
select s1.StudentID,s1.StudentName, s1.StudentStatus
from #StudentsC1 as s1
left join #StudentsC2 as s2
on s1.StudentID =s2.StudentID 
where s2.StudentID is null;
