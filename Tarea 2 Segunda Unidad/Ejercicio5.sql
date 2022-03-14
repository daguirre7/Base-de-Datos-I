CREATE DATABASE EJERCICIO5;
USE EJERCICIO5;

CREATE TABLE cliente(
	identificacion varchar(75) primary key not null,
	nombre varchar(100) not null,
	apellido varchar(100) not null,
	direccion varchar(75) not null,
	fecha_nacimiento datetime not null,
);

INSERT INTO cliente VALUES('0801-1985-65478','Jose','Hernandez','Col. La Esperanza','07/11/1985');
INSERT INTO cliente VALUES('0810-1997-65897','Katy','Funez','Resid. Robles','06/27/1997');
INSERT INTO cliente VALUES('1315-2001-89789','Luis','Aguikera','Resid. Lomas','07/11/2001');

SELECT * FROM cliente;

CREATE TABLE producto(
	codigo_producto int primary key not null,
	nombre varchar(100) not null,
	precio_unitario money not null,
);

INSERT INTO producto VALUES(159,'Libreta de Notas',15);
INSERT INTO producto VALUES(758,'Cuaderno 1 Mat',45);
INSERT INTO producto VALUES(489,'Lapiz Grafito',2.5);

SELECT * FROM producto;

CREATE TABLE cliente_producto(
	id int primary key identity(1,1),
	id_cliente varchar(75) foreign key references cliente(identificacion),
	id_producto int foreign key references producto(codigo_producto)
);

INSERT INTO cliente_producto VALUES('0801-1985-65478',159);
INSERT INTO cliente_producto VALUES('0810-1997-65897',489);
INSERT INTO cliente_producto VALUES('0801-1985-65478',758);

SELECT * FROM cliente_producto;

CREATE TABLE proveedor(
	rtn float primary key not null,
	nombre varchar(150) not null,
	direccion varchar(100) not null,
	id_producto int foreign key references producto(codigo_producto)
);

INSERT INTO proveedor VALUES(080145698789851,'Comercial Honduras','Boulevard del Norte, calle Zambrano',159);
INSERT INTO proveedor VALUES(080116985456871,'Papeleria Lamas','kilometro 8, Complejo Funez',758);
INSERT INTO proveedor VALUES(080119875654781,'Comercial Honduras','Fabrica J&J, ZIP San Jose',159);

Select * from proveedor;