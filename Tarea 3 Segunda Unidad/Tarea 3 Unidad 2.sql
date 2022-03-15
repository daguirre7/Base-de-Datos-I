USE Northwind;

--Ejercicio #1: Genere una consulta SQL de la tabla Employees a través de la cual se listen los 
--atributos FirstName(Primer Nombre), LastName (Apellido), HireDate (fecha contratación) de
--los empleados que tengan como título : Sales Representative y su país sea USA.

SELECT FirstName as 'Primer Nombre', LastName as 'Apellido', convert(varchar,HireDate,6) as 'Fecha  Contratación' FROM Employees
WHERE Title ='Sales Representative' and Country ='USA' 

--Ejercicio #2: Cree una consulta SQL de la tabla Products listando los productos junto con
--todas sus columnas donde el ProductName incluya la palabra Chocolate como parte de su nombre.

SELECT * FROM Products
WHERE ProductName like '%Chocolate%'

--Ejercicio #3: Obtener todos los registros de la tabla Orders donde el ShipCountry sea
--Germany, France, Brazil y Venezuela.

SELECT * FROM Orders
WHERE ShipCountry IN('Germany','France','Brazil','Venezuela')

--Ejercicio #4: Obtenga el número total de Customers y coloque el nombre TotalCustomers a la
--columna que contiene el resultado.

SELECT count(CustomerID)as 'Total Customers' FROM Customers

--Ejercicio #5: Agrupe y liste los paises de la tabla Customers utilizando el campo Country.

SELECT DISTINCT Country FROM Customers

--Ejercicio #6: Construya una consulta donde se muestran los datos de las tablas Products y
--Suppliers renombrandolas como P y S , es necesario conocer el ProductID, ProductName y
--CompanyName ordenando el resultado por el ProductID.

SELECT P.ProductID, P.ProductName, S.CompanyName
FROM Products P
INNER JOIN Suppliers S
 ON P.SupplierID=S.SupplierID
ORDER BY P.ProductID

--Ejercicio #7: Obtenga los registros de la tabla Products donde UnitsInStock sea menor a
--ReorderLevel, obteniendo el ProductName, UnitsInStock, ReorderLevel.

SELECT ProductName, UnitsInStock, ReorderLevel FROM  Products
WHERE UnitsInStock < ReorderLevel;

--Ejercicio #8: Obtenga todos los registros de la tabla Products donde la suma de UnitsInStock
--+ UnitsOnOrder sea menor o igual a ReorderLevel y el producto no esté descontinuado es
--necesario mostrar ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued.


SELECT ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued,(UnitsInStock+UnitsOnOrder)as'Suma' FROM Products 
WHERE (UnitsInStock+UnitsOnOrder)<=ReorderLevel AND Discontinued=0


--Ejercicio #9: Muestre la lista de productos de la tabla Products donde UnitPrice esté entre
--entre 15.00 y 25.00

SELECT * FROM Products
WHERE UnitPrice BETWEEN 15.00 AND 25.00

--Ejercicio #10: Liste todos los Suppliers donde en número de fax es null

SELECT * FROM Suppliers
WHERE Fax IS NULL

--Ejercicio #11: Obtener el promedio de la tabla Orders de los valores de la tabla Freight


SELECT AVG(Freight)AS 'Promedio' FROM Orders

--Ejercicio # 12: Actualizar en la tabla Customer el ContactName del registro con id= 20 y
--Colocar su nombre

select * from Customers

UPDATE Customers
SET ContactName='David Aguirre'
where CustomerID=20

--Ejercicio #13 : Eliminar de la tabla Customer el registro con id=91

DELETE from Customers where CustomerID=91

--Ejercicio #14: Visualizar el maximo y minimo precio de los productos

SELECT MAX(UnitPrice)AS 'Máximo Precio',MIN(UnitPrice)as'Mínimo Precio' FROM Products