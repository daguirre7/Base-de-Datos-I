CREATE DATABASE EJERCICIO1;
USE EJERCICIO1;

CREATE TABLE alumno(
	numero_cuenta int primary key identity(1,1) not null,
	nombre varchar(200) not null,
	fecha_nacimiento datetime not null,
	telefono varchar(100) not null
);

INSERT INTO alumno values('Jose Hernandez','07/11/2000','22359878');
INSERT INTO alumno values('Katy Funez','27/06/1998','99865647');

SELECT * FROM alumno;

CREATE TABLE asignatura(
	codigo_asignatura int primary key identity(1,1) not null,
	nombre nvarchar(100) not null,
	unidades_valorativas int not null
);

INSERT INTO asignatura VALUES('Base de Datos I',5);
INSERT INTO asignatura VALUES('Ecuaciones Diferenciales',3);
INSERT INTO asignatura VALUES('Programación I',5);

SELECT * FROM asignatura;

CREATE TABLE alumno_asignatura(
	id int primary key identity(1,1) not null,
	id_alumno int foreign key references alumno(numero_cuenta),
	id_asignatura int foreign key references asignatura(codigo_asignatura)
);



INSERT INTO alumno_asignatura VALUES(1,1);
INSERT INTO alumno_asignatura VALUES(1,2);
INSERT INTO alumno_asignatura VALUES(2,1);
INSERT INTO alumno_asignatura VALUES(2,3);

SELECT * FROM alumno_asignatura;


CREATE TABLE profesor (
	id_profesor int primary key identity(1,1) not null,
	nombre varchar(200) not null,
	telefono varchar(100) not null,
	id_asignatura int foreign key references asignatura(codigo_asignatura) not null
);

INSERT INTO profesor values('Pedro Molina','2356-8978',1);
INSERT INTO profesor values('Maria Rubio','3378-4589',3);

SELECT * FROM profesor;