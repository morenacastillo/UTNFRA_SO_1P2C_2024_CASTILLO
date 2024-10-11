#!/bin/bash

LISTA=$1

USUARIO_VAGRANT=$(whoami)
MI_HASH=$(sudo cat /etc/shadow | grep $USUARIO_VAGRANT | awk -F ':' '{print $2}')

ANT_IFS=$IFS
IFS=$'\n'

for LINEA in `cat $LISTA |  grep -v ^#`
do
	
	GRUPO=$(echo $LINEA | awk -F ',' '{print $2}')
	USUARIO=$(echo  $LINEA | awk -F ',' '{print $1}')
	DIRECTORIO=$(echo $LINEA | awk -F ',' '{print $3}')

	echo "creo usuario: $USUARIO en grupo $GRUPO con Home: $DIRECTORIO"

	sudo groupadd $GRUPO
	sudo useradd -m -s /bin/bash -G $GRUPO -p $MI_HASH $USUARIO
	

done
IFS=$ANT_IFS





