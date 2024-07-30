--USANDO LA BASE DE DATOS STAGE_NORTHWND
USE STAGE_NORTHWND
GO

--VALIDANDO SI EXISTE LA TABLA Stage_Categoria
IF EXISTS(SELECT NAME FROM SYS.tables WHERE NAME='Stage_Categoria')
BEGIN
	DROP TABLE Stage_Categoria
END
GO

--CREANDO LA TABLA Stage_Categoria
CREATE TABLE [dbo].[Stage_Categoria](
	[Categoria_Codigo] [int] NOT NULL,
	[Categoria_Nombre] [varchar](15) NOT NULL,
	[ETLLoad] [datetime] NULL,
	[ETLExecution] [int] NULL
) ON [PRIMARY]
GO


--CONSULTA ORIGEN DE DATOS [Load_Northwnd].[dbo].[Categories]
SELECT [CategoryID]
      ,CAST([CategoryName] AS VARCHAR(15)) AS CategoryName
FROM [Load_Northwnd].[dbo].[Categories]


--CONSULTAS LAS TABLAS PARA REALIZAR LAS COMPROBACIONES
SELECT * FROM Stage_Categoria
GO

SELECT * FROM [Load_Northwnd].[dbo].[Categories]
ORDER BY ETLExecution DESC
GO

SELECT * FROM [NORTHWND_METADATA].[dbo].[ETLExecution]
ORDER BY ID DESC
GO