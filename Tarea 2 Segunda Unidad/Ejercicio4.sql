CREATE DATABASE EJERCICIO4;
USE EJERCICIO4;

CREATE TABLE camion(
	matricula varchar(50) primary key not null,
	modelo varchar(100) not null,
	tipo varchar(50) not null,
	potencia varchar(50) not null
);

INSERT INTO camion VALUES('25A78','Austin','Ligero','500 Kg');
INSERT INTO camion VALUES('53F14','Mercedes','Rastra','45 To');
INSERT INTO camion VALUES('78M16','Isuzu','Camioneta','100 Kg');

SELECT * FROM camion; 

CREATE TABLE camionero(
	dni varchar(50) primary key not null,
	nombre varchar(150) not null,
	telefono varchar(75) not null,
	salario money 
);

INSERT INTO camionero VALUES('0801-1986-98659','Felicito Hernandez','8789-65-23',null);
INSERT INTO camionero VALUES('0801-1998-65753','Efrain Funez','7845-2564',25000);
INSERT INTO camionero VALUES('0815-2000-68988','Walter Ortiz','7785-5845',27000);

SELECT * FROM camionero;

CREATE TABLE camion_camionero(
	id int primary key identity(1,1) not null,
	id_camion varchar(50) foreign key references camion(matricula),
	id_camionero varchar(50) foreign key references camionero(dni)
);

INSERT INTO camion_camionero VALUES('25A78','0801-1986-98659');
INSERT INTO camion_camionero VALUES('53F14','0801-1986-98659');
INSERT INTO camion_camionero VALUES('78M16','0801-1998-65753');

SELECT * FROM camion_camionero;

CREATE TABLE departamento (
	codigo_departamento int primary key identity(1,1) not null,
	nombre varchar(75) not null
);

INSERT INTO departamento VALUES('Tecnología');
INSERT INTO departamento VALUES('Linea Blanca');
INSERT INTO departamento VALUES('Mobiliario');

SELECT * FROM departamento;

CREATE TABLE paquete(
	codigo_paquete int primary key identity(1,1),
	descripcion varchar(150) not null,
	destinatario varchar(75) not null,
	direccion_destinatario varchar (100) not null,
	id_camionero varchar(50) foreign key references camionero(dni),
	id_departamento int foreign key references departamento(codigo_departamento)
);

INSERT INTO paquete VALUES('Laptop','Jesus Rendon','Calle 3, casa 158','0801-1986-98659',1);
INSERT INTO paquete VALUES('PC','Santiago Perez','Calle 45, Apart 275','0801-1986-98659',1);
INSERT INTO paquete VALUES('Silla','Anahi Jerez','Ave princ, edif, M','0815-2000-68988',3);

SELECT * FROM paquete;