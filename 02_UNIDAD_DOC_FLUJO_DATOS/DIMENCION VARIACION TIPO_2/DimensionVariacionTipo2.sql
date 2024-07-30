--DIVISION DE VARIACION LENTA - TIPO 2

--USANDO LA BASE DE DATOS [STREAMING]
USE STREAMING
GO

--VALIDANDO SI EXISTE LA TABLA Empleado
IF EXISTS(SELECT NAME FROM SYS.tables WHERE NAME ='DimEmpleado2')
BEGIN
	DROP TABLE DimEmpleado2
END
GO

--CREANDO LA TABLA Empleado
CREATE TABLE DimEmpleado2(
	EmpleadoID [int] NOT NULL,
	Nombre [nvarchar](50) NULL,
	Apellido [nvarchar](50) NULL,
	FechaNacimiento [date] NULL,
	Email [nvarchar](50) NULL,
	Telefono [nvarchar](25) NULL,
	FechaInicio [date] NULL,
	FechaFin [date] NULL
)
GO

--INSERTANDO REGISTROS A LA TABLA Empleado
INSERT INTO DimEmpleado2(EmpleadoID,Nombre,Apellido,FechaNacimiento,Email,Telefono,FechaInicio,FechaFin)
		VALUES
(1,'Guy','Gilbert','1981-11-12','guy1@adventure-works.com','320-555-0195','2006-01-28',Null),
(2,'Kevin','Brown','1986-12-01','kevin0@adventure-works.com','150-555-0189','2006-08-26',Null),
(3,'Roberto','Tamburello','1974-06-12','roberto0@adventure-works.com','212-555-0187','2007-06-11',Null),
(4,'Rob','Walters','1974-07-23','rob0@adventure-works.com','612-555-0100','2007-07-05',Null),
(5,'Rob','Walters','1974-07-23','rob0@adventure-works.com','612-555-0100','2009-12-28',Null),
(6,'Thierry','Hers','1959-02-26','thierry0@adventure-works.com','168-555-0183','2007-07-11',Null),
(7,'David','Bradley','1974-10-17','david0@adventure-works.com','913-555-0172','2007-07-20',Null),
(8,'David','Bradley','1974-10-17','david0@adventure-works.com','913-555-0172','2009-02-12',Null),
(9,'JoLynn','Dobney','1955-08-16','jolynn0@adventure-works.com','903-555-0145','2007-07-26',Null),
(10,'Wen','Ellerbrock','1956-01-03','ruth0@adventure-works.com','145-555-0130','2007-08-06',Null)
GO


--VALIDANDO SI EXISTE LA TABLA EmpleadoOrigen
IF EXISTS(SELECT NAME FROM SYS.tables WHERE NAME ='EmpleadoOrigenTipo2')
BEGIN
	DROP TABLE EmpleadoOrigenTipo2
END
GO

--CREANDO LA TABLA EmpleadoOrigen
CREATE TABLE EmpleadoOrigenTipo2(
	EmpleadoID [int] NOT NULL,
	Nombre [nvarchar](50) NULL,
	Apellido [nvarchar](50) NULL,
	FechaNacimiento [date] NULL,
	Email [nvarchar](50) NULL,
	Telefono [nvarchar](25) NULL,
	FechaInicio [date] NULL,
	FechaFin [date] NULL
)
GO

--INSERTANDO REGISTROS A LA TABLA EmpleadoOrigen
INSERT INTO EmpleadoOrigenTipo2(EmpleadoID,Nombre,Apellido,FechaNacimiento,Email,Telefono,FechaInicio,FechaFin)
		VALUES
(1,'Guy','Gilbert','1981-11-12','guy1@adventure-works.com','320-555-0195','2006-01-28',Null),
(2,'Kevin','Brown','1986-12-01','kevin0@adventure-works.com','150-555-0189','2006-08-26',Null),
(3,'Roberto','Tamburello','1974-06-12','roberto0@adventure-works.com','212-555-0187','2007-06-11',Null),
(4,'Rob','Walters','1974-07-23','rob0@adventure-works.com','612-555-0100','2007-07-05',Null),
(5,'Rob','Walters','1974-07-23','rob0@adventure-works.com','612-555-0100','2009-12-28',Null),
(6,'Thierry','Hers','1959-02-26','thierry0@adventure-works.com','168-555-0183','2007-07-11',Null),
(7,'David','Bradley','1974-10-17','david0@adventure-works.com','913-555-0172','2007-07-20',Null),
(8,'David','Bradley','1974-10-17','david0@adventure-works.com','913-555-0172','2009-02-12',Null),
(9,'JoLynn','Dobney','1955-08-16','jolynn0@adventure-works.com','903-555-0145','2007-07-26',Null),
(10,'Wen','Ellerbrock','1956-01-03','ruth0@adventure-works.com','145-555-0130','2007-08-06',Null),
(11,'Gail','Erickson','1952-04-27','gail0@adventure-works.com','849-555-0139','2007-08-06',Null)
GO


--CONSULTANDO LAS TABLAS
SELECT * FROM DimEmpleado2
GO

SELECT * FROM EmpleadoOrigenTipo2
GO

--ACTUALIZAR EL NOMBRE CON EL EmpleadoID=10
UPDATE EmpleadoOrigenTipo2
SET Nombre='Ivana'
WHERE EmpleadoID=10
GO

--ACTUALIZAR EL APELLIDO CON EL EmpleadoID=10
UPDATE EmpleadoOrigenTipo2
SET Apellido='Bradley'
WHERE EmpleadoID=10
GO