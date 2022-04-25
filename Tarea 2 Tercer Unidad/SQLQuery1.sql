/*Triggers/Disparadores*/
USE Northwind;

/*1. Cree un trigger que se active cuando se inserte o actualice un registro de la tabla
Territories recuerde tomar el registro actual desde la tabla inserted y concatene al
nombre del Territorio (TerritoryDescription) el prefijo “_try” al final del mismo.*/

CREATE TRIGGER trconcat
on Territories
after insert, update
as
BEGIN
	update t
	set t.territorydescription=concat('_try',i.TerritoryDescription)
	from Territories as T
	inner join inserted as i
	on t.TerritoryID=i.TerritoryID
END

INSERT INTO Territories values('98105','ok',4);

--Select * from Territories;


/*2. Cree un trigger para la tabla CustomerCustomerDemo que se active cuando se
inserte o actualice un registro y calcule el campo CustomerDesc multiplicando el
valor proveído en el insert * 0.25 y sumando 150*/
--alter table [dbo].[CustomerDemographics] alter column CustomerDesc nvarchar(150)
CREATE TRIGGER trcalculo
on CustomerDemographics
after insert,update
as
BEGIN
	update C
	set C.CustomerDesc=(i.CustomerDesc*0.25)+150
	from CustomerDemographics as C
	inner join inserted as i
	on C.CustomerTypeID=i.CustomerTypeID
END

INSERT INTO CustomerDemographics values(123,'100');

/*3. Cree un trigger a la tabla CusomerDemogragraphics que se active cuando un
registro es eliminado y que muestre un mensaje que diga “registro eliminado” y
muestre un select de la tabla deleted.*/

CREATE TRIGGER treliminar
on CustomerDemographics
for delete
as
BEGIN
	Select * from deleted
	print('Registo Eliminado')
END

delete CustomerDemographics where CustomerTypeID='asd'

/*Funciones*/
/*1. Construya una función que reciba como parámetro el año de contratación de
un empleado (HireDate) de la tabla employees y devuelva una tabla con todos
los registros asociados.*/

CREATE FUNCTION aocontratacion(@ao varchar(4))
Returns table
as
return (Select * from Employees where year(HireDate)=@ao)

Select * from dbo.aocontratacion(1992)


/*2. Cree una función que reciba como parámetro el id de la tabla producto
(products) y retorne el precio (UnitPrice) aplicando el 10% de descuento.*/

CREATE FUNCTION fpreciounit(@id int)
Returns table
as
return (Select UnitPrice from Products where ProductID=@id)

Select * from dbo.fpreciounit(2)


/*3. Cree una función que reciba como parámetro el OrderId y muestre información
de la orden (Order) y de su detalle (Order Details) mostrando ProductName,
UnitPrice y Quantitiy, OrderDate, CustomerID.*/

CREATE FUNCTION fdetalleorden(@id int)
Returns table
as
return (Select O.OrderID,O.OrderDate,O.CustomerID,P.ProductName,OD.UnitPrice,OD.Quantity from Orders O 
		left join [Order Details] OD
		on O.OrderID=OD.OrderID
		left join Products P
		on OD.ProductID=P.ProductID
		where O.OrderID=@id)

Select * from dbo.fdetalleorden(10249)

/*4. Construya una función que reciba la fecha de nacimiento (BirthDate) de un
empleado (Employees) y retorne el nombre del mes en el que nació el
empleado considere el uso de la sentencia case.*/

CREATE FUNCTION fmesnac(@fecha date)
Returns varchar(50)
as
begin
 declare @fn varchar(50)
 Select @fn= CASE WHEN month(BirthDate)=1 THEN 'ENERO'
				  WHEN month(BirthDate)=2 THEN 'FEBRERO'
				  WHEN month(BirthDate)=3 THEN 'MARZO'
				  WHEN month(BirthDate)=4 THEN 'ABRIL'
				  WHEN month(BirthDate)=5 THEN 'MAYO'
				  WHEN month(BirthDate)=6 THEN 'JUNIO'
				  WHEN month(BirthDate)=7 THEN 'JULIO'
				  WHEN month(BirthDate)=8 THEN 'AGOSTO'
				  WHEN month(BirthDate)=9 THEN 'SEPTIEMBRE'
				  WHEN month(BirthDate)=10 THEN 'OCTUBRE'
				  WHEN month(BirthDate)=11 THEN 'NOVIEMBRE'
				  WHEN month(BirthDate)=12 THEN 'DICIEMBRE'		  
				  END
				  from Employees  
		where CONVERT(DATE,BirthDate) =@fecha
	RETURN @fn
end

Select dbo.fmesnac('1952-02-19') as 'Mes de Nacimiento'


/*5. Construya una función que reciba el código de un cliente y retorne todos los
pedidos (Orders) ordenados por fecha.*/

CREATE FUNCTION fpedidosC(@idC nchar(5))
Returns table
as
return (Select * from Orders where CustomerID =@idC) 
		
Select * from dbo.fpedidosC('SUPRD') order by OrderDate