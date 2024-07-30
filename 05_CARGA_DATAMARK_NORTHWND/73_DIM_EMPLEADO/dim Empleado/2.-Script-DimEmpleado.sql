--DIM EMPLADO

--Origen de Datos [STAGE_NORTHWND].[dbo].[Stage_Empleado]
SELECT [Empleado_Codigo]
      ,[Empleado_NombreCompleto]
      ,[Empleado_Direccion]
      ,[Empleado_Ciudad]
      ,[Empleado_Region]
      ,[Empleado_Pais]
FROM [STAGE_NORTHWND].[dbo].[Stage_Empleado]
ORDER BY [Empleado_Codigo]


--Origen de Datos [DATAMART_NORTHWND].[dbo].[Dim_Empleado]
SELECT [Empleado_SKey]
      ,[Empleado_Codigo]
      ,[Empleado_NombreCompleto]
      ,[Empleado_Direccion]
      ,[Empleado_Ciudad]
      ,[Empleado_Region]
      ,[Empleado_Pais]
FROM [DATAMART_NORTHWND].[dbo].[Dim_Empleado]
ORDER BY Empleado_Codigo


--Crear la tabla [STAGE_NORTHWND].[dbo].[Dim_Empleado_Mod]
CREATE TABLE [STAGE_NORTHWND].[dbo].[Dim_Empleado_Mod](
	[IDEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[Empleado_Codigo] [int] NOT NULL,
	[Empleado_NombreCompleto] [varchar](70) NOT NULL,
	[Empleado_Direccion] [varchar](120) NULL,
	[Empleado_Ciudad] [varchar](15) NULL,
	[Empleado_Region] [varchar](15) NULL,
	[Empleado_Pais] [varchar](15) NULL,
	[ETLLoad] DATETIME
)
GO


--Insertar registros en la tabla [STAGE_NORTHWND].[dbo].[Dim_Empleado_Mod]
INSERT INTO [STAGE_NORTHWND].[dbo].[Dim_Empleado_Mod]
([Empleado_Codigo], [Empleado_NombreCompleto], [Empleado_Direccion], [Empleado_Ciudad], [Empleado_Region], [Empleado_Pais], [ETLLoad])
VALUES
(?, ?, ?, ?, ?, ?, GETDATE())


--Actualizar la tabla [DATAMART_NORTHWND].[dbo].[Dim_Empleado]
--A partir de la tabla [STAGE_NORTHWND].[dbo].[Stage_Empleado]
UPDATE M
SET M.Empleado_NombreCompleto = S.Empleado_NombreCompleto,
	M.Empleado_Direccion = S.Empleado_Direccion,
	M.Empleado_Ciudad = S.Empleado_Ciudad,
	M.Empleado_Region = S.Empleado_Region,
	M.Empleado_Pais = S.Empleado_Pais
FROM [DATAMART_NORTHWND].[dbo].[Dim_Empleado] AS M
JOIN
	[STAGE_NORTHWND].[dbo].[Stage_Empleado] AS S
	ON M.Empleado_Codigo = S.Empleado_Codigo
WHERE M.Empleado_SKey = ?


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
SELECT * FROM Dim_Empleado

SELECT * FROM [NORTHWND_METADATA].[dbo].[ETLExecution]

SELECT * FROM [STAGE_NORTHWND].[dbo].[Dim_Empleado_Mod]