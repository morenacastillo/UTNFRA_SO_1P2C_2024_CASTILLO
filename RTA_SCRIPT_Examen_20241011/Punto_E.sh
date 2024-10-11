#!/bin/bash


ARCHIVO="../RTA_ARCHIVOS_Examen_20241011/Filtro_Basico.txt"

touch $ARCHIVO

cat /proc/meminfo | grep 'MemTotal' >> $ARCHIVO

sudo dmidecode -t chassis | head -7 | tail -2 >> $ARCHIVO

cat $ARCHIVO


