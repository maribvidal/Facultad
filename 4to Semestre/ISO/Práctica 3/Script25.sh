#!/bin/bash

# Obtener lista de usuarios
usuarios=($(cat /etc/group | grep -e users | cut -c 13- | tr ',' ' ' ))

while getopts ":bli" opcion ;do
	case $opcion in
		b)
			if [[ ${#usuarios[*]} -gt $2 ]]; then
				echo ${usuarios[$2]}
			else
				echo "ERROR: Fuera de índice"
				exit 1
			fi
			;;
		l)
			echo ${#usuarios[*]}
			;;
		i)
			echo ${usuarios[*]}
			;;
		\?)
			echo "ERROR: Opción inválida"
			exit 1
			;;
	esac
done

exit 0
