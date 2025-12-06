
#simulacion de lluvia de meteoros

Este proyecto genera una simulacion de lluvia de meteoros, con un total de 999 meteoros

esta dividido en 2 partes/2 scripts

generate_meteors.sh
-Genera entre 500 a 999 archivos de texto que representan los meteoros que cayeron en nuestra lluvia simulada
-Son generados dentro de un intervalo de tiempo de 2 dias exactos
-Se les otorgo 5 datos generados de manera random, los cuales fueron:fecha, hora, duración_seg, altura_grados, azimut_grados

analyze_meteors.sh
-Lee los archivos meteors_*.txt
-Extrae la fecha y hora de cada evento
-Ordena los eventos cronologicamente y calcula el promedio en los intervalos de tiempo entre eventos
-Guarda el resultado en un archivo stats.txt
