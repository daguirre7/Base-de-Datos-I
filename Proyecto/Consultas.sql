/*A) Consultas*/
USE Farmacia;
--i. Edad promedio de los clientes
select AVG(CASE WHEN DATEADD(yy,DATEDIFF(YEAR,fecha_nacimiento,GETDATE()),fecha_nacimiento)<GETDATE() then DATEDIFF(YEAR,fecha_nacimiento,GETDATE())
			else DATEDIFF(YEAR,fecha_nacimiento,GETDATE())-1
		   END) as Edad_Promedio from cliente

--ii. 10 productos más vendidos
select top(10) id_producto, sum(cantidad_productos)as Cantidad from ordencompra 
group by id_producto order by sum(cantidad_productos) desc  

--iii. Cantidad de productos por categoría
SELECT C.descripcion, SUM(B.cantidad)as Cantidad_por_Categoría from categoria C
left join
(
	select p.id_categoria,i.Cantidad from productos p
	left join(
		Select id_producto,sum(unidades_existencia)as Cantidad from inventario group by id_producto
	) i
	on i.id_producto=p.id_producto
) B
on C.id_categoria=B.id_categoria
Group by C.descripcion

--iv. Listar los productos más bajos en ventas
select p.nombreproducto, sum(C.cantidad_productos)as Cantidad from productos p
left join
 ordencompra C
on C.id_producto=P.id_producto
group by p.nombreproducto order by sum(cantidad_productos) asc

--v. Listado de productos agrupados por categoría*/
SELECT C.id_categoria,C.descripcion, P.id_producto,p.nombreproducto FROM productos P
FULL OUTER join
 categoria c
 ON p.id_categoria=c.id_categoria

