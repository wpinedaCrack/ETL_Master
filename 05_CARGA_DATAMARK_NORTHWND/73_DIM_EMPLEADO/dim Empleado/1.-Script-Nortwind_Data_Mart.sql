USE master
GO

IF EXISTS(SELECT NAME FROM SYS.databases WHERE NAME='DATAMART_NORTHWND')
BEGIN
	DROP DATABASE DATAMART_NORTHWND
END
GO

CREATE DATABASE DATAMART_NORTHWND
GO

USE DATAMART_NORTHWND
GO

/****** Object:  Table [dbo].[Dim_Categoria]    Script Date: 31/03/2020 20:35:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dim_Categoria](
	[Categoria_SKey] [int] IDENTITY(1,1) NOT NULL,
	[Categoria_Codigo] [int] NOT NULL,
	[Categoria_Nombre] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Dim_Categoria] PRIMARY KEY CLUSTERED 
(
	[Categoria_SKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dim_Cliente](
	[Cliente_SKey] [int] IDENTITY(1,1) NOT NULL,
	[Cliente_Codigo] [char](5) NOT NULL,
	[Cliente_Nombre] [varchar](40) NOT NULL,
	[Cliente_Compania] [varchar](40) NULL,
	[Cliente_Direccion] [varchar](60) NULL,
	[Cliente_Ciudad] [varchar](15) NULL,
	[Cliente_Region] [varchar](25) NULL,
	[Cliente_Pais] [varchar](15) NULL,
 CONSTRAINT [PK_Dim_Cliente] PRIMARY KEY CLUSTERED 
(
	[Cliente_SKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dim_Empleado](
	[Empleado_SKey] [int] IDENTITY(1,1) NOT NULL,
	[Empleado_Codigo] [int] NOT NULL,
	[Empleado_NombreCompleto] [varchar](70) NOT NULL,
	[Empleado_Direccion] [varchar](120) NULL,
	[Empleado_Ciudad] [varchar](15) NULL,
	[Empleado_Region] [varchar](15) NULL,
	[Empleado_Pais] [varchar](15) NULL,
 CONSTRAINT [PK_Dim_Empleado] PRIMARY KEY CLUSTERED 
(
	[Empleado_SKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dim_Tiempo](
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
	[Tiempo_SemanaCalendario] [int] NOT NULL,
	[Tiempo_SemanasDelAñoLaborales] [int] NOT NULL,
	[Tiempo_AñoBisiesto] [tinyint] NOT NULL,
 CONSTRAINT [PK_Dim_Tiempo] PRIMARY KEY CLUSTERED 
(
	[Tiempo_Skey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dim_Producto](
	[Producto_SKey] [int] IDENTITY(1,1) NOT NULL,
	[Producto_Codigo] [int] NOT NULL,
	[Producto_Nombre] [varchar](80) NOT NULL,
	[Producto_PUnitario] [decimal](15, 2) NULL,
	[Producto_Categoria_SKey] [int] NOT NULL,
	[ProveedorNombre] [varchar](40) NULL,
 CONSTRAINT [PK_Dim_Producto] PRIMARY KEY CLUSTERED 
(
	[Producto_SKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Dim_Producto]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Producto_Dim_Categoria] FOREIGN KEY([Producto_Categoria_SKey])
REFERENCES [dbo].[Dim_Categoria] ([Categoria_SKey])
GO

ALTER TABLE [dbo].[Dim_Producto] CHECK CONSTRAINT [FK_Dim_Producto_Dim_Categoria]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Fact_Ventas](
	[Cliente_SKey] [int] NOT NULL,
	[Empleado_SKey] [int] NOT NULL,
	[Producto_SKey] [int] NOT NULL,
	[Tiempo_Skey] [int] NOT NULL,
	[Ventas_NOrden] [int] NOT NULL,
	[Ventas_Monto] [decimal](15, 2) NOT NULL,
	[Ventas_Unidades] [int] NOT NULL,
	[Ventas_PUnitario] [decimal](15, 2) NOT NULL,
	[Ventas_Descuento] [decimal](15, 2) NOT NULL,
 CONSTRAINT [PK_Fact_Ventas] PRIMARY KEY CLUSTERED 
(
	[Cliente_SKey] ASC,
	[Empleado_SKey] ASC,
	[Producto_SKey] ASC,
	[Tiempo_Skey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Fact_Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Ventas_Dim_Cliente] FOREIGN KEY([Cliente_SKey])
REFERENCES [dbo].[Dim_Cliente] ([Cliente_SKey])
GO

ALTER TABLE [dbo].[Fact_Ventas] CHECK CONSTRAINT [FK_Fact_Ventas_Dim_Cliente]
GO

ALTER TABLE [dbo].[Fact_Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Ventas_Dim_Empleado] FOREIGN KEY([Empleado_SKey])
REFERENCES [dbo].[Dim_Empleado] ([Empleado_SKey])
GO

ALTER TABLE [dbo].[Fact_Ventas] CHECK CONSTRAINT [FK_Fact_Ventas_Dim_Empleado]
GO

ALTER TABLE [dbo].[Fact_Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Ventas_Dim_Producto] FOREIGN KEY([Producto_SKey])
REFERENCES [dbo].[Dim_Producto] ([Producto_SKey])
GO

ALTER TABLE [dbo].[Fact_Ventas] CHECK CONSTRAINT [FK_Fact_Ventas_Dim_Producto]
GO

ALTER TABLE [dbo].[Fact_Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Ventas_Dim_Tiempo] FOREIGN KEY([Tiempo_Skey])
REFERENCES [dbo].[Dim_Tiempo] ([Tiempo_Skey])
GO

ALTER TABLE [dbo].[Fact_Ventas] CHECK CONSTRAINT [FK_Fact_Ventas_Dim_Tiempo]
GO
