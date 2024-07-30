--USANDO LA BASE DE DATOS STAGE_NORTHWND
USE STAGE_NORTHWND
GO

--VALIDANDO SI EXISTE LA TABLA Stage_Empleado
IF EXISTS(SELECT NAME FROM SYS.tables WHERE NAME='Stage_Cliente')
BEGIN
	DROP TABLE Stage_Cliente
END
GO

--CREANDO LA TABLA Stage_Cliente
CREATE TABLE [dbo].[Stage_Cliente](
	[Cliente_Codigo] [char](5) NOT NULL,
	[Cliente_Nombre] [varchar](40) NOT NULL,
	[Cliente_Compania] [varchar](40) NULL,
	[Cliente_Direccion] [varchar](60) NULL,
	[Cliente_Ciudad] [varchar](15) NULL,
	[Cliente_Region] [varchar](15) NULL,
	[Cliente_Pais] [varchar](15) NULL,
	[Cliente_Postal] [varchar](10) NULL,
	[ETLLoad] [datetime] NULL,
	[ETLExecution] [int] NULL
)
GO


--SELECCIONANDO EL MAXIMO ETLExecution DE LA TABLA [Load_Northwnd].[dbo].[Customers]
SELECT MAX(ETLExecution) FROM [LOAD_NORTHWND].[dbo].[Customers]


--CONSULTA ORIGEN DE DATOS [Load_Northwnd].[dbo].[Employees]
SELECT CAST([CustomerID] AS CHAR(5)) AS CustomerID
      ,CAST([CompanyName] AS VARCHAR(40)) AS CompanyName
      ,CAST([ContactName] AS VARCHAR(40)) AS ContactName
      ,CAST([Address] AS VARCHAR(60)) AS Address
      ,CAST([City] AS VARCHAR(15)) AS City
      ,CAST([Region] AS VARCHAR(15)) AS Region
      ,CAST([PostalCode] AS VARCHAR(10)) AS PostalCode
      ,CAST([Country] AS VARCHAR(15)) AS Country
  FROM [Load_Northwnd].[dbo].[Customers]


--CONSULTAS LAS TABLAS PARA REALIZAR LAS COMPROBACIONES
SELECT * FROM Stage_Cliente
GO

SELECT * FROM [Load_Northwnd].[dbo].[Customers]
ORDER BY ETLExecution DESC
GO

SELECT * FROM [NORTHWND_METADATA].[dbo].[ETLExecution]
ORDER BY ID DESC
GO