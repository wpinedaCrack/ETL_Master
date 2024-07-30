--UTILIZANDO LA BASE DE DATOS AdventureWorksDW2016
use AdventureWorksDW2016
go

--REALIZANDO EL QUERY
SELECT
FirstName+' '+LastName AS Name,
HireDate,
BirthDate,
EmailAddress,
Phone
FROM DimEmployee
