USE TAREA4;

--·  	Construya las siguientes consultas en SQL
--1.	Encontrar el id y nombre del proveedor que proveen el producto con  id=1
SELECT id_proveedor,nombre FROM proveedor
WHERE id_proveedor=1

--2.	Encontrar los clientes (nombre cliente) que realizaron pedidos de los productos proveídos por el proveedor con id=1
SELECT C.nombre,P.id_proveedor 
FROM pedido P
Left JOIN
cliente C
ON P.id_cliente=C.id_cliente
WHERE P.id_proveedor=1

--3.	Encontrar los proveedores que suministran todos los productos cuyo precio es mayor al precio promedio de los productos.
Select PV.id_proveedor,PV.nombre as 'Nombre Proveedor',PROD.precio from 
proveedor PV
Left Join pedido P
ON P.id_proveedor=PV.id_proveedor
left join producto PROD
ON p.id_articulo=PROD.id_articulo
WHERE PROD.precio>(Select AVG(precio)as 'Precio_Promedio' from producto)


--4.	Listar los proveedores a los cuales no se les haya solicitado ningún producto
Select PV.id_proveedor,PV.nombre as 'Nombre Proveedor' from 
 proveedor PV
where PV.id_proveedor not in(SELECT id_proveedor from pedido)


--5.	Listar los nombres de los clientes  que hayan pedido más de un producto y que el precio sea mayor a 100
Select C.id_cliente,C.nombre as 'Nombre Cliente',P.cantidad from 
cliente C
Left Join pedido P
ON C.id_cliente=P.id_cliente
WHERE p.cantidad>1 and p.precio_total>100


--6.	Listar la cantidad y el precio de cada producto que hayan sido pedido por los clientes entre las fechas 01-01-2022 y 20-03-2022, se requiere visualizar el nombre del cliente, el nombre del producto, nombre del proveedor , cantidad y precio del producto.
SELECT C.nombre as 'Nombre Cliente',PROD.descripcion as 'Nombre Producto',PV.nombre as 'Nombre Proveedor',P.cantidad,prod.precio from pedido P 
Left JOIN cliente C
ON P.id_cliente=C.id_cliente
left join proveedor PV
ON P.id_proveedor=PV.id_proveedor
left join producto PROD
ON p.id_articulo=PROD.id_articulo
where p.fecha_pedido between '01/01/2022' and '03/20/2022'

--7.	Listar los nombres de los clientes que hayan solicitado más de un producto.
Select DISTINCT C.id_cliente,C.nombre as 'Nombre Cliente',P.cantidad from 
cliente C
Left Join pedido P
ON C.id_cliente=P.id_cliente
WHERE p.cantidad>1 


