use master

if exists (select * from sysdatabases where name = 'ProyectoFinal')
begin
	drop database ProyectoFinal
end
go

create database ProyectoFinal
go

use ProyectoFinal
go

------------------------------------------------------------------------------------------------
--Tablas
create table Usuarios
(
	nomUsuario varchar(20) primary key,
	contraseña varchar(20) not null,
	nombreCompleto varchar(20) not null
)

create table Juegos
(
	nombreJuego varchar(200) not null,
	codigoJuego int primary key identity(1,1),
	fechaCreado datetime default getdate(),
	dificultad varchar(20) check (dificultad = 'Facil' or dificultad = 'Medio' or dificultad = 'Dificil')
)

create table Categorias
(
	codigoCat varchar(4) check (codigoCat like '[a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z]') primary key,
	nombreCat varchar(20) not null
)

create table Preguntas
(
	textoPregunta varchar(200) not null,
	respuesta1 varchar(200) not null,
	respuesta2 varchar(200) not null,
	respuesta3 varchar(200) not null,
	correcta int check (correcta between 1 and 3),
	codigoPreg varchar(5) primary key,
	puntaje int not null check (puntaje between 1 and 10),
	CodigoCat varchar(4) foreign key references Categorias(codigoCat)
)

create table Jugada
(
	numeroJugada int primary key identity(1,1),
	nombreJugador varchar(20) not null,
	fechaHoraJugada datetime default getdate(),
	puntajes int not null,
	codigoJuego int foreign key references Juegos(codigoJuego)
)

Create table juegoPreguntas
(
	codigoJuego int foreign key references Juegos(codigoJuego),
	codigoPreg varchar (5) foreign key references Preguntas(CodigoPreg),
	primary key (codigoJuego, codigoPreg)
)

-----------------------------------------------------------------------------------------
--Datos de Prueba
insert into Categorias(codigoCat,nombreCat) values
('gggg', 'Geografía'),
('hhhh', 'Historia'),
('cccc', 'Ciencia'),
('aaaa', 'Arte-música-cultura'),
('dddd', 'Deportes'),
('pppp', 'Peliculas-TV')
go

insert into Preguntas (textoPregunta,respuesta1,respuesta2,respuesta3,correcta,codigoPreg,puntaje,CodigoCat)
values
('¿Cuántas zonas horarias tienen en Rusia?','9','10','11',3,'gg111',10,'gggg'),
('¿Cuál es la flor nacional de Japón?','Flor de cerezo','Rosa','Amapola',1,'gg222',8,'gggg'),
('¿Cuál es el animal nacional de Australia?','Dingo','Canguro','Koala',2,'gg333',7,'gggg'),
('¿Cuál es la capital de Canadá?','Quebec','Ottawa','Toronto',2,'gg444',10,'gggg'),
('¿Cuál es el país más pequeño del mundo?','Suiza','Guyana','El Vaticano',3,'gg555',3,'gggg'),
('¿Cómo se llamaba Istanbul antes de 1923?','Alejandria','Constantinopla','Persia',2,'hh111',10,'hhhh'),
('¿Que ocurrió el 20 de Julio de 1969?','El alunizaje del apollo 11','Pusta en orbita del Sputnik 1','Primer animal puesto en orbita',1,'hh222',10,'hhhh'),
('¿Cual fue las serie más vista en Netflix en el 2019?','Stranger Things','Game of Thrones','Breaking Bad',1,'pp111',3,'pppp'),
('¿Donde se celebraron los 1eros Juegos Olimpicos modernos?','Stranger Things','Game of Thrones','Breaking Bad',1,'pp222',4,'pppp'),
('¿Donde se celebraron los 1eros Juegos Olimpicos modernos?','Berlin','Roma','Atenas',3,'dd111',8,'dddd'),
('¿Que conductor de la Fórmula-1 ha ganado más campeonatos?','Valentino Rossi','Michael Schumacher','Airton Sena',2,'dd222',6,'dddd'),
('¿De donde es Billie Eilish?','New York','Londres','Los Angeles',3,'aa111',10,'aaaa'),
('¿De que ciudad son originarios los Beatles?','Liverpool','Londres','California',1,'aa222',3,'aaaa'),
('¿Cuál es la serie de libros mejor vendida del siglo 21?','Game of Thrones','Lord of the Rings','Harry Potter',3,'aa333',4,'aaaa'),
('¿Que artista pinto el techo de la Capilla Sixtina en Roma?','Leonardo Davinci','Miguel Angel','Donatello',2,'aa444',9,'aaaa'),
('¿Cuantos lados tiene un hexaedro?','4','5','6',3,'cc111',9,'cccc'),
('¿A que temperatura hierve el agua?','90°C','100°C','110°C',2,'cc222',9,'cccc'),
('¿Cual es el pez depredador más grande del mundo?','Gran Tiburon blanco','Ballena Orca','Tiburón tigre',1,'cc333',10,'cccc'),
('¿En cual especie dan a luz el genero masculino?','Caballito de mar ','Caracoles','Ornitorringo',1,'cc444',9,'cccc'),
('¿Qué planeta del sistema solar esta más cerca del sol?','Mercurio','Venus','Tierra',1,'cc555',9,'cccc')
go

insert into Juegos(nombreJuego,dificultad) ---Agregar datos prueba
values
('Noche de Trivia','Facil'),
('Quien quiere ser millonario','Dificil'),
('El imbatible','Medio')
go

insert into juegoPreguntas(codigoJuego,codigoPreg)  ---Agregar datos prueba
values
(1,'gg111'),
(1,'cc111')
go

select * from Usuarios
select * from Juegos
select * from Preguntas
select * from Categorias
select * from juegoPreguntas
select * from Jugada

--Procedimientos-------------------------------------------------------------------------
--Usuarios-------------------------------------------------------------------------------
create procedure AgregarUsuario --funciona
@nomUs varchar(20),
@contraseña varchar(20),
@nombreCompleto varchar(20)
as
begin
	if exists (select * from Usuarios where nomUsuario = @nomUs)
		return -1 --si el usuario existe
	insert into Usuarios values (@nomUs, @contraseña, @nombreCompleto)
	if @@ERROR != 0
		return -2 --Ocurrio un error inesperado
	else
		return 1 -- Se agrego correctamente
end
go

--declare @variable int
--exec @variable = AgregarUsuario 'rgoss', '1234', 'rodrigo gossweiler'
--if @variable = -1
--	print 'El usuario se encuentra registrado'
--else if @variable = -2
--	print 'Ocurrio un error inesperado'
--else
--	print 'Se agrego el usuario con exito'
--select * from Usuarios
go

create procedure BuscarUsuario --funciona. marcar algo en caso de no encontrarlo?
@nomUs varchar(20)
as
begin
	select * 
	from Usuarios
	where nomUsuario = @nomUs
end
go

--exec BuscarUsuario 'rgoss'
go

create procedure LogueUsuario --funciona
@nomUs varchar(20),
@pass varchar(20)
as
begin
	if exists (select *	from Usuarios where nomUsuario = @nomUs and contraseña = @pass)
		return 1 --Se inicio seccion
	else
		return -1 -- Usuario o contraseña incorrectos
end
go

--declare @retorno int
--exec @retorno = LogueUsuario 'rgoss', '1234'
--if @retorno = -1
--	print 'Usuario o contraseña incorrectos'
--else if @retorno = 1
--	print 'Inicio de session exitoso'
go

--Juegos--------------------------------------------------------------------------------
alter procedure BuscarJuego --funciona
@nomJuego varchar(20),
@codJuego int
as
begin
	select * from Juegos
	where @nomJuego = nombreJuego or @codJuego = codigoJuego
end
go

--exec BuscarJuego null, 1

create Procedure AgregarJuego --funciona
@nomJuego varchar(20),
@dificultar varchar(20)
as
begin
	if exists (select * from juegos where @nomJuego = nombreJuego)
		return -1 --el nombre de juego ya esta asociado
	insert into Juegos (nombreJuego, fechaCreado, dificultad) values (@nomJuego, GETDATE(), @dificultar)
	if @@ERROR != 0
		return -2 --Ocurrio un error inesperado
	else
		return 1 --se agrego correctamente
end
go

--declare @retorno int
--exec @retorno = AgregarJuego 'matelocas', 'medio'
--if @retorno = -1
--	print 'El nombre del juego ya esta registrado'
--else if @retorno = -2
--	print 'Ocurrio un error inesperado'
--else 
--	print 'Se agrego con exito'
--select * from Juegos
go

create procedure ListarJuegosPreguntas --funciona
as
begin
	select nombreJuego, fechaCreado, dificultad
	from Juegos inner join juegoPreguntas on Juegos.codigoJuego = juegoPreguntas.codigoJuego
	inner join Preguntas on juegoPreguntas.codigoPreg = Preguntas.codigoPreg
	group by nombreJuego, fechaCreado, dificultad
end
go

--exec ListarJuegosPreguntas

create procedure ListarJuegos --funciona
as
begin
	select * from Juegos
end
go

--exec ListarJuegos
go

create procedure AgregarPreguntaJuego --funciona
@codpreg varchar(5),
@nomJuego varchar(20)
as
begin
	if not exists (select * from Juegos where nombreJuego = @nomJuego)
		return -1 -- el juego no existe
	declare @codJuego int
	select @codjuego = codigoJuego from Juegos where nombreJuego = @nomJuego
	insert into juegoPreguntas values (@codJuego, @codpreg)
	if @@ERROR != 0
		return -2 -- Ocurrio un error inesperado
	else
		return 1 -- Se agrego la pregunta con exito
end
go

----select * from Juegos
----select * from Preguntas
----select * from juegoPreguntas
--declare @retorno int
--exec @retorno = AgregarPreguntaJuego 'aa111', 'matelocas'
--if @retorno = -1
--	print 'El juego no existe'
--else if @retorno = -2
--	print 'Ocurrio un error inesperado'
--else
--	print 'se agrega la pregunta con exito'

create procedure ModificarJuego --funciona
@nomJuego varchar(20),
@dificultad varchar(20),
@codJuego int
as
begin
	if exists (select * from juegos where @nomJuego = nombreJuego)
		return -1 --el nombre de juego ya esta asociado
	if not exists (select * from juegos where @codJuego = codigoJuego)
		return -2 --El juego que quiere modificar no existe
	begin transaction
		update juegos
		set nombreJuego = @nomJuego, dificultad = @dificultad
		where codigoJuego = @codJuego
		if @@ERROR != 0
		begin
			rollback tran
			return -3 --Ocurrio un error inesperado
		end
		else
			commit tran
	return 1 --Se modifico con exito
end
go

--select * from Juegos
--declare @retorno int
--exec @retorno = ModificarJuego 'matelocs', 'dificil', 4
--if @retorno = -1
--	print 'El nombre de juego ya esta registrado'
--else if @retorno = -2
--	print 'No existe el juego que quiere modificar'
--else if @retorno = -3
--	print 'Ocurrio un error inesperado'
--else
--	print 'Se modifico con exito'
--select * from Juegos
go

create procedure QuitarPregunta  --funciona - una pregunta puede estar en mas de un juego?
@nomJuego varchar(20),
@codPre varchar(5)
as
begin
	if not exists (select * from juegos where nombreJuego = @nomJuego)
		return -1 --El juego no existe
	declare	@codJuego int
	select @codjuego = codigoJuego from Juegos where nombreJuego = @nomJuego
	delete
	from juegoPreguntas
	where codigoPreg = @codPre and codigoJuego = @codJuego
	if @@ERROR != 0
		return -2 --Ocurrio un error inesperado
	else
		return 1 --Se elimino la pregunta con exito
end
go

--select * from juegos
--declare @retorno int
--exec @retorno = QuitarPregunta 'matelocs', 'aa111'
--if @retorno = -1
--	print 'el juego no existe'
--else if @retorno = -2
--	print 'Ocurrio un error inesperado'
--else
--	print 'Se quito la pregunta con exito'
--select * from juegoPreguntas

create procedure EliminarJuego --funciona
@nomJuego varchar(20)
as
begin
	if not exists (select * from juegos where nombreJuego = @nomJuego)
		return -1 --El juego no existe
	declare @var int
	select @var = codigoJuego from Juegos where nombreJuego = @nomJuego
	if exists (select * from juegoPreguntas where @var = codigoJuego)
		return -2 --El juego tiene preguntas asociadas
	delete
	from Juegos
	where codigoJuego = @var
	if @@ERROR != 0
		return -3 --Ocurrio un error inesperado
	else
		return 1 --Se elimino con exito
end
go

--declare @retorno int
--exec @retorno = EliminarJuego 'matelocs'
--if @retorno = -1
--	print 'el juego no existe'
--else if @retorno = -2
--	print 'el juego tiene preguntas asociadas'
--else if @retorno = -3
--	print 'ocurrio un error inesperado'
--else
--	print 'Se elimino el juego con exito'
--select * from Juegos
go

--Categorias--------------------------------------------------------------------------


--Preguntas---------------------------------------------------------------------------


--Jugadas-----------------------------------------------------------------------------
create procedure ListarJugadas
as
begin
	select fechaHoraJugada, nombreJugador, nombreJuego, puntajes
	from Jugada inner join Juegos
	on Jugada.codigoJuego = Juegos.codigoJuego
end
go

create procedure AgregarJugadas
@nombreJugador varchar(20),
@codJuego int,
@puntaje int
as
begin
	insert into Jugada(nombreJugador, codigoJuego, fechaHoraJugada, puntajes)
	values (@nombreJugador, @codJuego, GETDATE(), @puntaje)
	if @@ERROR != 0
		return -1 --Ocurrio un error inesperado 
	else
		return 1 --Se ingreso con exito
end
go
