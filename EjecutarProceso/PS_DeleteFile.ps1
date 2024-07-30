$Ruta = "D:/UdemyFull/BaseDatos/SISS_CERO_EXPERTO/EjecutarProceso/"
$Archivo = "Reporte_Cliente.txt"

$Ruta+$Archivo

if( Test-Path($Ruta+$Archivo) )
{
    Remove-Item($Ruta+$Archivo)
}


