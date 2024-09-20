#!/bin/bash

# Función que cuenta la cantidad de ficheros en un directorio dado
# que el usuario tiene permisos
function contarFicheros() {
	ficheros=$(ls -h $dir | cut -f1 -d ' ')
	contador=0

	for fich in $ficheros
	do
		# Revisar si el usuario tiene permisos de
		# lectura y escritura con el fichero dado
		if [[ -f $fich && -r $fich && -w $fich ]]; then
			echo $fich
			contador=$(expr $contador + 1)
		fi
	done

	echo "> EL USUARIO TIENE PERMISOS DE LECTURA Y ESCRITURA PARA $contador FICHEROS"
}

# Se espera recibir el nombre de un directorio
if [ $# -eq 1 ]; then
	# Revisar si existe el directorio
	dir=$(find / -type d -name $1 | grep -e "\b$1\b")
	if [ $? -eq 0 ]; then
		contarFicheros $dir
	else
		echo "> ERROR: El directorio no existe"
		exit 4
	fi
else
	echo "> ERROR: No se pasó ningún argumento"
	exit 1
fi

exit 0
