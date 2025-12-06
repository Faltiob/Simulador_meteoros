#!/bin/bash

#primero borramos todos los archivos viejos

rm -f meteor_*.txt tiempos.txt tiempos_ordenados.txt intervalos.txt stats.txt

cantidad=$(( 500 + RANDOM % 500 ))
inicio_fecha_hora="2025-12-23 22:00:00"
final_fecha_hora="2025-12-25 22:00:00"

#convertir a UTC
  inicio_hora=$( date -u -d "$inicio_fecha_hora" +%s)
  final_hora=$( date -u -d "$final_fecha_hora" +%s)
#defino en rango entre las horas
  rango=$(( final_hora - inicio_hora + 1 ))

for i in $(seq 1 "$cantidad"); do
#segundos después del inicio = sdi
  sdi=$((RANDOM % rango))
  tiempo=$(( inicio_hora + sdi ))
  hora=$(date -u -d "@$tiempo" +"%H:%M:%S")
  fecha=$(date -u -d "@$tiempo" +"%Y-%m-%d")
  duracion_seg=$(awk -v seed="$RANDOM" 'BEGIN{srand(seed); printf("%.2f", 0.1 + rand()*4.9)}')
  altura_grados=$(awk -v seed="$RANDOM" 'BEGIN{srand(seed); printf("%.2f", 10.0 + rand()*90.0)}')
  acimut_grados=$(awk -v seed="$RANDOM" 'BEGIN{srand(seed); printf("%.2f", 0.0 + rand()*359.0)}')
printf "%s, %s, %s, %s, %s\n" "$fecha" "$hora" "$duracion_seg" "$altura_grados" "$acimut_grados" > "meteor_$i.txt"
done



