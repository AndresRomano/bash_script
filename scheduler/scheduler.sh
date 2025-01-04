#!/bin/sh
q=10
tcc=5s
#tim=2s

fecha=$(date +"%m%d%H%M")

echo "scheduler.sh en ejecución..."

while  [ true ]
do 

sleep $tcc

cd $HOME/procesos

echo $(ls|grep .proc|cut -f 1 -d '.') > procesos.txt

i=1
while read line

do

tiempo_ejecucion=$(cat $line)

if [ $tiempo_ejecucion -lt $Q ]; then

	fecha=$(date +"%Y-%m-%d-%H-%M-%S")

	echo "$fecha::Ejecutando $line($tiempo_ejecucion) durante T=$tiempo_ejecucion < Q=$Q" >> scheduler.log

	sleep $tcc

	fecha=$(date +"%Y-%m-%d-%H-%M-%S")

	echo "$fecha::o $line($tiempo_ejecucion) durante T=$tiempo_ejecucion < Q=$Q"

  
i=$(expr $i + 1)

fi

done < procesos.txt

done

