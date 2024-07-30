--FACT VENTAS

--Origen de Datos [STAGE_NORTHWND].[dbo].[Stage_Ventas]
SELECT MC.Cliente_SKey
      ,ME.Empleado_SKey
      ,MP.Producto_SKey
	  ,MT.Tiempo_Skey
      ,SV.[Ventas_NOrden]
      ,SV.[Ventas_Monto]
      ,SV.[Ventas_Unidades]
      ,SV.[Ventas_PUnitario]
      ,SV.[Ventas_Descuento]
  FROM [STAGE_NORTHWND].[dbo].[Stage_Ventas] AS SV
    JOIN
		[DATAMART_NORTHWND].[dbo].[Dim_Cliente] AS MC
		ON SV.Cliente_Codigo = MC.Cliente_Codigo
	JOIN
		[DATAMART_NORTHWND].[dbo].[Dim_Empleado] AS ME
		ON SV.Empleado_Codigo = ME.Empleado_Codigo
	JOIN
		[DATAMART_NORTHWND].[dbo].[Dim_Producto] AS MP
		ON SV.Producto_Codigo = MP.Producto_Codigo
	JOIN
		[DATAMART_NORTHWND].[dbo].[Dim_Tiempo] as MT
		ON MT.Tiempo_FechaActual = SV.Ventas_OrderDate
ORDER BY MC.Cliente_SKey, ME.Empleado_SKey, MP.Producto_SKey, MT.Tiempo_Skey, SV.[Ventas_NOrden]


--Origen de Datos [DATAMART_NORTHWND].[dbo].[Fact_Ventas]
SELECT Cliente_SKey, 
		Empleado_SKey, 
		Producto_SKey, 
		Tiempo_SKey, 
		Ventas_NOrden, 
		Ventas_Monto, 
		Ventas_Unidades, 
		Ventas_PUnitario, 
		Ventas_Descuento
FROM [DATAMART_NORTHWND].[dbo].[Fact_Ventas]
ORDER BY Cliente_SKey, Empleado_SKey, Producto_SKey, Tiempo_SKey, Ventas_NOrden


--Realizando la busqueda con la dimension Dim_Cliente
SELECT [Cliente_SKey]
FROM [DATAMART_NORTHWND].[dbo].[Dim_Cliente]
ORDER BY [Cliente_SKey]

--Realizando la busqueda con la dimension Dim_Empleado
SELECT [Empleado_SKey]
FROM [DATAMART_NORTHWND].[dbo].[Dim_Empleado]
ORDER BY [Empleado_SKey]

--Realizando la busqueda con la dimension Dim_Producto
SELECT [Producto_SKey]
FROM [DATAMART_NORTHWND].[dbo].[Dim_Producto]
ORDER BY [Producto_SKey]

--Realizando la busqueda con la dimension Dim_Tiempo
SELECT [Tiempo_Skey]
FROM [DATAMART_NORTHWND].[dbo].[Dim_Tiempo]
ORDER BY [Tiempo_Skey]


--Crear la tabla [STAGE_NORTHWND].[dbo].[Fact_Ventas_Mod]
CREATE TABLE [STAGE_NORTHWND].[dbo].[Fact_Ventas_Mod](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Cliente_SKey] [int] NOT NULL,
	[Empleado_SKey] [int] NOT NULL,
	[Producto_SKey] [int] NOT NULL,
	[Tiempo_Skey] [int] NOT NULL,
	[Ventas_NOrden] [int] NOT NULL,
	[Ventas_Monto] [decimal](15, 2) NOT NULL,
	[Ventas_Unidades] [int] NOT NULL,
	[Ventas_PUnitario] [decimal](15, 2) NOT NULL,
	[Ventas_Descuento] [decimal](15, 2) NOT NULL,
	[ETLLoad] [DATETIME]
)

--Insertar registros en la tabla [STAGE_NORTHWND].[dbo].[Fact_Ventas_Mod]
INSERT INTO [STAGE_NORTHWND].[dbo].[Fact_Ventas_Mod]
([Cliente_SKey], [Empleado_SKey], [Producto_SKey], [Tiempo_Skey], [Ventas_NOrden], [Ventas_Monto], [Ventas_Unidades], [Ventas_PUnitario], [Ventas_Descuento], [ETLLoad])
VALUES
(?, ?, ?, ?, ?, ?, ?, ?, ?, GETDATE())


--Actualizar la tabla [DATAMART_NORTHWND].[dbo].[Fact_Ventas]
UPDATE M
SET M.Ventas_Monto = SVEN.Ventas_Monto,
	M.Ventas_Unidades = SVEN.Ventas_Unidades,
	M.Ventas_PUnitario = SVEN.Ventas_PUnitario,
	M.Ventas_Descuento = SVEN.Ventas_Descuento
FROM [DATAMART_NORTHWND].[dbo].[Fact_Ventas] AS M
JOIN
	[DATAMART_NORTHWND].[dbo].[Dim_Empleado] AS DEMP
	ON M.Empleado_SKey = DEMP.Empleado_SKey
JOIN 
	[STAGE_NORTHWND].[dbo].[Stage_Empleado] AS SEMP
	ON SEMP.Empleado_Codigo = DEMP.Empleado_Codigo
JOIN
	[DATAMART_NORTHWND].[dbo].[Dim_Producto] AS DPRO
	ON M.Producto_SKey = DPRO.Producto_SKey
JOIN
	[STAGE_NORTHWND].[dbo].[Stage_Producto] AS SPRO
	ON DPRO.Producto_Codigo = SPRO.Producto_Codigo
JOIN
	[DATAMART_NORTHWND].[dbo].[Dim_Cliente] AS DCLI
	ON M.Cliente_SKey = DCLI.Cliente_SKey
JOIN
	[STAGE_NORTHWND].[dbo].[Stage_Cliente] AS SCLI
	ON DCLI.Cliente_Codigo = SCLI.Cliente_Codigo
JOIN
	[DATAMART_NORTHWND].[dbo].[Dim_Tiempo] AS MTIE
	ON M.Tiempo_Skey = MTIE.Tiempo_Skey
JOIN
	[STAGE_NORTHWND].[dbo].[Stage_Tiempo] AS STIE
	ON MTIE.Tiempo_FechaActual = STIE.Tiempo_FechaActual
JOIN
	[STAGE_NORTHWND].[dbo].[Stage_Ventas] AS SVEN
	ON M.Ventas_NOrden = SVEN.Ventas_NOrden
WHERE
(M.Cliente_SKey = ? AND 
M.Empleado_SKey = ? AND 
M.Producto_SKey = ? AND 
M.Tiempo_SKey = ? AND
M.Ventas_NOrden = ?)


--Realizar las consultas a las tablas
SELECT * FROM Fact_Ventas

SELECT * FROM [NORTHWND_METADATA].[dbo].[ETLExecution]

SELECT * FROM [STAGE_NORTHWND].[dbo].[Fact_Ventas_Mod]
