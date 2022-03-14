CREATE DATABASE EJERCICIO3;
USE EJERCICIO3;

CREATE TABLE cliente (
	numero_cliente int primary key identity(1,1) not null,
	aplellido varchar(100) not null,
	domicilio_legal nvarchar(150) not null,
	telefono nvarchar(100) not null,
);

INSERT INTO cliente VALUES('Hernandez','Resid. Plaza','3356-8989');
INSERT INTO cliente VALUES('Funez','Col. kennedy','9989-4515');
INSERT INTO cliente VALUES('Hernandez','Resid. Adas','4568-9867');

SELECT * FROM cliente;

CREATE TABLE disfraz(
	codigo_disfraz int primary key identity(1,1)not null,
	personaje varchar(100) not null,
	precio_alquiler money not null
);

INSERT INTO disfraz VALUES('Batman',500);
INSERT INTO disfraz VALUES('Shrek',350);
INSERT INTO disfraz VALUES('Policia',400);

SELECT * FROM disfraz;

CREATE TABLE animador(
	codigo_animador int primary key identity(1,1),
	dni varchar(50),
	apellido varchar(100),
	id_disfraz int foreign key references disfraz(codigo_disfraz)
);

INSERT INTO animador VALUES('0801-1689-22356','Hernandez',1);
INSERT INTO animador VALUES('0615-1998-63598','Lopez',2);
INSERT INTO animador VALUES('0801-1689-22356','Hernandez',3);

SELECT * FROM animador;

CREATE TABLE evento  (
	codigo_evento int primary key identity(1,1) not null,
	descripcion varchar(150) not null,
	precio money not null,
	horario varchar(50) not null,
	id_animador int foreign key references animador(codigo_animador) not null
);

INSERT INTO evento VALUES('Cumpleaños',17000,'18:00 a 19:00',1);
INSERT INTO evento VALUES('Fiesta de 15 años',17000,'19:00 a 22:00',2);
INSERT INTO evento VALUES('Presentacion Productos',6500,'23:00 a 00:00',1);

SELECT * FROM evento;

CREATE TABLE cliente_evento(
	id int primary key identity(1,1),
	id_cliente int foreign key references cliente(numero_cliente),
	id_evento int foreign key references evento(codigo_evento)
);

INSERT INTO cliente_evento VALUES(1,1);
INSERT INTO cliente_evento VALUES(1,3);
INSERT INTO cliente_evento VALUES(2,2);

Select * from cliente_evento;