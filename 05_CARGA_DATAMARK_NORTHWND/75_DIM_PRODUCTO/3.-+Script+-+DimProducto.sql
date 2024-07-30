--DIM PRODUCTO

--Origen de Datos [STAGE_NORTHWND].[dbo].[Stage_Producto]
SELECT [Producto_Codigo]
      ,[Producto_Nombre]
      ,[Producto_PUnitario]
      ,[CategoriaProducto_Codigo]
      ,[ProveedorNombre]
FROM [STAGE_NORTHWND].[dbo].[Stage_Producto]
ORDER BY [Producto_Codigo]


--Origen de Datos [DATAMART_NORTHWND].[dbo].[Dim_Producto]
SELECT [Producto_SKey]
      ,[Producto_Codigo]
      ,[Producto_Nombre]
      ,[Producto_PUnitario]
      ,[Producto_Categoria_SKey]
      ,[ProveedorNombre]
FROM [DATAMART_NORTHWND].[dbo].[Dim_Producto]
ORDER BY [Producto_Codigo]


--Crear la tabla [STAGE_NORTHWND].[dbo].[Dim_Producto_Mod]
CREATE TABLE [STAGE_NORTHWND].[dbo].[Dim_Producto_Mod](
	[ProductoID] [int] IDENTITY(1,1) NOT NULL,
	[Producto_Codigo] [int] NOT NULL,
	[Producto_Nombre] [varchar](80) NOT NULL,
	[Producto_PUnitario] [decimal](15, 2) NULL,
	[Producto_Categoria_SKey] [int] NOT NULL,
	[ProveedorNombre] [varchar](40) NULL,
	[ETLLoad] [DATETIME]
)
GO


--Insertar registros en la tabla [STAGE_NORTHWND].[dbo].[Dim_Producto_Mod]
INSERT INTO [STAGE_NORTHWND].[dbo].[Dim_Producto_Mod]
([Producto_Codigo], [Producto_Nombre], [Producto_PUnitario], [Producto_Categoria_SKey], [ProveedorNombre], [ETLLoad])
VALUES
(?, ?, ?, ?, ?, GETDATE())


--Actualizar la tabla [DATAMART_NORTHWND].[dbo].[Dim_Producto]
--A partir de la tabla [STAGE_NORTHWND].[dbo].[Stage_Producto]
--Relacionado con la tabla [DATAMART_NORTHWND].[dbo].[Dim_Categoria]
UPDATE M
SET M.Producto_Nombre = S.Producto_Nombre,
	M.Producto_PUnitario = S.Producto_PUnitario,
	M.Producto_Categoria_SKey = S.CategoriaProducto_Codigo,
	M.ProveedorNombre = S.ProveedorNombre
FROM [DATAMART_NORTHWND].[dbo].[Dim_Producto] AS M
JOIN
	[STAGE_NORTHWND].[dbo].[Stage_Producto] AS S
	ON M.Producto_Codigo = S.Producto_Codigo
JOIN
	[DATAMART_NORTHWND].[dbo].[Dim_Categoria] AS C
	ON S.CategoriaProducto_Codigo = C.Categoria_Codigo
WHERE M.Producto_SKey = ?


--Realizar la "Busqueda" de la tabla Dim_Categoria
SELECT [Categoria_Codigo]
  FROM [DATAMART_NORTHWND].[dbo].[Dim_Categoria]
  ORDER BY [Categoria_Codigo]


--Realizar las consultas a las tablas
SELECT * FROM Dim_Producto

SELECT * FROM [NORTHWND_METADATA].[dbo].[ETLExecution]
ORDER BY ID

SELECT * FROM [STAGE_NORTHWND].[dbo].[Dim_Producto_Mod]