#!/bin/bash

DISCO=$(sudo fdisk -l | grep '10 GiB' | awk '{print $2}' | awk -F ':' '{print $1}')
echo "-----------------------"
echo "particionando disco: $DISCO"
echo "-----------------------"

echo

sudo fdisk $DISCO << EOF
n
e
1


n

+1000M
n

+1000M
n

+1000M
n

+1000M
n

+1000M
n

+1000M
n

+1000M
n

+1000M
n

+1000M
n

+1000M

w
EOF

echo "-----------------------"
echo "particiones creadas"
echo "-----------------------"

sudo fdisk -l $DISCO

echo "-----------------------"
echo "formateando particiones"
echo "-----------------------"


for i in {5..14}
do
	DISCO_ACTUAL=${DISCO}${i}
	sudo mkfs.ext4 -F ${DISCO_ACTUAL}
done

echo "-----------------------"
echo "montando particiones"
echo "-----------------------"


I_DISCO=5
for i in alumno_1/parcial_1 alumno_1/parcial_2 alumno_1/parcial_3 alumno_2/parcial_1 alumno_2/parcial_2 alumno_2/parcial_3 alumno_3/parcial_1 alumno_3/parcial_2 alumno_3/parcial_3 profesores
do
	DISPOSITIVO=${DISCO}${I_DISCO}
	DIR="/Examenes-UTN/${i}"

	echo "Montando disco ${DISPOSITIVO} en ${DIR}"
	echo

	#     <dispositivo>    <dir>   <tipo>   <opciones>   <dump>   <fsck>
	echo "${DISPOSITIVO}   ${DIR}   ext4     defaults      0        0" | sudo tee -a /etc/fstab

	I_DISCO=$((I_DISCO+1))
done

sudo systemctl daemon-reload
sudo mount -a






