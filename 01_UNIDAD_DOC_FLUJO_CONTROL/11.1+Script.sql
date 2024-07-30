--Estamos activando la base de datos
use NORTHWND
go

--Selecionando la tabla products
select * from Products
go

--Selecionando la tabla Categories
select * from Categories
go

--Realizando la union de la tabla Products con la tabla Categories
SELECT P.ProductID, P.ProductName,P.CategoryID, C.CategoryName,
		P.QuantityPerUnit, P.UnitPrice, P.UnitsInStock
FROM Products AS P inner join Categories AS C
ON P.CategoryID=C.CategoryID
WHERE P.CategoryID=2
GO

--Selecionando el Maximo CategoryID de la tabla Products
SELECT MAX(CategoryID) FROM Products
GO

--Reemplazando el "/" por "_" debido a que el archivo txt no adminite caracteres especiales
SELECT Replace(CategoryName,'/','_') from Categories
Where CategoryID=5
go
