#!/bin/bash

LISTA=$1
MI_HASH=$(sudo cat /etc/shadow | grep $(whoami) | awk -F ':' '{print $2}')

ANT_IFS=$IFS
IFS=$'\n'

for LINEA in `cat $LISTA |  grep -v ^#`
do
	
	GRUPO=$(echo $LINEA | awk -F ',' '{print $2}')
	USUARIO=$(echo  $LINEA | awk -F ',' '{print $1}')
	DIR=$(echo $LINEA | awk -F ',' '{print $3}')

	echo "creo usuario: $USUARIO en grupo $GRUPO con Home: $DIR"

	sudo groupadd $GRUPO
	sudo useradd -m -s /bin/bash -G $GRUPO -p $MI_HASH $USUARIO

	if [[ $USUARIO = 'p1c2_2024_A1' ]];then
		sudo chmod 750 -R $DIR
		sudo chown -R $USUARIO:$USUARIO $DIR

		sudo su -c "whoami > /Examenes-UTN/alumno_1/validar.txt" $USUARIO


	elif [[ $USUARIO = 'p1c2_2024_A2' ]];then
                sudo chmod 760 -R $DIR
                sudo chown -R $USUARIO:$USUARIO $DIR
		sudo su -c "whoami > /Examenes-UTN/alumno_2/validar.txt" $USUARIO
        

	elif [[ $USUARIO = 'p1c2_2024_A3' ]];then
                sudo chmod 700 -R $DIR
                sudo chown -R $USUARIO:$USUARIO $DIR
		sudo su -c "whoami > /Examenes-UTN/alumno_3/validar.txt" $USUARIO
       

	elif [[ $USUARIO = 'p1c2_2024_P1' ]];then
                sudo chmod 775 -R $DIR
                sudo chown -R $USUARIO:$USUARIO $DIR
                sudo su -c "whoami > /Examenes-UTN/profesores/validar.txt" $USUARIO
        fi


done
IFS=$ANT_IFS





