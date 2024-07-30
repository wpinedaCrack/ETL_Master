--DIM CLIENTE

--Origen de Datos [STAGE_NORTHWND].[dbo].[Stage_Cliente]
SELECT [Cliente_Codigo]
      ,[Cliente_Nombre]
      ,[Cliente_Compania]
      ,[Cliente_Direccion]
      ,[Cliente_Ciudad]
      ,[Cliente_Region]
      ,[Cliente_Pais]
FROM [STAGE_NORTHWND].[dbo].[Stage_Cliente]
ORDER BY [Cliente_Codigo]


--Origen de Datos [DATAMART_NORTHWND].[dbo].[Dim_Cliente]
SELECT [Cliente_SKey]
      ,[Cliente_Codigo]
      ,[Cliente_Nombre]
      ,[Cliente_Compania]
      ,[Cliente_Direccion]
      ,[Cliente_Ciudad]
      ,[Cliente_Region]
      ,[Cliente_Pais]
FROM [DATAMART_NORTHWND].[dbo].[Dim_Cliente]
ORDER BY [Cliente_Codigo]


--Crear la tabla [STAGE_NORTHWND].[dbo].[Dim_Cliente_Mod]
CREATE TABLE [STAGE_NORTHWND].[dbo].[Dim_Cliente_Mod](
	[ClienteID] [int] IDENTITY(1,1) NOT NULL,
	[Cliente_Codigo] [char](5) NOT NULL,
	[Cliente_Nombre] [varchar](40) NOT NULL,
	[Cliente_Compania] [varchar](40) NULL,
	[Cliente_Direccion] [varchar](60) NULL,
	[Cliente_Ciudad] [varchar](15) NULL,
	[Cliente_Region] [varchar](25) NULL,
	[Cliente_Pais] [varchar](15) NULL,
	[ETLLoad] [DATETIME] 
)
GO


--Insertar registros en la tabla [STAGE_NORTHWND].[dbo].[Dim_Cliente_Mod]
INSERT INTO [STAGE_NORTHWND].[dbo].[Dim_Cliente_Mod]
([Cliente_Codigo], [Cliente_Nombre], [Cliente_Compania], [Cliente_Direccion], [Cliente_Ciudad], [Cliente_Region], [Cliente_Pais], [ETLLoad])
VALUES
(?, ?, ?, ?, ?, ?, ?, GETDATE())


--Actualizar la tabla [DATAMART_NORTHWND].[dbo].[Dim_Cliente]
--A partir de la tabla [STAGE_NORTHWND].[dbo].[Stage_Cliente]
UPDATE  M 
SET 
M.Cliente_Nombre = S.Cliente_Nombre,
M.Cliente_Compania = S.Cliente_Compania,
M.Cliente_Direccion = S.Cliente_Direccion,
M.Cliente_Ciudad = S.Cliente_Ciudad,
M.Cliente_Region = S.Cliente_Region,
M.Cliente_Pais = S.Cliente_Pais
FROM [DATAMART_NORTHWND].[dbo].[Dim_Cliente] AS M 
JOIN 
[STAGE_NORTHWND].[dbo].[Stage_Cliente] AS S 
ON M.Cliente_Codigo = S.Cliente_Codigo
WHERE M.Cliente_SKey = ?


--Realizar las consultas a las tablas
SELECT * FROM Dim_Cliente

SELECT * FROM [NORTHWND_METADATA].[dbo].[ETLExecution]

SELECT * FROM [STAGE_NORTHWND].[dbo].[Dim_Cliente_Mod]