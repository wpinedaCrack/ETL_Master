--DIVISION DE VARIACION LENTA - TIPO 2

--USANDO LA BASE DE DATOS [STREAMING]
USE STREAMING
GO

--VALIDANDO SI EXISTE LA TABLA Empleado
IF EXISTS(SELECT NAME FROM SYS.tables WHERE NAME ='DimEmpleado')
BEGIN
	DROP TABLE DimEmpleado
END
GO

--CREANDO LA TABLA Empleado
CREATE TABLE DimEmpleado(
	EmpleadoID [int] NOT NULL,
	Nombre [nvarchar](50) NULL,
	Apellido [nvarchar](50) NULL,
	FechaNacimiento [date] NULL,
	Email [nvarchar](50) NULL,
	Telefono [nvarchar](25) NULL
)
GO

--INSERTANDO REGISTROS A LA TABLA Empleado
INSERT INTO DimEmpleado(EmpleadoID,Nombre,Apellido,FechaNacimiento,Email,Telefono)
		VALUES
(1,'Guy','Gilbert','1981-11-12','guy1@adventure-works.com','320-555-0195'),
(2,'Kevin','Brown','1986-12-01','kevin0@adventure-works.com','150-555-0189'),
(3,'Roberto','Tamburello','1974-06-12','roberto0@adventure-works.com','212-555-0187'),
(4,'Rob','Walters','1974-07-23','rob0@adventure-works.com','612-555-0100'),
(5,'Rob','Walters','1974-07-23','rob0@adventure-works.com','612-555-0100'),
(6,'Thierry','Hers','1959-02-26','thierry0@adventure-works.com','168-555-0183'),
(7,'David','Bradley','1974-10-17','david0@adventure-works.com','913-555-0172'),
(8,'David','Bradley','1974-10-17','david0@adventure-works.com','913-555-0172'),
(9,'JoLynn','Dobney','1955-08-16','jolynn0@adventure-works.com','903-555-0145'),
(10,'Ruth','Ellerbrock','1956-01-03','ruth0@adventure-works.com','145-555-0130')
GO

--VALIDANDO SI EXISTE LA TABLA EmpleadoOrigen
IF EXISTS(SELECT NAME FROM SYS.tables WHERE NAME ='EmpleadoOrigen')
BEGIN
	DROP TABLE EmpleadoOrigen
END
GO

--CREANDO LA TABLA ClienteOrigen
CREATE TABLE EmpleadoOrigen(
	EmpleadoID [int] NOT NULL,
	Nombre [nvarchar](50) NULL,
	Apellido [nvarchar](50) NULL,
	FechaNacimiento [date] NULL,
	Email [nvarchar](50) NULL,
	Telefono [nvarchar](25) NULL
)
GO

--INSERTANDO REGISTROS A LA TABLA EmpleadoOrigen
INSERT INTO EmpleadoOrigen(EmpleadoID,Nombre,Apellido,FechaNacimiento,Email,Telefono)
		VALUES
(1,'Guy','Gilbert','1981-11-12','guy1@adventure-works.com','320-555-0195'),
(2,'Kevin','Brown','1986-12-01','kevin0@adventure-works.com','150-555-0189'),
(3,'Roberto','Tamburello','1974-06-12','roberto0@adventure-works.com','212-555-0187'),
(4,'Rob','Walters','1974-07-23','rob0@adventure-works.com','612-555-0100'),
(5,'Rob','Walters','1974-07-23','rob0@adventure-works.com','612-555-0100'),
(6,'Thierry','Hers','1959-02-26','thierry0@adventure-works.com','168-555-0183'),
(7,'David','Bradley','1974-10-17','david0@adventure-works.com','913-555-0172'),
(8,'David','Bradley','1974-10-17','david0@adventure-works.com','913-555-0172'),
(9,'JoLynn','Dobney','1955-08-16','jolynn0@adventure-works.com','903-555-0145'),
(10,'Ruth','Ellerbrock','1956-01-03','ruth0@adventure-works.com','145-555-0130'),
(11,'Gail','Erickson','1952-04-27','gail0@adventure-works.com','849-555-0139')
GO


--CONSULTANDO LAS TABLAS
SELECT * FROM DimEmpleado
GO

SELECT * FROM EmpleadoOrigen
GO

--ACTUALIZAR EL NOMBRE CON EL EmpleadoID=10
UPDATE EmpleadoOrigen
SET Nombre='Wen'
WHERE EmpleadoID=10
GO