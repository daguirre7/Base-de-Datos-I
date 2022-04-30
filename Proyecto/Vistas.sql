/*b) Vistas*/
--i. Reporte mensual de ventas por sucursal
CREATE VIEW Reporte_MensualVentasSucursal as
SELECT DATENAME (MONTH,C.fecha_compra)as Mes,C.id_farmacia as 'Sucursal',sum((C.cantidad_productos*P.precio_venta))as 'Total Ventas' FROM ordencompra C
left join productos P
on P.id_producto=C.id_producto
Group by DATENAME (MONTH,C.fecha_compra),C.id_farmacia

--ii. Reporte de ventas mensual por producto
CREATE VIEW Reporte_MensualVentasProducto as
SELECT DATENAME (MONTH,C.fecha_compra)as Mes,C.id_producto as 'Producto',sum((C.cantidad_productos*P.precio_venta))as 'Total Ventas' FROM ordencompra C
left join productos P
on P.id_producto=C.id_producto
Group by DATENAME (MONTH,C.fecha_compra),C.id_producto


--iii. Total ventas por categoría
CREATE VIEW Reporte_VentasCategoria as
SELECT P.id_categoria as 'Categoría',sum((C.cantidad_productos*P.precio_venta))as 'Total Ventas' FROM ordencompra C
left join productos P
on P.id_producto=C.id_producto
Group by P.id_categoria

--iv. Productos en el inventario con cantidad menor que 10 unidades por sucursal
CREATE VIEW Reporte_InventarioMenorDiez as
SELECT id_farmacia,id_producto,unidades_existencia FROM inventario 
WHERE unidades_existencia <10

--v. Listado de clientes que no han realizado ningún pedido durante el mes
CREATE VIEW Reporte_ClientesSinPedidos as
SELECT id_cliente,nombre,telefonos FROM cliente 
WHERE id_cliente NOT IN (SELECT id_cliente FROM ordencompra WHERE MONTH(fecha_compra)=MONTH(GETDATE()))


