#!/bin/bash

args=("$@")

if [ $# -gt 0 ]; then
	inexistentes=0
	indice=0

	while [ $indice -le $# ]; do
		echo ${args[$indice]}
		if [[ -f ${args[$indice]} ]]; then
			echo "> ${args[$indice]} ES UN FICHERO"
		elif [[ -d ${args[$indice]} ]]; then
			echo "> ${args[$indice]} ES UN DIRECTORIO"
		else
			inexistentes=$(expr $inexistentes + 1)
		fi
		indice=$(expr $indice + 2)
	done

else
	echo "ERROR: No se recibió ningún argumento"
	exit 1
fi

echo "> DE LOS PASADOS Y LOS IMPARES, $inexistentes RUTAS SON INEXISTENTES"
exit 0
