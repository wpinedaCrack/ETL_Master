--DIM CATEGORIA

--Origen de Datos [STAGE_NORTHWND].[dbo].[Stage_Categoria]
SELECT
	[Categoria_Codigo],
	[Categoria_Nombre]
FROM [STAGE_NORTHWND].[dbo].[Stage_Categoria]
ORDER BY [Categoria_Codigo]


--Origen de Datos [DATAMART_NORTHWND].[dbo].[Dim_Categoria]
SELECT [Categoria_SKey]
      ,[Categoria_Codigo]
      ,[Categoria_Nombre]
FROM [DATAMART_NORTHWND].[dbo].[Dim_Categoria]
ORDER BY [Categoria_Codigo]


--Crear la tabla [STAGE_NORTHWND].[dbo].[Dim_Categoria_Mod]
CREATE TABLE [STAGE_NORTHWND].[dbo].[Dim_Categoria_Mod](
	[CategoriaID] [int] IDENTITY(1,1) NOT NULL,
	[Categoria_Codigo] [int] NOT NULL,
	[Categoria_Nombre] [varchar](15) NOT NULL,
	[ETLLoad] [DATETIME]
)
GO


--Insertar registros en la tabla [STAGE_NORTHWND].[dbo].[Dim_Categoria_Mod]
INSERT INTO [STAGE_NORTHWND].[dbo].[Dim_Categoria_Mod]
([Categoria_Codigo], [Categoria_Nombre], [ETLLoad])
VALUES
(?, ?, GETDATE())


--Actualizar la tabla [DATAMART_NORTHWND].[dbo].[Dim_Categoria]
--A partir de la tabla [STAGE_NORTHWND].[dbo].[Stage_Categoria]
UPDATE M
SET M.Categoria_Nombre = S.Categoria_Nombre
FROM [DATAMART_NORTHWND].[dbo].[Dim_Categoria] AS M
JOIN
	[STAGE_NORTHWND].[dbo].[Stage_Categoria] AS S
	ON M.Categoria_Codigo = S.Categoria_Codigo
WHERE M.Categoria_SKey = ?


--Insertar registros en Northwnd_Metadata en la tabla ETLExecution
INSERT INTO ETLExecution(UserName, MachineName, PackageName, ETLLoad)
				VALUES(?,?,?,GETDATE())


--Obtener el último ID de la tabla ETLExecution
SELECT TOP(1) ID FROM ETLExecution
WHERE PackageName = ?
ORDER BY ID DESC


--Actualizar la tabla ETLExecution
UPDATE ETLExecution
SET [ETLCountNewRegister] = ?,
	[ETLCountModifiedRegister] = ?
WHERE ID = ?


--Actualizar la tabla ETLExecution
UPDATE ETLExecution
SET [ETLCountRows]=([ETLCountNewRegister]+[ETLCountModifiedRegister])
WHERE ID = ?


--Realizar las consultas a las tablas
SELECT * FROM Dim_Categoria

SELECT * FROM [NORTHWND_METADATA].[dbo].[ETLExecution]
ORDER BY ID

SELECT * FROM [STAGE_NORTHWND].[dbo].[Dim_Categoria_Mod]