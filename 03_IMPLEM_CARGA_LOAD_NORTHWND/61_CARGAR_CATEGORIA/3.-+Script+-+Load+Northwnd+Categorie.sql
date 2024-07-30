--CREANDO LA TABLA [Categories]
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [nvarchar](15) NOT NULL,
	[Description] [ntext] NULL,
	[Picture] [image] NULL,
	ETLLoad DATETIME,
	ETLExecution int
)

--CONSULTANDO LA TABLA Categories
SELECT * FROM Categories
GO

--CONSULTANDO LA TABLA ETLExecution
SELECT * FROM [NORTHWND_METADATA].[dbo].[ETLExecution]
GO