#!/bin/bash

# Verificar que se ha pasado un argumento
if [ $# -ne 3 ]; then
        echo "ERROR: Faltan pasar los argumentos"
        exit 1
fi

# Verificar que el primer argumento pasado sea un directorio
if ! [ -d $1 ]; then
        echo "ERROR: Directorio no válido"
        exit 1
fi

# Renombrar solo los archivos del directorio pasado
archivos_dir=$(ls -h $1)

case $2 in
        "-a")
                for arch in $archivos_dir; do
                        mv "$1/$arch" "$1/$arch$3"
                done
                ;;
        "-b")
                for arch in $archivos_dir; do
                        mv "$1/$arch" "$1/$3$arch"
                done
                ;;
        *)
                echo "ERROR: Opción inválida"
                exit 1
                ;;
esac
