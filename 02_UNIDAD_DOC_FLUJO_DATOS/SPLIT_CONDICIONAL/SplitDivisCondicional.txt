--CONDICIONAL SPLIT

--USAR LA BASE DE DATOS [STREAMING]
USE STREAMING
GO

--VALIDANDO SI EXISTE LA TABLA EMPLEADO
IF EXISTS(SELECT NAME FROM SYS.tables WHERE NAME='Empleado')
BEGIN
	DROP TABLE Empleado
END
GO

--CREANDO LA TABLA EMPLEADOS
CREATE TABLE Empleado(
	EmpleadoID [int] NOT NULL,
	Nombre [nvarchar](50) NOT NULL,
	Apellido [nvarchar](50) NOT NULL,
	Email [nvarchar](50) NULL,
	EstadoCivil [nchar](1) NULL
)
GO

--VALIDANDO SI EXISTE LA TABLA EMPLEADO
IF EXISTS(SELECT NAME FROM SYS.tables WHERE NAME='Empleado_Temp')
BEGIN
	DROP TABLE Empleado_Temp
END
GO

--CREANDO LA TABLA EMPLEADOS
CREATE TABLE Empleado_Temp(
	EmpleadoID [int] NOT NULL,
	Nombre [nvarchar](50) NOT NULL,
	Apellido [nvarchar](50) NOT NULL,
	Email [nvarchar](50) NULL,
	EstadoCivil [nchar](1) NULL
)
GO

--VALIDANDO SI EXISTE LA TABLA EMPLEADO
IF EXISTS(SELECT NAME FROM SYS.tables WHERE NAME='Empleado_Mod')
BEGIN
	DROP TABLE Empleado_Mod
END
GO

CREATE TABLE Empleado_Mod(
	EmpleadoID [int] NOT NULL,
	Nombre [nvarchar](50) NOT NULL,
	Apellido [nvarchar](50) NOT NULL,
	Email [nvarchar](50) NULL,
	EstadoCivil [nchar](1) NULL,
	FechaRegistro DateTime
)
GO

--INSERTANDO LOS DATOS DE PRUEBA
INSERT INTO Empleado(EmpleadoID, Nombre, Apellido, Email, EstadoCivil)
VALUES
('1','Guy','Gilbert','guy1@adventure-works.com','C'),
('2','Kevin','Brown','kevin0@adventure-works.com','S'),
('3','Roberto','Tamburello','roberto0@adventure-works.com','S'),
('4','Rob','Walters','rob0@adventure-works.com','S'),
('5','Roberto','Higa','rob1@adventure-works.com','C'),
('6','Thierry','Hers','thierry0@adventure-works.com','C'),
('7','Gail','Erickson','gail0@adventure-works.com','S'),
('8','David','Bradley','david0@adventure-works.com','C'),
('9','JoLynn','Dobney','jolynn0@adventure-works.com','S'),
('10','Ruth','Ellerbrock','ruth0@adventure-works.com','S')
GO

--CONSULTANDO LA TABLA EMPLEADO
SELECT * FROM Empleado
GO

--CONSULTANDO LA TABLA EMPLEADO_TEMP
SELECT * FROM Empleado_Temp
GO

--QUERY PARA ACTUALIZAR REGISTRO
--EN LA TABLA EMPLEADO DESDE LA TABLA EMPLEADO_TEMP
UPDATE Empleado
SET Empleado.Nombre=Empleado_Temp.Nombre,
	Empleado.Apellido=Empleado_Temp.Apellido,
	Empleado.Email=Empleado_Temp.Email,
	Empleado.EstadoCivil=Empleado_Temp.EstadoCivil
FROM Empleado INNER JOIN Empleado_Temp
ON Empleado.EmpleadoID=Empleado_Temp.EmpleadoID
go

--CONSULTANDO LAS 3 TABLAS DEL EJERCICIO
SELECT * FROM Empleado
GO

SELECT * FROM Empleado_Temp
GO

SELECT * FROM Empleado_Mod
GO