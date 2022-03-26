CREATE DATABASE TAREA4;
USE TAREA4;
--Proveedor(id_proveedor, nombre, categoría, ciudad)
CREATE TABLE proveedor(
	id_proveedor int identity(1,1) primary key not null,
	nombre nvarchar(100) not null,
	categoria nvarchar(75) not null,
	ciudad nvarchar(75) not null,
); 

INSERT INTO proveedor VALUES('Jose Hernandez','Linea Blanca','Tegucigalpa');
INSERT INTO proveedor VALUES('Kritza Perez','Dormitorio','San Pedro Sula');
INSERT INTO proveedor VALUES('Juana Molina','Muebles','Tegucigalpa');
INSERT INTO proveedor VALUES('Douglas Martin','Tecnología','La Ceiba');
INSERT INTO proveedor VALUES('Samuel Guillen','Electrodomesticos','Copán');
INSERT INTO proveedor VALUES('Santos Roman','Automotriz','Olancho');

SELECT* FROM proveedor;

--Producto(id_articulo, descripción, ciudad, precio)
CREATE TABLE producto(
	id_articulo int identity(1,1) primary key not null,
	descripcion nvarchar(75) not null,
	ciudad nvarchar(75) ,
	precio money not null
);


INSERT INTO producto VALUES('Lavadora LG','Tegucigalpa',15000);
INSERT INTO producto VALUES('Televisor Sony','La Ceiba',23000);
INSERT INTO producto VALUES('Licuadora Oster','Copán',1500);
INSERT INTO producto VALUES('Juego de Sala','Tegucigalpa',19000);
INSERT INTO producto VALUES('Laptop Lenovo','La Ceiba',25000);

select * from producto;


--Cliente(id_cliente, nombre, ciudad)
CREATE TABLE cliente(
	id_cliente int identity(1,1) primary Key not null,
	nombre nvarchar(100) not null,
	ciudad nvarchar(75) not null,
);

INSERT INTO cliente VALUES('Andres Garcia Soler','Tegucigalpa');
INSERT INTO cliente VALUES('Jose Luis Carcamo','San Pedro Sula');
INSERT INTO cliente VALUES('Ana Maria Lujan','San Pedro Sula');
INSERT INTO cliente VALUES('German Alejandro Trochez','Tegucigalpa');
INSERT INTO cliente VALUES('Daniel Elias Carias','San Pedro Sula');

select * from cliente;

--Pedido(id_pedido, id_articulo, id_cliente, id_proveedor, fecha_pedido, cantidad, precio_total)
CREATE TABLE pedido(
	id_pedido int identity(1,1) primary key not null,
	id_articulo int foreign key references producto(id_articulo) not null,
	id_cliente int foreign key references cliente(id_cliente) not null,
	id_proveedor int foreign key references proveedor(id_proveedor) not null,
	fecha_pedido datetime not null,
	cantidad int not null,
	precio_total money not null,
);

INSERT INTO pedido VALUES(1,2,1,'03/12/2022',1,15000);
INSERT INTO pedido VALUES(2,3,4,'02/15/2022',2,46000);
INSERT INTO pedido VALUES(3,3,5,'02/15/2022',2,3000);
INSERT INTO pedido VALUES(4,1,1,'03/15/2022',1,19000);
INSERT INTO pedido VALUES(5,4,5,'01/30/2022',3,75000);

select * from pedido;

--Inventario(id_inventario, id_producto, fecha, cantidad)
CREATE TABLE inventario(
	id_inventario int identity(1,1) primary key not null,
	id_producto int foreign key references producto(id_articulo) not null,
	fecha datetime not null,
	cantidad int not null,
);


INSERT INTO inventario VALUES(5,'01/29/2022',7);
INSERT INTO inventario VALUES(3,'02/14/2022',5);
INSERT INTO inventario VALUES(4,'01/29/2022',3);
INSERT INTO inventario VALUES(1,'03/11/2022',4);
INSERT INTO inventario VALUES(2,'03/11/2022',10);

select * from inventario;
