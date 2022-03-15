CREATE DATABASE EJERCICIO2_3;

USE EJERCICIO2_3;

CREATE TABLE agencia(
	codigo int primary key not null,
	fechainicio datetime not null,
	ciudad varchar(75) not null,
);

INSERT INTO agencia VALUES(50,'04/02/2021','Tegucigalpa');
INSERT INTO agencia VALUES(47,'04/02/2021','San Pedro Sula');

Select * from agencia;

CREATE TABLE banco(
	nombre varchar(100) primary key not null,
	sucursal varchar(75) not null
);

INSERT INTO banco VALUES('BAC','57 City Mall');
INSERT INTO banco VALUES('Promerica','12 Blvd Morazan');

Select * from banco;


CREATE TABLE cliente(
	dni varchar(75) primary key not null,
	nyap varchar(150) not null,
	domicilio varchar(100) not null,
);

INSERT INTO cliente VALUES('0810-1987-45678','Daniel Pastrana','Col Kennedy sector 3 casa 1503');
INSERT INTO cliente VALUES('0801-1995-01234','Natalia Perez','Miraflores Sur, calle 78, casa 2578');

select* from cliente

CREATE TABLE formapago(
	tipo varchar(75) primary key not null,
	monto money not null,
	id_cliente varchar(75) foreign key references cliente(dni)not null 
);

INSERT INTO formapago VALUES('Tarjeta',15000,'0810-1987-45678');
INSERT INTO formapago VALUES('Cheque',23000,'0801-1995-01234');

Select * from formapago;

CREATE TABLE formapago_banco(
	id int primary key identity(1,1) not null,
	fechavalidez datetime,
	id_formapago varchar(75) foreign key references formapago(tipo),
	id_banco varchar(100) foreign key references banco(nombre)
);

INSERT INTO formapago_banco VALUES('01/15/2021','Tarjeta','BAC');
INSERT INTO formapago_banco VALUES(null,'Cheque','Promerica');

Select * from formapago_banco;

CREATE TABLE paqueteturistico(
	codpaq varchar(75) primary key not null,
	pais varchar(75) not null,
	precio money not null,
	id_agencia int foreign key references agencia(codigo)
);

INSERT INTO paqueteturistico VALUES(1500,'Colombia',23000,50);
INSERT INTO paqueteturistico VALUES(1501,'Guatemala',17000,50);
INSERT INTO paqueteturistico VALUES(1503,'Colombia',22000,47);

select * from paqueteturistico;
