--USANDO LA BASE DE DATOS STAGE_NORTHWND
USE STAGE_NORTHWND
GO

--VALIDANDO SI EXISTE LA TABLA Stage_Tiempo
IF EXISTS(SELECT NAME FROM SYS.tables WHERE NAME='Stage_Tiempo')
BEGIN
	DROP TABLE Stage_Tiempo
END
GO

--CREANDO LA TABLA Stage_Tiempo
CREATE TABLE [dbo].[Stage_Tiempo](
	[Tiempo_Skey] [int] IDENTITY(1,1) NOT NULL,
	[Tiempo_FechaActual] [datetime] NOT NULL,
	[Tiempo_Anio] [int] NOT NULL,
	[Tiempo_Trimestre] [int] NOT NULL,
	[Tiempo_Mes] [int] NOT NULL,
	[Tiempo_Semana] [int] NOT NULL,
	[Tiempo_DiaDeAnio] [int] NOT NULL,
	[Tiempo_DiaDeMes] [int] NOT NULL,
	[Tiempo_DiaDeSemana] [int] NOT NULL,
	[Tiempo_EsFinSemana] [int] NULL,
	[Tiempo_EsFeriado] [int] NULL,
	[Tiempo_Comentarios] [varchar](20) NULL,
	[Tiempo_SemanaCalendario] [int] NOT NULL,
	[Tiempo_SemanasDelAñoLaborales] [int] NOT NULL,
	[Tiempo_AñoBisiesto] [tinyint] NOT NULL,
	ETLLoad DATETIME,
	ETLExecution INT
)
GO


--SELECCIONANDO EL MAXIMO ETLExecution DE LA TABLA [LOAD_NORTHWND].[dbo].[Orders]
SELECT MAX(ETLExecution) FROM [LOAD_NORTHWND].[dbo].[Orders]


--CONSULTA ORIGEN DE DATOS [LOAD_NORTHWND].[dbo].Orders
SELECT Distinct(OrderDate),
		YEAR(OrderDate) AS Anio,
		DATEPART(QUARTER,OrderDate) as Trimestre,
		DATEPART(MONTH,OrderDate) as Mes,
		DATEPART(WEEK,OrderDate) as Semana,
		DATEPART(DAYOFYEAR,OrderDate) as DiaDeAnio,
		DATEPART(DAY,OrderDate) as DiaDeMes,
		DATEPART(WEEKDAY,OrderDate-1) as DiaDeSemana,
		IIF((DATEPART(WEEKDAY,OrderDate-1)=6 OR DATEPART(WEEKDAY,OrderDate-1)=7),1,0) AS EsFinSemana,
		IIF((DATEPART(MONTH,OrderDate) = 6 AND DATEPART(DAY,OrderDate) = 29) OR
			(DATEPART(MONTH,OrderDate) = 7 AND DATEPART(DAY,OrderDate) = 28) OR
			(DATEPART(MONTH,OrderDate) = 7 AND DATEPART(DAY,OrderDate) = 29) OR
			(DATEPART(MONTH,OrderDate) = 8 AND DATEPART(DAY,OrderDate) = 30) OR
			(DATEPART(MONTH,OrderDate) = 10 AND DATEPART(DAY,OrderDate) = 8) OR
			(DATEPART(MONTH,OrderDate) = 11 AND DATEPART(DAY,OrderDate) = 1) OR
			(DATEPART(MONTH,OrderDate) = 12 AND DATEPART(DAY,OrderDate) = 8) OR
			(DATEPART(MONTH,OrderDate) = 12 AND DATEPART(DAY,OrderDate) = 25)
			,1,0) AS EsFeriado,
		'1 -> (V) / 0 -> (F)' AS Comentarios,
		DATEPART(WEEK,OrderDate) as SemanaCalendario,
		DATEPART(WEEK,OrderDate) as SemanasDelAñoLaborales,
		IIF(DATEPART(DAYOFYEAR,OrderDate) = 366, 1, 0) AS AñoBisiesto
FROM [LOAD_NORTHWND].[dbo].Orders


--CONSULTAS LAS TABLAS PARA REALIZAR LAS COMPROBACIONES
SELECT * FROM Stage_Tiempo
GO

SELECT * FROM [NORTHWND_METADATA].[dbo].[ETLExecution]
GO