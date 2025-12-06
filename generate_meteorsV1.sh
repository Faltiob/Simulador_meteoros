#!/bin-7bash
for i in {1..999}; do
  printf "meteor_$i.txt"
done

random_date() {
  inicio="$1"
  final="$2"
#convertimos las fechas a segundos
  inicio_seg=$( date -d "$inicio" +%s)
  final_seg=$( date -d "$final" +%s)
#pasarlo a dias
  inicio_dias=$(( inicio_seg / 86400))
  final_dias=$(( final_seg / 86400))
#defino el rango entre las fechas
  rango_dias=$(( final_dias - inicio_dias + 1 ))
#dias aleatorios entre el rango
  fecha_random=$(( inicio_dias + (RANDOM % rango_dias) ))
#de vuelta a fecha y hora
  date -u -d "@$(( fecha_random * 86400))" +"%Y-%m-%d"
}
inicio_fecha="2025-12-23"
final_fecha="2025-12-25"

for i in {1..999}; do
  fecha=$(random_date "$inicio_fecha" "$final_fecha")
  printf "$fecha" > "meteor_$i.txt"
done

inicio_fecha_hora="2025-12-24 22:00:00"
final_fecha_hora="2025-12-26 22:00:00"

#randomizar la hora
random_datetime() {
#convertir a UTC
  inicio_hora=$( date -u -d "$inicio_fecha_hora" +%s)
  final_hora=$( date -u -d "$final_fecha_hora" +%s)
#defino en rango entre las horas
  rango_horas=$(( final_hora - inicio_hora + 1 ))
#hora aleatoria entre el rango
  hora_random=$(( inicio_hora + RANDOM % rango_horas ))
#horas, minutos, segundos
  date -u -d "@$hora_random" +"%H:%M:%S"
}
for i in $(seq 1 999); do
  hora=$(random_datetime)
  fecha=$(random_date "$inicio_fecha" "$final_fecha")
  printf ""$fecha", "$hora"" > "meteor_$i.txt"
done

