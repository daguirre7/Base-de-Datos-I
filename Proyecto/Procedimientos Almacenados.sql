/*c) Procedimientos almacenados*/
USE Farmacia;
--i. Función para búsqueda de clientes por nombre
create procedure getCliente @nombre nvarchar(50)
as
select id_cliente,nombre,telefonos from cliente where nombre like '%' + @nombre + '%'

execute  getCliente @nombre='Ana'

--ii. Eliminar clientes por id
create procedure Eliminaclientes @id char(5)
as
delete  cliente where id_cliente=@id  

execute Eliminaclientes @id='p'

--iii. Actualizar clientes por id

create procedure Actualizaclientes @id char(5),@nombre nvarchar(50),@telefonos nvarchar(25),@correo nvarchar(20),@direccion nvarchar(60)
as
update cliente 
set nombre=@nombre,
	telefonos=@telefonos,
	correo=@correo,
	direccion_completa=@direccion
where id_cliente=@id  

execute Actualizaclientes @id='WOLZA',@nombre='Zbyszek Piestrzeniewicz',@telefonos='(26) 642-7012',@correo='zp455@gmail.com',@direccion='ul. Filtrowa 68'

SELECT * from cliente


--iv. Listado de todos los pedidos realizados por un cliente
create procedure PedidosRealizados @id char(5)
as
SELECT * from ordencompra where id_cliente=@id

execute PedidosRealizados @id=ANATR

--v. Total de ventas de un producto en una fecha determinada
create procedure VentasProductoFecha @idproducto int, @fecha date
as
SELECT * from ordencompra where id_producto=@idproducto and fecha_compra=@fecha

execute VentasProductoFecha  @idproducto=15, @fecha='2022-03-27'