---Procedimientos Almacenados
---Misicano Calla�aupa Rodrigo
---08/08/2022

---PA para TEscuela

use BDUniversidad
go

if OBJECT_ID('spListarEscuela') is not null
	drop proc spListarEscuela
go
create proc spListarEscuela
as
begin
	select CodEscuela, Escuela, Facultad from TEscuela
end
go

exec spListarEscuela
go

if OBJECT_ID('spAgregarEscuela') is not null
	drop proc spAgregarEscuela
go
create proc spAgregarEscuela
@CodEscuela char(3),@Escuela varchar(50),@Facultad varchar(50)
as
begin
	--CodEscuela no puede ser duplicado
	if not exists(select @CodEscuela from TEscuela where CodEscuela=@CodEscuela)
	--Escuela no puede ser duplicado
	if not exists (select Escuela from TEscuela where Escuela=@Escuela)
		begin
		insert into TEscuela values(@CodEscuela,@Escuela,@Facultad)
		select CodError = 0, Mensaje = 'Se incerto correctamente la escuela'
		end
	else select CodError = 1, Mensaje = 'Error: CodEscuela esta duplicado'
	else select CodError = 1, Mensaje = 'Error: CodEscuela esta duplicado'
end
go

exec spAgregarEscuela 'E06','Psicologia','Medicina'
go


if OBJECT_ID('spEliminarEscuela') is not null
	drop proc spEliminarEscuela
go
create proc spEliminarEscuela
@CodEscuela varchar(3)
as
	delete from TEscuela where CodEscuela=@CodEscuela;
go

exec spEliminarEscuela 'E06'
go


if OBJECT_ID('spActualizarEscuela') is not null
	drop proc spActualizarEscuela
go
create proc spActualizarEscuela
@CodEscuela varchar(3),
@Escuela varchar (50),
@Facultad varchar (50)
as
	update TEscuela set Escuela=@Escuela,Facultad=@Facultad where CodEscuela=@CodEscuela;
go

exec spActualizarEscuela 'E03','Administracion','CEAC'
go


if OBJECT_ID('spBuscarEscuela') is not null
	drop proc spBuscarEscuela
go
create proc spBuscarEscuela
@CodEscuela varchar(3)
as
begin
	select * from TEscuela where CodEscuela=@CodEscuela
end
go

exec spBuscarEscuela 'E05'
go



---Procedimiento Almacenado para TAlumno

use BDUniversidad
go

if OBJECT_ID('spListarAlumno') is not null
	drop proc spListarAlumno
go
create proc spListarAlumno
as
begin
	select CodAlumno, Apellidos, Nombres, lugarNac, FechaNac,CodEscuela from TAlumno
end
go

exec spListarAlumno
go

---Procedimiento Almacenado para agregar a la TAlumno

if OBJECT_ID('spAgregarAlumno') is not null
	drop proc spAgregarAlumno
go
create proc spAgregarAlumno
@CodAlumno char(5),@Apellidos varchar(50),@Nombres varchar(50),@LugarNac varchar(50),@FechaNac datetime,@CodEscuela char(3)
as
begin
	--CodEscuela no puede ser duplicado
	if not exists(select @CodAlumno from TAlumno where CodAlumno=@CodAlumno)
	--Escuela no puede ser duplicado
	if not exists (select Apellidos from TAlumno where Apellidos=@Apellidos)
		begin
		insert into TAlumno values(@CodAlumno,@Apellidos,@Nombres,@LugarNac,@FechaNac,@CodEscuela)
		select CodError = 0, Mensaje = 'Se incerto correctamente el alumno'
		end
	else select CodError = 1, Mensaje = 'Error: CodAlumno esta duplicado '
	else select CodError = 1, Mensaje = 'Error: CodAlumno esta duplicado '
end
go

exec spAgregarAlumno 'A06','Perez Valverde','Karolina','Cusco','2001/03/20','E01'
go


if OBJECT_ID('spEliminarAlumno') is not null
	drop proc spEliminarAlumno
go
create proc spEliminarAlumno
@CodAlumno varchar(3)
as
	delete from TAlumno where CodAlumno=@CodAlumno;
go

exec spEliminarAlumno 'A02'
go


if OBJECT_ID('spActualizarAlumno') is not null
	drop proc spActualizarAlumno
go
create proc spActualizarAlumno
@CodAlumno varchar(5),
@Apellidos varchar (50),
@Nombres varchar (50),
@LugarNac varchar (50),
@FechaNac datetime,
@CodEscula char (3)
as
	update TAlumno set Apellidos=@Apellidos,Nombres=@Nombres,LugarNac=@LugarNac,FechaNac=@FechaNac,CodEscuela=@CodEscula where CodAlumno=@CodAlumno;
go

exec spActualizarAlumno 'A03','Orcotoma Rozas','Adriano','Cusco','2002/05/03','E03'
go


if OBJECT_ID('spBuscarAlumno') is not null
	drop proc spBuscarAlumno
go
create proc spBuscarAlumno
@CodAlumno varchar(5)
as
begin
	select * from TAlumno where CodAlumno=@CodAlumno
end
go

exec spBuscarAlumno 'A05'
go