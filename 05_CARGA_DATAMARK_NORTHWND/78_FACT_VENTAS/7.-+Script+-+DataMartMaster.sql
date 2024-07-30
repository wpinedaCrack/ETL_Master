--USAR LA BASE DE DATOS DATAMART_NORTHWND
USE DATAMART_NORTHWND
GO

------------------------------------------------------------------------
--CONSULTANDO LA TABLA Dim_Empleado Y ETLExecution
------------------------------------------------------------------------
SELECT * FROM Dim_Empleado
GO

SELECT * FROM [NORTHWND_METADATA].[dbo].[ETLExecution]
ORDER BY ID DESC
GO


------------------------------------------------------------------------
--CONSULTANDO LA TABLA Dim_Categoria Y ETLExecution
------------------------------------------------------------------------
SELECT * FROM Dim_Categoria
GO

SELECT * FROM [NORTHWND_METADATA].[dbo].[ETLExecution]
ORDER BY ID DESC
GO


------------------------------------------------------------------------
--CONSULTANDO LA TABLA Dim_Producto Y ETLExecution
------------------------------------------------------------------------
SELECT * FROM Dim_Producto
GO

SELECT * FROM [NORTHWND_METADATA].[dbo].[ETLExecution]
ORDER BY ID DESC
GO


------------------------------------------------------------------------
--CONSULTANDO LA TABLA Dim_Cliente Y ETLExecution
------------------------------------------------------------------------
SELECT * FROM Dim_Cliente
GO

SELECT * FROM [NORTHWND_METADATA].[dbo].[ETLExecution]
ORDER BY ID DESC
GO


------------------------------------------------------------------------
--CONSULTANDO LA TABLA Dim_Tiempo Y ETLExecution
------------------------------------------------------------------------
SELECT * FROM Dim_Tiempo
GO

SELECT * FROM [NORTHWND_METADATA].[dbo].[ETLExecution]
ORDER BY ID DESC
GO


------------------------------------------------------------------------
--CONSULTANDO LA TABLA Fact_Ventas Y ETLExecution
------------------------------------------------------------------------
SELECT * FROM Fact_Ventas
GO

SELECT * FROM [NORTHWND_METADATA].[dbo].[ETLExecution]
ORDER BY ID DESC
GO

------------------------------------------------------------------------