CREATE DATABASE EJERCICIO7;
USE EJERCICIO7;

CREATE TABLE autor(
	cod_autor int primary key identity(1,1) not null,
	nombre varchar(150)
);

INSERT INTO autor VALUES('Victor Hugo');
INSERT INTO autor VALUES('Charles Dickens');
INSERT INTO autor VALUES('Jose Quezada');

SELECT * FROM autor;

CREATE TABLE libro(
	codigo_libro varchar(100) primary key not null,
	isbn varchar(20) not null,
	editorial varchar(100) not null,
	num_paginas int not null,
);

INSERT INTO libro VALUES('H121','57787A65F897','Bubok',587);
INSERT INTO libro VALUES('D425','8957F656G565','Vive Libro',250);
INSERT INTO libro VALUES('P257','7898O625148P','Bubok',300);

SELECT * FROM libro;

CREATE TABLE autor_libro(
	id int primary key identity(1,1) not null,
	id_autor int foreign key references autor(cod_autor) not null,
	id_libro  varchar(100) foreign key references libro(codigo_libro) null
);

INSERT INTO autor_libro VALUES(1,'H121');
INSERT INTO autor_libro VALUES(2,'D425');
INSERT INTO autor_libro VALUES(1,'P257');


SELECT * FROM autor_libro;

CREATE TABLE ejemplar(
	cod_ejemplar int primary key identity(1,1) not null,
	localizacion varchar(50),
	id_libro varchar(100) foreign key references libro(codigo_libro)
);


INSERT INTO ejemplar VALUES('f24c28','H121');
INSERT INTO ejemplar VALUES('f24c27','H121');
INSERT INTO ejemplar VALUES('f37c11','D425');

SELECT * FROM ejemplar;

CREATE TABLE usuario (
	cod_usuario int primary key identity(1,1) not null,
	nombre varchar(100)not null,
	direccion varchar(75)not null,
	telefono varchar(75)not null
);

INSERT INTO usuario VALUES('Gerardo Bulnes','Col, Tres Caminos','2557-8877');
INSERT INTO usuario VALUES('Joel Escoto','Col Hato','3458-4856');
INSERT INTO usuario VALUES('Hector Martinez','Col Honduras, Tres Caminos','9989-7526');

SELECT * from usuario;

create table ejemplar_usuario(
	id int primary key identity(1,1),
	id_ejemplar int foreign key references ejemplar(cod_ejemplar),
	id_usuario int foreign key references usuario(cod_usuario)
);


INSERT INTO ejemplar_usuario VALUES(1,2);
INSERT INTO ejemplar_usuario VALUES(2,3);
INSERT INTO ejemplar_usuario VALUES(2,2);

SELECT * FROM ejemplar_usuario;
