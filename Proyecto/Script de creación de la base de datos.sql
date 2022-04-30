CREATE DATABASE Farmacia;
USE Farmacia;

CREATE TABLE cliente(
	id_cliente char(5) primary key NOT NULL,
	nombre nvarchar(50) NOT NULL,
	telefonos nvarchar(25) NOT NULL,
	correo nvarchar(20) NULL,
	direccion_completa nvarchar(60)NOT NULL,
	fecha_nacimiento date NOT NULL
);


CREATE TABLE farmacia(
	id_farmacia char(5) primary key NOT NULL,
	ubicacion nvarchar(25) NOT NULL
);

CREATE TABLE categoria(
	id_categoria int identity(1,1) primary key NOT NULL,
	descripcion nvarchar(25) NOT NULL
);


CREATE TABLE proveedor(
	id_proveedor int identity(1,1) primary key NOT NULL,
	nombrepoveedor nvarchar(30) NOT NULL,
	telefonoproveedor nvarchar(25) NOT NULL
);

CREATE TABLE promociones(
	id_promo int identity(1,1) primary key NOT NULL,
	fecha_inicio date NOT NULL,
	fecha_fin date NOT NULL,
	porcentaje_descuento decimal (9, 2) NOT NULL
);


CREATE TABLE productos(
	id_producto int primary key identity(1,1) NOT NULL,
	nombreproducto nvarchar(50) NOT NULL,
	id_proveedor int foreign key references proveedor(id_proveedor)NOT NULL,
	id_categoria int foreign key references categoria(id_categoria)NOT NULL,
	descripcion nvarchar(25) NOT NULL,
	precio_compra float NOT NULL,
	precio_venta float NOT NULL,
	fotografia varbinary(max) NOT NULL
);



CREATE TABLE inventario(
	id_inventario int identity(1,1) primary key NOT NULL,
	id_farmacia char(5) foreign key references farmacia(id_farmacia) NOT NULL,
	id_producto int foreign key references productos(id_producto)NOT NULL,
	unidades_existencia int NOT NULL
);

CREATE TABLE ordencompra(
	id_compra int primary key identity(1,1) NOT NULL,
	fecha_compra date NOT NULL,
	id_cliente char(5) foreign key references cliente(id_cliente)NOT NULL,
	id_farmacia char(5) foreign key references farmacia(id_farmacia) NOT NULL,
	id_producto int foreign key references productos(id_producto)NOT NULL,
	cantidad_productos int NOT NULL,
	id_promo int foreign key references promociones(id_promo) NULL,
);

