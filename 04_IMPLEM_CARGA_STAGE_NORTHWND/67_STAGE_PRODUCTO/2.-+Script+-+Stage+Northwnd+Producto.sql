--USANDO LA BASE DE DATOS STAGE_NORTHWND
USE STAGE_NORTHWND
GO

--VALIDANDO SI EXISTE LA TABLA Stage_Producto
IF EXISTS(SELECT NAME FROM SYS.tables WHERE NAME='Stage_Producto')
BEGIN
	DROP TABLE Stage_Producto
END
GO

--CREANDO LA TABLA Stage_Producto
CREATE TABLE [dbo].[Stage_Producto](
	[Producto_Codigo] [int] NOT NULL,
	[Producto_Nombre] [varchar](50) NOT NULL,
	[Producto_PUnitario] [decimal](15, 2) NULL,
	[CategoriaProducto_Codigo] [int] NOT NULL,
	[ProveedorNombre] [varchar](40) NULL,
	[ETLLoad] [datetime] NULL,
	[ETLExecution] [int] NULL
)
GO


--CONSULTA ORIGEN DE DATOS [Load_Northwnd].[dbo].[Products]
SELECT [ProductID]
      ,CAST([ProductName] AS VARCHAR(50)) AS ProductName
      ,CAST([UnitPrice] AS DECIMAL(15,2)) AS UnitPrice
	  ,[CategoryID]
	  ,'NORTHWND' Proveedor
FROM [Load_Northwnd].[dbo].[Products]


--INSERTANDO REGISTRO EN EL METADATA
INSERT INTO ETLExecution(UserName, MachineName, PackageName,ETLLoad)
			VALUES(?,?,?,GETDATE())


--OBTENIENDO EL ULTIMO ID DEL METADATA
SELECT TOP(1) ID FROM ETLExecution
WHERE PackageName=?
ORDER BY ID Desc


--ACTUALIZAR LA CANTIDAD DE FILAS EN LA METADATA
UPDATE ETLExecution
SET ETLCountRows = ?
WHERE ID = ?


--LIMPIAR LA TABLA Stage_Producto
TRUNCATE TABLE Stage_Producto


--OBTENER EL MAXIMO ETLExecution DE LA TABLA [LOAD_NORTHWND].[dbo].[Products]
SELECT MAX(ETLExecution) FROM [LOAD_NORTHWND].[dbo].[Products]


--CONSULTAS LAS TABLAS PARA REALIZAR LAS COMPROBACIONES
SELECT * FROM Stage_Producto
GO

SELECT * FROM [LOAD_NORTHWND].[dbo].[Products]
GO

SELECT * FROM [NORTHWND_METADATA].[dbo].[ETLExecution]
GO