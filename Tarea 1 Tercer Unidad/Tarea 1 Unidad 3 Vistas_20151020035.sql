/*Tarea 1 Unidad 3*/
Use Northwind;

/*VISTAS*/
--1.Cree una vista que muestre todos los empleados (employees) que reportan (ReportsTo) a un jefe.
CREATE VIEW Subordinado as
select * from Employees where ReportsTo >0;

/* 2.Crear una vista que muestre el ProductID, CompanyName, ProductName, CategoryName, Description, 
QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, 
Discontinued de la tabla Supplier, products and Categories.*/

CREATE VIEW Reporte_Productos as
select P.ProductID, S.CompanyName, P.ProductName, C.CategoryName, C.Description, 
P.QuantityPerUnit, P.UnitPrice, P.UnitsInStock, P.UnitsOnOrder, P.ReorderLevel, 
P.Discontinued from Products P
left join Suppliers S
on P.SupplierID=S.SupplierID
left join Categories C
on P.CategoryID=C.CategoryID;

/* 3.Cree una vista que muestre el CustomerID, CompanyName, ContactName, 
ContactTitle, Address, City, Country, Phone, OrderDate, RequiredDate, 
ShippedDate de la table Customer y Orders*/

CREATE VIEW OredenesdeCliente as
Select C.CustomerID, C.CompanyName, C.ContactName, 
C.ContactTitle, C.Address, C.City, C.Country, C.Phone, O.OrderDate, O.RequiredDate, 
ShippedDate from Customers C
left join Orders O
on C.CustomerID=O.CustomerID

/* 4.Modifique la vista del item 3 y remueva el campo Campo ContactTitle*/

Alter VIEW OredenesdeCliente as
Select C.CustomerID, C.CompanyName, C.ContactName, 
 C.Address, C.City, C.Country, C.Phone, O.OrderDate, O.RequiredDate, 
ShippedDate from Customers C
left join Orders O
on C.CustomerID=O.CustomerID

/*5.Elimine la vista del Item 3*/

Drop view  OredenesdeCliente;