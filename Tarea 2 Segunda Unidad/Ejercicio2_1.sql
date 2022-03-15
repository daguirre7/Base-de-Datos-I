CREATE DATABASE EJERCICIO2_1;
USE EJERCICIO2_1;

CREATE TABLE arbitro(
	pasaporte_arbitro varchar(25) primary key not null,
	nomyap_arbitro varchar(100) not null,
	nacionalidad varchar(75) not null,
	anoinicioactividad int not null,
);

INSERT INTO arbitro VALUES('X0523821F','Tomas Ramirez','Mexicano','2019');
INSERT INTO arbitro VALUES('00523821F','Jose Trochez','Guatemalteco','2000');
INSERT INTO arbitro VALUES('523821-F.','Melissa Borjas','Hondureña','2013');

CREATE TABLE reemplazo(
	id int primary key identity(1,1) not null,
	id_reemplaza varchar(25) foreign key references arbitro(pasaporte_arbitro) NULL,
	id_reemplazado varchar(25) foreign key references arbitro(pasaporte_arbitro) NULL 
);

INSERT INTO reemplazo VALUES('X0523821F','523821-F.');
INSERT INTO reemplazo VALUES('523821-F.',NULL);

SELECT* FROM reemplazo;

CREATE TABLE equipo(
	nombreseleccion varchar(100) primary key not null,
	nombre_dt varchar(100),
	lugar_entrenamiento varchar(75),
	miembro_eqtecnico varchar(75)
);

INSERT INTO equipo VALUES('Honduras','Reinaldo Rueda','Estadio Morazan','Jose F,Luis R');
INSERT INTO equipo VALUES('Mexico','Gerardo Martino','Varios','Marcelo F,Miguel H');
INSERT INTO equipo VALUES('Brasil','','Varios','Marcelo F,Miguel H');

SELECT * FROM equipo;

CREATE TABLE jugador(
	id int primary key identity(1,1) not null,
	nyap varchar(100) not null,
	nrocamiseta int not null,
	posision varchar(50),
	apodo varchar(25),
	id_equipo varchar(100)foreign key references equipo(nombreseleccion)
);

INSERT INTO jugador VALUES('Alberth Elis',7,'Lateral Derecho','Panterita','Honduras');
INSERT INTO jugador VALUES('Romell Quito',8,'Medio campo','La bestia','Honduras');
INSERT INTO jugador VALUES('Guillermo Ochoa',8,'Prtero','Memo Ochoa','Mexico');

Select * from jugador;

CREATE TABLE estadio (
	nombre varchar(100) primary key not null,
	ciudad varchar(75) not null,
	capacidadmaxima int not null
);

INSERT INTO estadio VALUES('Azteca','Tlalpan,Mexico',87523);	
INSERT INTO estadio VALUES('Morazán','Blvd. Morazan, SPS',18000);

SELECT * FROM estadio;

CREATE TABLE partido(
	id_partido int identity(1,1)  not null,
	instancia varchar(100),
	fecha datetime not null,
	duracion varchar(25),
	nombre_estadio varchar(100) foreign key references estadio(nombre) not null,
	Id_arbitro varchar(25) foreign key  references arbitro(pasaporte_arbitro) not null, 
	nombre_equipo1 varchar(100) foreign key references equipo(nombreseleccion) not null,
	nombre_equipo2 varchar(100) foreign key references equipo(nombreseleccion) not null,
);

INSERT INTO partido VALUES('x','03/14/2022','90 min','Azteca','X0523821F','Honduras','Mexico');
INSERT INTO partido VALUES('Amistoso','03/10/2022','95 min','Morazán','523821-F.','Mexico','Brasil');

SELECT * FROM partido;

CREATE TABLE aficionado(
	nro_ticket int primary key identity(1,1) not null,
	vestimenta varchar(50),
	nroasiento int not null,
	ubicacion varchar(50),
	id_estadio varchar(100) foreign key references estadio(nombre)
);

INSERT INTO aficionado values('colores alusivos al equipo',253,'silla','Azteca');
INSERT INTO aficionado values('Blanco Verde',548,'sombra sur','Azteca');

SELECT * FROM aficionado;
