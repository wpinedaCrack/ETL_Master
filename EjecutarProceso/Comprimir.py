import gzip

input = open("D:/UdemyFull/BaseDatos/SISS_CERO_EXPERTO/EjecutarProceso/Reporte_Cliente.txt",'rb')
s=input.read()
input.close()

output = gzip.GzipFile("D:/UdemyFull/BaseDatos/SISS_CERO_EXPERTO/EjecutarProceso/Comprimido/Reporte_Cliente.txt.gz",'wb')
output.write(s)
output.close()

print("Done")