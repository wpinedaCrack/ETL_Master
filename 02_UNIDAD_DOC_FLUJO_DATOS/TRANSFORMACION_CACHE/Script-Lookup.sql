--USAR LA BASE DE DATOS [AdventureWorksDW2016]
USE AdventureWorksDW2016
GO

--CONSULTA LOOKUP
SELECT CountryRegionCode, EnglishCountryRegionName, 
		StateProvinceName, City, IpAddressLocator
 FROM DimGeography
GO
