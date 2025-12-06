#!/bin/bash
for i in {1..999}; do
  printf "meteor_$i.txt"
done
inicio_fecha_hora="2025-12-24 22:00:00"
final_fecha_hora="2025-12-26 22:00:00"

#convertir a UTC
  inicio_hora=$( date -u -d "$inicio_fecha_hora" +%s)
  final_hora=$( date -u -d "$final_fecha_hora" +%s)
#defino en rango entre las horas
  rango=$(( final_hora - inicio_hora + 1 ))
for i in $(seq 1 999); do
#segundos después del inicio= sdi
  sdi=$((RANDOM % rango))
  tiempo=$(( inicio_hora + sdi )
hora=$(date -u -d "@$tiempo" +"%H:%M:%S"
fecha=$(date -u -d "@$tiempo" +"%Y-%m-%d"

for i in $(seq 1 999); do
  hora=$(random_datetime)
  fecha=$(random_date "$inicio_fecha" "$final_fecha")
  printf ""$fecha", "$hora"" > "meteor_$i.txt"
done


