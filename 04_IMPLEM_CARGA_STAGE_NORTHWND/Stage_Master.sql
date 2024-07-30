--USAR LA BASE DE DATOS STAGE_NORTHWND
USE STAGE_NORTHWND
GO

------------------------------------------------------------------------
--CONSULTANDO LA TABLA Stage_Empleado Y ETLExecution
------------------------------------------------------------------------
SELECT * FROM Stage_Empleado
GO

SELECT * FROM [NORTHWND_METADATA].[dbo].[ETLExecution]
ORDER BY ID DESC
GO


------------------------------------------------------------------------
--CONSULTANDO LA TABLA Stage_Producto Y ETLExecution
------------------------------------------------------------------------
SELECT * FROM Stage_Producto
GO

SELECT * FROM [NORTHWND_METADATA].[dbo].[ETLExecution]
ORDER BY ID DESC
GO


------------------------------------------------------------------------
--CONSULTANDO LA TABLA Stage_Categoria Y ETLExecution
------------------------------------------------------------------------
SELECT * FROM Stage_Categoria
GO

SELECT * FROM [NORTHWND_METADATA].[dbo].[ETLExecution]
ORDER BY ID DESC
GO


------------------------------------------------------------------------
--CONSULTANDO LA TABLA Stage_Cliente Y ETLExecution
------------------------------------------------------------------------
SELECT * FROM Stage_Cliente
GO

SELECT * FROM [NORTHWND_METADATA].[dbo].[ETLExecution]
ORDER BY ID DESC
GO


------------------------------------------------------------------------
--CONSULTANDO LA TABLA Stage_Ventas Y ETLExecution
------------------------------------------------------------------------
SELECT * FROM Stage_Ventas
GO

SELECT * FROM [NORTHWND_METADATA].[dbo].[ETLExecution]
ORDER BY ID DESC
GO


------------------------------------------------------------------------
--CONSULTANDO LA TABLA Stage_Tiempo Y ETLExecution
------------------------------------------------------------------------
SELECT * FROM Stage_Tiempo
GO

SELECT * FROM [NORTHWND_METADATA].[dbo].[ETLExecution]
ORDER BY ID DESC
GO

------------------------------------------------------------------------