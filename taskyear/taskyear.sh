#!/bin/bash


#SLEEP_TIME=120s
SLEEP_TIME=10s
fecha=$(date +"%m%d%H%M")

#agenda.txt contiene las tareas a ejecutar
#last_wakeup.tx contiene la ultima vez que despertó sin tareas
#taskyear.log contiene los datos de la ultima tarea realizada (hora y tarea)

echo "taskyear.sh en ejecución"

while  [ true ]
do
 
sleep $SLEEP_TIME

echo "taskyear.sh durmiendo..."

tarea_a_ejecutar=$(cat agenda.txt |grep $(date +"%m%d%H%M") )
 
Horatarea=$(echo $tarea_a_ejecutar | cut -f1 -d';') 

comando_tarea=$(echo $tarea_a_ejecutar | cut -f2 -d';')

ejecutatar_tarea="$comando_tarea"

fecha=$(date +"%Y-%m-%d-%H-%M")

otrafecha=$(date +"%Y-%m-%d-%H-%M-%S")

hicealgo=0

if [[ "$comando_tarea"  == "" ]] ; then
	hicealgo=1
	else
	echo "$otrafecha::$comando_tarea"  >> taskyear.log
fi

if [ $hicealgo -eq '0' ]; then
	echo $fecha >> last_wakeup.txt
	hicealgo=0
fi

if [[ "$ejecutatar_tarea"  != "" ]] ; then

	echo "Ejecutando: $ejecutatar_tarea"
	$ejecutatar_tarea
fi

done 

