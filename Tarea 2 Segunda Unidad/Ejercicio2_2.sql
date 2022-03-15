CREATE DATABASE EJERCICIO2_2;
USE EJERCICIO2_2;

CREATE TABLE autor(
	nombre varchar(150) primary key  not null,
	nacionalidad varchar(50) not null,
	ano_nacimiento int not null
);

INSERT INTO autor VALUES('Victor Hugo','Frances',1802);
INSERT INTO autor VALUES('Charles Dickens','Reino Unido',1812);
INSERT INTO autor VALUES('Jose Quezada','Hondureño',1848);

SELECT * FROM autor;


CREATE TABLE usuario(
	dni varchar(50) primary key not null,
	email varchar(50),
	nombre varchar(100),
	apellido varchar(100),
);


INSERT INTO usuario VALUES('0801198619365','alguien1@gmail.com','Jose','Colindrez');
INSERT INTO usuario VALUES('0801199814035','alguien2@hotmail.com','Maria','Rosales');

SELECT * FROM usuario;

CREATE TABLE edicion(
	isbn varchar(50) primary key not null,
	ano varchar(10) not null,
	idioma varchar(50) not null,
	id_copia int foreign key references copia(numero)
);

INSERT INTO edicion VALUES('12F6599889',2000,'Espanol',42);
INSERT INTO edicion VALUES('7845698465-B',2000,'Ingles',13);

SELECT * FROM edicion;

CREATE TABLE copia(
	numero int primary key not null,
);

insert into copia VALUES(42);
insert into copia VALUES(13);

SELECT * FROM copia;


CREATE TABLE prestamo(
	id int identity(1,1) not null,
	fehcaprestamo datetime not null,
	fechadevolucion datetime not null,
	id_usuario varchar(50) foreign key references usuario(dni),
	id_copia int foreign key references copia(numero)
);

INSERT INTO prestamo VALUES('07/23/2021','09/27/2021','0801198619365',42);
INSERT INTO prestamo VALUES('07/23/2021','09/30/2021','0801199814035',13);


SELECT * FROM prestamo;

CREATE TABLE libro(
	titulo varchar(100) primary key not null,
	genero varchar(50) not null,
	resenas varchar(100) not null,
	id_autor varchar(150) foreign key references autor(nombre),
	id_edicion varchar(50) foreign key references edicion(isbn)
);

INSERT INTO libro VALUES('Bleak House','novela','2012 Bubok','Victor Hugo','12F6599889');
INSERT INTO libro VALUES('La gloria','Cuento','1998 Bubok','Jose Quezada','7845698465-B');

SELECT * FROM libro;

CREATE TABLE referencia(
	id int primary key identity(1,1),
	referido varchar(100) foreign key references libro(titulo),
	refiere varchar(100) foreign key references libro(titulo),
);

INSERT INTO referencia VALUES('Bleak House','La gloria');
INSERT INTO referencia VALUES('La gloria',null);

SELECT * FROM referencia;