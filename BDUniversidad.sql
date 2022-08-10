---Base de Datos Ejemplo
---Misicano Callañaupa
---08/08/2022

use master
go

if DB_ID('BDUniversidad') is not null
	drop database BDUniversidad
go
create database BDUniversidad
go

use BDUniversidad
go

--crear tablas
    --Tabla TEscuela
if OBJECT_ID('TEscuela') is not null
	drop table TEscuela
go
create table TEscuela
(
	CodEscuela char(3) primary key,
	Escuela varchar(50),
	Facultad varchar(50)
)
go

     --Tabla TAlumno
if OBJECT_ID('TAlumno') is not null
	drop table TAlumno
go
create table TAlumno
(
	CodAlumno char(5) primary key,
	Apellidos varchar(50),
	Nombres varchar(50),
	LugarNac varchar(50),
	FechaNac datetime,
	CodEscuela char(3),
	foreign key(CodEscuela) references TEscuela
)

--Insertar Datos a la tabla TEscuela

insert into TEscuela values('E01','Sistemas','Ingenieria')
insert into TEscuela values('E02','Civil','Ingenieria')
insert into TEscuela values('E03','Industrial','Ingenieria')
insert into TEscuela values('E04','Ambiental','Ingenieria')
insert into TEscuela values('E05','Arquitectura','Ingenieria')
go

select * from TEscuela
go


--Insertar Datos a la tabla TAlumno
insert into TAlumno values('A01','Misicano Callañaupa','Rodrigo','Cusco',2001/03/07,'E01')
insert into TAlumno values('A02','Santillan Callañaupa','Jose','Cusco',1998/05/05,'E02')
insert into TAlumno values('A03','Santillan Callañaupa','Carlos','Cusco',1998/05/05,'E03')
insert into TAlumno values('A04','Misicano Callañaupa','Jhardo','Cusco',2007/12/20,'E04')
insert into TAlumno values('A05','Suel Monrroy','Judi Jimena','Cusco',2002/03/27,'E05')
go

select * from TAlumno
go