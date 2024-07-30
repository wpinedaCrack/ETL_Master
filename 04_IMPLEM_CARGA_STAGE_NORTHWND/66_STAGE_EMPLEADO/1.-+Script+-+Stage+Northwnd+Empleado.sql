--USANDO LA BASE DE DATOS STAGE_NORTHWND
USE STAGE_NORTHWND
GO

--VALIDANDO SI EXISTE LA TABLA Stage_Empleado
IF EXISTS(SELECT NAME FROM SYS.tables WHERE NAME='Stage_Empleado')
BEGIN
	DROP TABLE Stage_Empleado
END
GO

--CREANDO LA TABLA [Stage_Empleado]
CREATE TABLE [dbo].[Stage_Empleado](
	[Empleado_Codigo] [int] NOT NULL,
	[Empleado_Apellido] [varchar](40) NOT NULL,
	[Empleado_Nombre] [varchar](20) NULL,
	[Empleado_NombreCompleto] [varchar](70) NOT NULL,
	[Empleado_Direccion] [varchar](120) NULL,
	[Empleado_Ciudad] [varchar](15) NULL,
	[Empleado_Region] [varchar](15) NULL,
	[Empleado_Pais] [varchar](15) NULL,
	[Empleado_Postal] [varchar](10) NULL,
	[ETLLoad] [datetime] NULL,
	[ETLExecution] [int] NULL
)
GO

--CONSULTA ORIGEN DE DATOS [Load_Northwnd].[dbo].[Employees]
SELECT [EmployeeID]
      ,CAST([LastName] AS VARCHAR(40)) AS LastName
      ,CAST([FirstName] AS VARCHAR(20)) AS FirstName
	  ,(CAST([LastName] AS VARCHAR(40)) +', '+CAST([FirstName] AS VARCHAR(20))) AS Name
      ,CAST([Address] AS VARCHAR(120)) AS Address
      ,CAST([City] AS VARCHAR(15)) AS City
      ,CAST([Region] AS VARCHAR(15)) AS Region
      ,CAST([Country] AS VARCHAR(15)) AS Country
	  ,CAST([PostalCode] AS VARCHAR(10)) AS PostalCode
FROM [Load_Northwnd].[dbo].[Employees]
GO

--INSERTANDO REGISTRO EN EL METADATA
INSERT INTO ETLExecution(UserName, MachineName, PackageName, ETLLoad)
			Values(?,?,?,GETDATE())

--OBTENIENDO EL ULTIMO ID DEL METADATA
SELECT TOP(1) ID FROM ETLExecution
WHERE PackageName=?
Order By ID Desc

--ACTUALIZAR LA CANTIDAD DE FILAS EN LA METADATA
UPDATE ETLExecution
SET ETLCountRows=?
WHERE ID=?


--CONSULTANDO LA TABLA [LOAD_NORTHWND].[dbo].[Employees]
--ORDENADO POR EL ETLExecution
SELECT * FROM [LOAD_NORTHWND].[dbo].[Employees]
ORDER BY ETLExecution DESC

--OBTENER EL MAXIMO ETLExecution DE LA TABLA [LOAD_NORTHWND].[dbo].[Employees]
SELECT MAX(ETLExecution) FROM [LOAD_NORTHWND].[dbo].[Employees]


--CONSULTAS LAS TABLAS PARA REALIZAR LAS COMPROBACIONES
SELECT * FROM Stage_Empleado
GO

SELECT * FROM [LOAD_NORTHWND].[dbo].[Employees]
ORDER BY ETLExecution DESC
GO

SELECT * FROM [NORTHWND_METADATA].[dbo].[ETLExecution]
ORDER BY ID DESC
GO