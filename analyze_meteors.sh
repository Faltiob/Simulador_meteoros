#!/bin/bash

#crea un archivo tiempos.txt vacio
> tiempos.txt
#recorre todos los archivos meteor
for meteor_ in meteor*.txt; do
  linea=$(head -n 1 "$meteor_")
#extrae fecha y hora y limpia espacios
  salida=$(printf "%s" "$linea" | awk -F ',' '{gsub(/^ *| *$/, "", $1); gsub(/^ *| *$/, "", $2); printf "%s %s", $1, $2}')
  read fecha hora <<< "$salida"
  fecha=$(printf "%s" "$fecha" | xargs)
  hora=$(printf "%s" "$hora"| xargs)
#convierte fecha y hora timestamp para luego guardarlo
  timestamp=$(date -d "$fecha $hora" +%s)
printf "%s\n" "$timestamp" >> tiempos.txt
done
#ordena los tiempos
sort -n tiempos.txt > tiempos_ordenados.txt
prev=""
> intervalos.txt
#calcular intervalos
while read actual; do
  if [ -n "$prev" ]; then
	intervalo=$(( actual - prev ))
	printf "%s\n" "$intervalo" >> intervalos.txt
  fi
  prev=$actual
done < tiempos_ordenados.txt
#contar archivos y calcular el promedio de intervalos
cantidad_meteoros=$(printf "%s\n" meteor_*.txt | awk 'END{print NR+0}')
promedio=$(awk '{sum+=$1; count++} END {if(count>0) print sum/count; else print 0}' intervalos.txt)
printf "Cantidad de meteoros: %s\n" "$cantidad_meteoros" > stats.txt
printf "Tiempo promedio entre meteoros (en segundos): %s\n" "$promedio" >> stats.txt

