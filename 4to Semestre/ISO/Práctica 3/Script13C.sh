#!/bin/bash

if [ $# -eq 1 ]
then
        test -e $1 && echo "La ruta $1 existe"
        test -d $1 && echo "La ruta $1 es un directorio"
        test -f $1 && echo "La ruta $1 es un fichero" 
else
        echo "No se ingreso ningun parametro"
fi
