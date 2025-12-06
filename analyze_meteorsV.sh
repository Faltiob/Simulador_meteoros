#!/bin/bash
for meteor_ in *.txt; do
linea=$(head -n 1 "$meteor_")
salida=$(printf "$linea" | awk -F ',' '{printf "%s %s" $1, $2}')
read fecha hora <<< "$salida"
timestamp=$(date -d "$fecha $hora" +%s)
printf "$timestamp" >> tiempos.txt
done
sort -n tiempos.txt > tiempos_ordenados.txt
prev= > intervalos.txt
while read actual; do
if [ -n "$prev"];
then intervalo=$(( actual - prev ))
printf "$intervalo" >> intervalos.txt
fi prev=$actual
done
< tiempos_ordenados.txt
awk '{sum+=$1; count++} END {print sum/count}' intervalos.txt
