#!/bin/bash


ARCHIVO="../RTA_ARCHIVOS_Examen_20241011/Filtro_Avanzado.txt"

touch $ARCHIVO

echo "Mi IP Publica es: $(curl -s ifconfig.me)" >> $ARCHIVO
echo "Mi Usuario es: $(whoami)" >> $ARCHIVO

HASH=$(sudo cat /etc/shadow | grep $(whoami) | awk -F ':' '{print $2}')
echo "El Hash de mi Usuario es: $HASH" >> $ARCHIVO
echo "La URL de mi repositorio es: $(git remote get-url origin)" >> $ARCHIVO


