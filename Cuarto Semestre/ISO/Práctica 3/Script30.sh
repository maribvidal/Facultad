#!/bin/bash

usuarioLogeado=$(whoami)
directorioHome="/home/$usuarioLogeado"
directorioBin="$directorioHome/bin"

contadorMovidos=0
vectorDirectorio=$(ls -h | cut -f1 -d ' ')

# Comprobar si existe el directorio bin
if ! [ -d $directorioBin ]; then
        echo "> CREANDO DIRECTORIO BIN"
        mkdir $directorioBin
fi

# (Intentar) mover ficheros de directorio
for elem in $vectorDirectorio
do
        if [ -f $elem ]; then
                echo "> MOVIENDO A $elem"
                mv $elem $directorioBin/$elem
                contadorMovidos=$(expr $contadorMovidos + 1)
        fi
done

# Comprobar si no se ha movido ningún archivo
if [ $contadorMovidos -eq 0 ]; then
        echo "> NINGÚN FICHERO HA SIDO DESPLAZADO"
        exit 1
fi

exit 0
