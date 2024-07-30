--USAR LA BASE DE DATOS [AdventureWorksDW2016]
USE AdventureWorksDW2016
GO
--SELECCIONAR LAS PRIMERAS 1000 FILAS PARA EL EJERCICIO
SELECT TOP 1000 [FirstName]
      ,[LastName]
      ,[BirthDate]
      ,[Gender]
      ,[EmailAddress]
      ,[YearlyIncome]
      ,[EnglishEducation]
      ,[Phone]
FROM [AdventureWorksDW2016].[dbo].[DimCustomer]