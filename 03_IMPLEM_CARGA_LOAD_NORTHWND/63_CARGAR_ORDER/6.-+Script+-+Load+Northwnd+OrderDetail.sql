--CREANDO LA TABLA [Order Details]
CREATE TABLE [dbo].[Order Details](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Quantity] [smallint] NOT NULL,
	[Discount] [real] NOT NULL,
	ETLLoad DATETIME,
	ETLExecution INT
)
GO

--CONSULTANDO LA TABLA [Order Details]
SELECT * FROM [Order Details]
GO

--CONSULTANDO LA TABLA ETLExecution
SELECT * FROM [NORTHWND_METADATA].[dbo].[ETLExecution]
GO