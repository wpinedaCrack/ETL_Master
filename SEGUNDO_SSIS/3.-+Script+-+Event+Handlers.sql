--USAR LA BASE DE DATOS [NORTHWND]
use NORTHWND
go

--DATOS DE LOS EMPLEADOS DE LA TABLA Employees
select 
FirstName AS Nombre, LastName AS Apellido,
Country AS Pais, City AS Ciudad,
BirthDate AS FechaNacimiento, HireDate AS FechaContratacion
from Employees
go

UPDATE Employees
SET FirstName=UPPER(FirstName),
	LastName=UPPER(LastName),
	Country=UPPER(Country),
	City=UPPER(City)
GO