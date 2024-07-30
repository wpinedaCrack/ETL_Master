--DIVISION DE VARIACION LENTA - TIPO 1

--USANDO LA BASE DE DATOS [STREAMING]
USE STREAMING
GO

--VALIDANDO SI EXISTE LA TABLA Cliente
IF EXISTS(SELECT NAME FROM SYS.tables WHERE NAME ='Cliente')
BEGIN
	DROP TABLE Cliente
END
GO

--CREANDO LA TABLA Cliente
CREATE TABLE Cliente(
	ClienteID [int] NOT NULL,
	Nombre [nvarchar](50) NULL,
	Apellido [nvarchar](50) NULL,
	FechaNacimiento [date] NULL,
	Email [nvarchar](50) NULL,
	Direccion [nvarchar](120) NULL
)
GO

--INSERTANDO REGISTROS A LA TABLA Cliente
INSERT INTO Cliente(ClienteID,Nombre,Apellido,FechaNacimiento,Email,Direccion)
		VALUES
(11000,'Jon','Yang','1971-10-06','jon24@adventure-works.com','3761 N. 14th St'),
(11001,'Eugene','Huang','1976-05-10','eugene10@adventure-works.com','2243 W St.'),
(11002,'Ruben','Torres','1971-02-09','ruben35@adventure-works.com','5844 Linden Land'),
(11003,'Christy','Zhu','1973-08-14','christy12@adventure-works.com','1825 Village Pl.'),
(11004,'Elizabeth','Johnson','1979-08-05','elizabeth5@adventure-works.com','7553 Harness Circle'),
(11005,'Julio','Ruiz','1976-08-01','julio1@adventure-works.com','7305 Humphrey Drive'),
(11006,'Janet','Alvarez','1976-12-02','janet9@adventure-works.com','2612 Berry Dr'),
(11007,'Marco','Mehta','1969-11-06','marco14@adventure-works.com','942 Brook Street'),
(11008,'Rob','Verhoff','1975-07-04','rob4@adventure-works.com','624 Peabody Road'),
(11009,'Marco','Carlson','1969-09-29','shannon38@adventure-works.com','3839 Northgate Road')
GO


--VALIDANDO SI EXISTE LA TABLA ClienteOrigen
IF EXISTS(SELECT NAME FROM SYS.tables WHERE NAME ='ClienteOrigen')
BEGIN
	DROP TABLE ClienteOrigen
END
GO

--CREANDO LA TABLA ClienteOrigen
CREATE TABLE ClienteOrigen(
	ClienteID [int] NOT NULL,
	Nombre [nvarchar](50) NULL,
	Apellido [nvarchar](50) NULL,
	FechaNacimiento [date] NULL,
	Email [nvarchar](50) NULL,
	Direccion [nvarchar](120) NULL
)
GO

--INSERTANDO REGISTROS A LA TABLA ClienteOrigen
INSERT INTO ClienteOrigen(ClienteID,Nombre,Apellido,FechaNacimiento,Email,Direccion)
		VALUES
(11000,'Jon','Yang','1971-10-06','jon24@adventure-works.com','3761 N. 14th St'),
(11001,'Eugene','Huang','1976-05-10','eugene10@adventure-works.com','2243 W St.'),
(11002,'Ruben','Torres','1971-02-09','ruben35@adventure-works.com','5844 Linden Land'),
(11003,'Christy','Zhu','1973-08-14','christy12@adventure-works.com','1825 Village Pl.'),
(11004,'Elizabeth','Johnson','1979-08-05','elizabeth5@adventure-works.com','7553 Harness Circle'),
(11005,'Julio','Ruiz','1976-08-01','julio1@adventure-works.com','7305 Humphrey Drive'),
(11006,'Janet','Alvarez','1976-12-02','janet9@adventure-works.com','2612 Berry Dr'),
(11007,'Marco','Mehta','1969-11-06','marco14@adventure-works.com','942 Brook Street'),
(11008,'Rob','Verhoff','1975-07-04','rob4@adventure-works.com','624 Peabody Road'),
(11009,'Marco','Carlson','1969-09-29','shannon38@adventure-works.com','3839 Northgate Road'),
(11010,'Jacquelyn','Suarez','1969-08-05','jacquelyn20@adventure-works.com','7800 Corrinne Court')
GO


--CONSULTANDO LAS TABLAS
SELECT * FROM Cliente
GO

SELECT * FROM ClienteOrigen
GO