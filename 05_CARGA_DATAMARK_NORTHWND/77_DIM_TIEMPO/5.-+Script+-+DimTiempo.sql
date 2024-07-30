--DIM TIEMPO

--Origen de Datos [STAGE_NORTHWND].[dbo].[Stage_Tiempo]
SELECT Tiempo_FechaActual,
		Tiempo_Anio,
		Tiempo_Trimestre,
		Tiempo_Mes,
		Tiempo_Semana,
		Tiempo_DiaDeAnio,
		Tiempo_DiaDeMes,
		Tiempo_DiaDeSemana,
		Tiempo_EsFinSemana,
		Tiempo_EsFeriado,
		Tiempo_Comentarios,
		Tiempo_SemanaCalendario,
		Tiempo_SemanasDelAñoLaborales,
		Tiempo_AñoBisiesto
FROM [STAGE_NORTHWND].[dbo].[Stage_Tiempo]
ORDER BY Tiempo_FechaActual


--Origen de Datos [DATAMART_NORTHWND].[dbo].[Dim_Tiempo]
SELECT Tiempo_Skey, 
		Tiempo_FechaActual,
		Tiempo_Anio,
		Tiempo_Trimestre,
		Tiempo_Mes,
		Tiempo_Semana,
		Tiempo_DiaDeAnio,
		Tiempo_DiaDeMes,
		Tiempo_DiaDeSemana,
		Tiempo_EsFinSemana,
		Tiempo_EsFeriado,
		Tiempo_SemanaCalendario,
		Tiempo_SemanasDelAñoLaborales,
		Tiempo_AñoBisiesto
FROM [DATAMART_NORTHWND].[dbo].[Dim_Tiempo]
ORDER BY Tiempo_FechaActual


--Realizar las consultas a las tablas
SELECT *
FROM [DATAMART_NORTHWND].[dbo].[Dim_Tiempo]
ORDER BY Tiempo_FechaActual

SELECT * FROM [NORTHWND_METADATA].[dbo].[ETLExecution] order by 1 desc