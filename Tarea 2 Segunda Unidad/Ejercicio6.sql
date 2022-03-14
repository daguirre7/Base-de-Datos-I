CREATE DATABASE EJERCICIO6;
USE EJERCICIO6;

CREATE TABLE farmaceutico(
	id int primary key identity(1,1),
	nombre varchar(150)
);

INSERT INTO farmaceutico VALUES('Pedro Hernandez');
INSERT INTO farmaceutico VALUES('Fausto Molina');

SELECT * FROM farmaceutico;

CREATE TABLE farmacia(
	id_farmacia int primary key not null,
	direccion varchar(100) not null,
	dias_guardia varchar(150)
);

INSERT INTO farmacia VALUES(50,'Los Andes, calle 17','Lunes a Viernes');
INSERT INTO farmacia VALUES(51,'Blvd. Morazan, torre Morazan','Sabado a Domingo');
INSERT INTO farmacia VALUES(52,'Blvd. Francia, calle 1',null);

SELECT * FROM farmacia;

CREATE TABLE ciudad(
	id_dicudad int primary key identity(1,1) not null,
	nombre varchar(75)not null,
	codigo_postal int not null,
	id_farmacia int foreign key references farmacia(id_farmacia)
);

INSERT INTO ciudad VALUES('Tegucigalpa',11101,50);
INSERT INTO ciudad VALUES('Comayaguela',11102,51);
INSERT INTO ciudad VALUES('Comayaguela',11102,52);

SELECT * FROM ciudad;


CREATE TABLE empleado(
	id int primary key identity(1,1),
	nombre varchar(150),
	fecha_ingreso datetime not null,
	enfermedades varchar(75),
	id_farmacia int foreign key references farmacia(id_farmacia)
);


INSERT INTO empleado VALUES('Fernando Escamilla','07/01/2021',null,50);
INSERT INTO empleado VALUES('Maria Borjas','04/01/2019','Diabetes',50);
INSERT INTO empleado VALUES('Carlos Zepeda','01/01/2018','Diabetes,Hipertension',51);

SELECT * FROM empleado;

CREATE TABLE accion_terapeutica(
	id int primary key identity(1,1),
	nombre varchar(50),
);

INSERT INTO accion_terapeutica VALUES('regula ritmo cardíaco');
INSERT INTO accion_terapeutica VALUES('elimina la irritación en la piel');

SELECT * FROM accion_terapeutica;

CREATE TABLE medicamento(
	id int primary key identity(1,1) not null,
	nombre varchar(150) not null,
	presentacion varchar(50) not null,
	precio money not null,
	componentes varchar(50) not null,
	cantidad int not null,
	id_accion_terapeutica int foreign key references accion_terapeutica(id)
);

INSERT INTO medicamento VALUES('Irbersartan','Pastillas',600,'irversartan,povidona',28,1);
INSERT INTO medicamento VALUES('Betaderm','Unguento',325.25,'Betametasona, Gentamicina',1,2);

SELECt * FROm medicamento;

CREATE TABLE farmacia_medicamento(
	id int primary key identity(1,1),
	id_farmacia int foreign key references farmacia(id_farmacia),
	id_medicamento int foreign key references medicamento(id)
);

INSERT INTO farmacia_medicamento VALUES(50,1);
INSERT INTO farmacia_medicamento VALUES(50,2);
INSERT INTO farmacia_medicamento VALUES(51,1);
INSERT INTO farmacia_medicamento VALUES(52,2);

SELECT * FROM farmacia_medicamento;


CREATE TABLE laboratorio (
	id_laboratorio int primary key identity(1,1) not null,
	nombre varchar(100),
	apellido_dueno varchar(75),
	nombre_dueno varchar(75),
	id_medicamento int foreign key references medicamento(id)
);

INSERT INTO laboratorio VALUES('Labospi','Larios','Manuel',1);
INSERT INTO laboratorio VALUES('Labospi','Larios','Manuel',2);
INSERT INTO laboratorio VALUES('Infarma','Rios','Karla',1);

SELECT * from laboratorio;

CREATE TABLE componente (
	id int primary key identity(1,1),
	nombre varchar(75) not null,
	tiempo_efecto varchar(50) not null
);

INSERT INTO componente VALUES('x','8 HORAS');
INSERT INTO componente VALUES('Y','12 HORAS');

SELECT * FROM componente;

CREATE TABLE medicamento_componente(
	id int primary key identity(1,1),
	id_medicamento int foreign key references medicamento(id),
	id_componente int foreign key references componente(id)
);

INSERT INTO medicamento_componente VALUES(1,2);
INSERT INTO medicamento_componente VALUES(2,1);


SELECT * FROM medicamento_componente;