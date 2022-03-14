CREATE DATABASE EJERCICIO2;
USE EJERCICIO2;

CREATE TABLE ciudadano(
	id int primary key identity(1,1) not null,
	nombre varchar(200) not null,
	telefono varchar(100)not null,
	salario money,
);

INSERT INTO ciudadano VALUES('Jose Hernandez','3356-89-89',15000);
INSERT INTO ciudadano VALUES('Katy Funez','9989-45-15',31000);
INSERT INTO ciudadano VALUES('Karla Ortiz','4568-98-67',10500);
INSERT INTO ciudadano VALUES('Julia Carcamo','3356-78-98',10500);

SELECT * FROM ciudadano;

CREATE TABLE localidad(
	codigo_localidad int primary key identity(1,1),
	nombre_localidad varchar(200),
	id_ciudadano int foreign key references ciudadano(id) not null
);

INSERT INTO localidad VALUES('Caulato',1);
INSERT INTO localidad VALUES('Caulato',2);
INSERT INTO localidad VALUES('Lorelay',3);

SELECT * FROM localidad;

CREATE TABLE municipio(
	id int primary key not null identity(1,1),
	codigo_municipio int ,
	nombre_municipio varchar(200) not null,
	id_localidad int foreign key references localidad(codigo_localidad) not null
);

INSERT INTO municipio VALUES(0815,'San Marcos de Colón',1);
INSERT INTO municipio VALUES(1015,'Sonaguera',2);
INSERT INTO municipio VALUES(1015,'Sonaguera',3);

Select * from municipio;

CREATE TABLE departamento(
	id int primary key identity(1,1) not null,
	codigo_departamento varchar(100) not null,
	nombre_departamento varchar(100) not null,
	id_municipio int foreign key references municipio(id) not null
);

INSERT INTO departamento VALUES('08CH','Choluteca',1);
INSERT INTO departamento VALUES('10CO','Cortés',2);
INSERT INTO departamento VALUES('10CO','Cortés',3);

SELECT * FROM departamento;