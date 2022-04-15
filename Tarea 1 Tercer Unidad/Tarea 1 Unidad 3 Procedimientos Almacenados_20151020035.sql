/*Tarea 1 Unidad 3*/
Use Northwind;

/*Procedimientos Almacenados*/

/* 1.Cree un procedimiento almacenado que muestre todas las ordenes (Orders) 
realizadas por un empleado en un determinado año.*/

create procedure getOrdenes
as

select * from Orders where  YEAR(OrderDate)=1998

execute getOrdenes

/*2.Realice un procedimiento almacenado que muestre los clientes que 
pertencen a determinada ciudad.*/

create procedure getClientes @ciudad varchar(20)
as

select*from Customers where City=@ciudad

execute  getClientes @ciudad='México D.F.'


/*3.Construya un procedimiento almacenado que filter los 
empleados que cumpleaños cada mes utilizando el BirthDate.*/


create procedure getCumple  @mes char(2)
as
select * from Employees where MONTH(BirthDate)=@mes

execute getCumple @mes=01

/*4.Obtener todas las ordenes generadas en una fecha determinada*/

create procedure getOrdenesFecha @fecha date
as
Select * from Orders where OrderDate =@fecha 

execute getOrdenesFecha @fecha='1996-07-04'

/*5.Realizar un procedimiento almacenado que actualize el telefono de un determinado cliente.*/

create procedure updateTelefono @telefono nvarchar(24), @nombre nvarchar(30)
as
update Customers set Phone=@telefono where ContactName=@nombre 

execute updateTelefono @telefono='445635', @nombre='Aria Cruz'

select * from Customers order by ContactName