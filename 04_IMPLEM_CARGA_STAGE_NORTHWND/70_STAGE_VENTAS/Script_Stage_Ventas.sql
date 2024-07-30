--USANDO LA BASE DE DATOS STAGE_NORTHWND
USE STAGE_NORTHWND
GO

--VALIDANDO SI EXISTE LA TABLA Stage_Ventas
IF EXISTS(SELECT NAME FROM SYS.tables WHERE NAME='Stage_Ventas')
BEGIN
	DROP TABLE Stage_Ventas
END
GO

--CREANDO LA TABLA VENTAS Stage_Ventas
CREATE TABLE [dbo].[Stage_Ventas](
	[Cliente_Codigo] [char](5) NOT NULL,
	[Empleado_Codigo] [int] NOT NULL,
	[Producto_Codigo] [int] NOT NULL,
	[Ventas_OrderDate] [datetime] NOT NULL,
	[Ventas_NOrden] [int] NOT NULL,
	[Ventas_Monto] [decimal](15, 2) NOT NULL,
	[Ventas_Unidades] [int] NOT NULL,
	[Ventas_PUnitario] [decimal](15, 2) NOT NULL,
	[Ventas_Descuento] [decimal](15, 2) NOT NULL,
	[ETLLoad] [datetime] NULL,
	[ETLExecution] [int] NULL
)
GO

--CONSULTA ORIGEN DE DATOS [LOAD_NORTHWND].[dbo].[Orders] Y [LOAD_NORTHWND].[dbo].[Order Details]
SELECT O.OrderID,
CAST(O.CustomerID AS CHAR(5)) AS CustomerID,
O.EmployeeID,
OD.ProductID,
O.OrderDate,
CAST(((OD.UnitPrice * OD.Quantity) - OD.Discount) AS decimal(15,2)) AS Total,
OD.Quantity,
OD.UnitPrice,
OD.Discount
FROM [LOAD_NORTHWND].[dbo].[Orders] O INNER JOIN [LOAD_NORTHWND].[dbo].[Order Details] OD
ON O.OrderID = OD.OrderID 


--CREANDO LA TABLA [LOAD_NORTHWND].[dbo].[Orders]
SELECT * FROM [LOAD_NORTHWND].[dbo].[Orders]
GO

--CREANDO LA TABLA [LOAD_NORTHWND].[dbo].[Order Details]
SELECT * FROM [LOAD_NORTHWND].[dbo].[Order Details]
GO

--SELECCIONANDO EL MAXIMO ETLExecution DE LA TABLA 
--[LOAD_NORTHWND].[dbo].[Orders] Y [LOAD_NORTHWND].[dbo].[Order Details]
DECLARE @ETLExecutionOrder int
DECLARE @ETLExecutionOrderDetail int

SET @ETLExecutionOrder =(SELECT MAX(ETLExecution) FROM [LOAD_NORTHWND].[dbo].[Orders])
SET @ETLExecutionOrderDetail = (SELECT MAX(ETLExecution) FROM [LOAD_NORTHWND].[dbo].[Order Details])

SELECT @ETLExecutionOrder, @ETLExecutionOrderDetail


--CONSULTAS LAS TABLAS PARA REALIZAR LAS COMPROBACIONES
SELECT * FROM Stage_Ventas
GO

SELECT O.OrderID,
CAST(O.CustomerID AS CHAR(5)) AS CustomerID,
O.EmployeeID,
OD.ProductID,
O.OrderDate,
CAST(((OD.UnitPrice * OD.Quantity) - OD.Discount) AS decimal(15,2)) AS Total,
OD.Quantity,
OD.UnitPrice,
OD.Discount
FROM [LOAD_NORTHWND].[dbo].[Orders] O INNER JOIN [LOAD_NORTHWND].[dbo].[Order Details] OD
ON O.OrderID = OD.OrderID 
GO

SELECT * FROM [NORTHWND_METADATA].[dbo].[ETLExecution]
GO