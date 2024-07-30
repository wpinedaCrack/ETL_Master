--OLE DB COMAND

--USANDO LA BASE DE DATOS [STREAMING]
USE STREAMING
GO

IF EXISTS(SELECT NAME FROM SYS.TABLES WHERE NAME='Geografia')
BEGIN
	DROP TABLE Geografia
END
GO

CREATE TABLE [dbo].[Geografia](
	GeografiaID [int]NOT NULL,
	Ciudad [nvarchar](30) NULL,
	CodigoEstado [nvarchar](3) NULL,
	NombreEstado [nvarchar](50) NULL,
	CodigoPais [nvarchar](3) NULL,
	NombrePais [nvarchar](50) NULL,
	PostalCode [nvarchar](15) NULL
)
GO


--CONSULTA ORIGENES DE DATOS DE TABLA [DimGeography]
--DE LA BASE DE DATOS [AdventureWorksDW2016]
SELECT 
GeographyKey,
City,
StateProvinceCode,
StateProvinceName,
CountryRegionCode,
EnglishCountryRegionName,
PostalCode
FROM [AdventureWorksDW2016].[dbo].[DimGeography]
GO

--INSERTAR REGISTROS EN LA TABLA Geografia
INSERT INTO Geografia(GeografiaID,Ciudad,CodigoEstado,NombreEstado,CodigoPais,NombrePais,PostalCode)
			VALUES(?,?,?,?,?,?,?)

--CONSULTANDO LA TABLA Geografia
SELECT * FROM Geografia
GO

--ORIGEN DE DATOS PARA EL OLE DB COMAND UPDATE
SELECT 
GeographyKey,
SpanishCountryRegionName
FROM [AdventureWorksDW2016].[dbo].[DimGeography]
GO

--ACTUALIZANDO REGISTRO DE LA TABLA Geografia
UPDATE Geografia
SET NombrePais=?
WHERE GeografiaID=?

--CONSULTANDO LA TABLA Geografia
SELECT * FROM Geografia
GO

--ORIGEN DE DATOS PARA EL OLE DB COMAND DELETE
SELECT 
GeographyKey
FROM [AdventureWorksDW2016].[dbo].[DimGeography]
WHERE CountryRegionCode='US'
GO

--ELIMINANDO REGISTRO DE LA TABLA Geografia
DELETE FROM Geografia
WHERE GeografiaID=?

--CONSULTANDO LA TABLA Geografia
SELECT * FROM Geografia
GO