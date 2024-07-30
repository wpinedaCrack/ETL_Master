--AUDITAR

----ORIGEN

--USAR LA BASE DE DATOS [AdventureWorksDW2016]
USE AdventureWorksDW2016
GO

--CONSULTA PARA EL ORIGEN DE DATOS
SELECT TOP (10) 
	   [PromotionKey]
      ,[SpanishPromotionName]
      ,[DiscountPct]
      ,[SpanishPromotionType]
      ,[SpanishPromotionCategory]
      ,[MinQty]
      ,[MaxQty]
FROM [AdventureWorksDW2016].[dbo].[DimPromotion]
GO



----DESTINO

--USAR LA BASE DE DATOS [STREAMING]
USE STREAMING
GO

--VALIDANDO SI EXISTE LA TABLA Pomoción
IF EXISTS(SELECT NAME FROM SYS.tables WHERE NAME='Promocion')
BEGIN
	DROP TABLE Promocion
END
GO

--CREANDO LA TABLA PROMOCION
CREATE TABLE Promocion(
	PromocionID [int] NOT NULL,
	NombrePromocion [nvarchar](255) NULL,
	PorcentajeDescuento [float] NULL,
	TipoPromocion [nvarchar](50) NULL,
	CategoriaPromocion [nvarchar](50) NULL,
	CantidadMinima [int] NULL,
	CantidadMaxima [int] NULL,
	NombrePaquete [nvarchar](100) NULL,
	HoraEjecucion [DateTime] NULL,
	NombreMaquina [nvarchar](100) NULL,
	NombreUsuario [nvarchar](100) NULL,
	NombreTarea [nvarchar](50) NULL
)
GO


--CONSULTANDO LA TABLA Promocion
SELECT * FROM Promocion
GO