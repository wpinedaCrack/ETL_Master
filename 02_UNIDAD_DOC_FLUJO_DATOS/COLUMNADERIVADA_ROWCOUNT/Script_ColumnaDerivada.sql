--DERIVE COLUMN

--USAR LA BASE DE DATOS [STREAMING]
USE STREAMING
GO

--VALIDANDO SI EXISTE LA TABLA VideoJuegos
IF EXISTS(SELECT NAME FROM SYS.tables WHERE NAME='VideoJuegos')
BEGIN
	DROP TABLE VideoJuegos
END
GO

--CREANDO LA TABLA VideoJuegos
CREATE TABLE VideoJuegos(
Cod_Archivo VARCHAR(20),
Nombres VARCHAR(100),
Año VARCHAR(4),
Edad VARCHAR(2),
Plataforma VARCHAR(50),
Juego VARCHAR(max),
Pais VARCHAR(50),
Cantidad_Registro int
)
GO

--REALIZAR LA CONSULTA A LA TABLA VideoJuegos
SELECT * FROM VideoJuegos
GO

--ACTUALIZAR LA COLUMNA Cantidad_Registro DE LA TABLA VideoJuegos
UPDATE VideoJuegos
SET Cantidad_Registro = ?
WHERE Cod_Archivo = ?

Ventas Video Juegos L001