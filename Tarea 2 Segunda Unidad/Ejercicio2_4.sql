CREATE DATABASE EJERCICIO2_4;

USE EJERCICIO2_4;

CREATE TABLE cliente (
	dni varchar(50) primary key not null,
	nombre varchar(100) not null,
	email varchar(25) not null,
	telefono varchar(50)
);

INSERT INTO cliente VALUES('0615-2001-45685','Karla Santos','karlas@protonmail.com','8852-7895');
INSERT INTO cliente VALUES('1015-1992-35489','Jose Mendez','jmendez@yahoo.com','2255-4568');

select * from cliente;

CREATE TABLE proveedor(
	cuit varchar(50) primary key not null,
	telefono varchar(50) not null,
	razon_social varchar(25) not null
);

insert into proveedor VALUES('E65678','455-8978','Juridico');
insert into proveedor VALUES('7897Y2','788-5468','Natural');

Select * from proveedor;

CREATE TABLE producto(
	id int primary key identity(1,1) not null,
	id_proveedor varchar(50) foreign key references proveedor(cuit)
);

INSERT INTO producto VALUES('E65678');
INSERT INTO producto VALUES('7897Y2');

select * from producto;

CREATE TABLE cupon (
	numero int primary key not null,
	hora_vto time(7),
	fecha datetime not null,
	importe money not null,
	id_producto int foreign key references producto(id) not null,
	id_cliente varchar(50) foreign key references cliente(dni)
);

INSERT INTO cupon VALUES(456,'15:00','07/21/2021',23.5,'1',null);
INSERT INTO cupon VALUES(7859,'15:00','07/21/2021',50.99,'2','0615-2001-45685');
INSERT INTO cupon VALUES(7878,'15:00','07/21/2021',50.99,'2','0615-2001-45685');

Select * from cupon;

CREATE TABLE supercupon(
	id int primary key identity(1,1),
	asocia int foreign key references cupon(numero),
	asociado int foreign key references cupon(numero),
);

INSERT INTO supercupon VALUES(456,NULL);
INSERT INTO supercupon VALUES(456,7878);

sELECT * FROM supercupon;