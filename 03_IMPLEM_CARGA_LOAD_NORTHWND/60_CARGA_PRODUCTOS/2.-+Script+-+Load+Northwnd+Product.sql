--CREANDO LA TABLA Products
CREATE TABLE [dbo].[Products](
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](40) NOT NULL,
	[SupplierID] [int] NULL,
	[CategoryID] [int] NULL,
	[QuantityPerUnit] [nvarchar](20) NULL,
	[UnitPrice] [money] NULL,
	[UnitsInStock] [smallint] NULL,
	[UnitsOnOrder] [smallint] NULL,
	[ReorderLevel] [smallint] NULL,
	[Discontinued] [bit] NOT NULL,
	ETLLoad DATETIME,
	ETLExecution int
)

--CONSULTANDO LA TABLA Products
SELECT * FROM Products
ORDER BY ETLExecution DESC
GO

--CONSULTANDO LA TABLA ETLExecution
SELECT * FROM [NORTHWND_METADATA].[dbo].[ETLExecution]
GO


--INSERTANDO REGISTROS EN LA TABLA ETLExecution
INSERT INTO ETLExecution(UserName,MachineName,PackageName,ETLLoad)
				VALUES(?,?,?,GETDATE())


--SELECCIONANDO EL ULTIMO ID
SELECT TOP(1) ID FROM ETLExecution
WHERE PackageName=?
ORDER BY ID DESC

--ACTUALIZAR LA TABLA ETLExecution
--PARA INSERTAR LA CANTIDAD DE FILAS
UPDATE ETLExecution
SET ETLCountRows=?
WHERE ID=?


