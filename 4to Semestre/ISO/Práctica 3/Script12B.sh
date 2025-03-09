#!/bin/bash

# Los dos números se reciben en la invocación del script como args
numArgs=$#

if [ $numArgs -eq 2 ]; then
        clear
        echo "> NÚMERO 1 RECIBIDO: $1"
        echo "> NÚMERO 2 RECIBIDO: $2"
        echo ""
        echo "> $1 * $2 = `expr $1 \* $2`"
        echo "> $1 + $2 = `expr $1 + $2`"
        echo "> $1 - $2 = `expr $1 - $2`"
        echo
        # IMPRIMIR EL NÚMERO MAYOR
        if [ $1 -gt $2 ]; then
                echo "> EL NÚMERO MAYOR ES EL $1"
        elif [ $2 -gt $1 ]; then
                echo "> EL NÚMERO MAYOR ES EL $2"
        else
                echo "> AMBOS NÚMEROS SON IGUALES"
        fi
        exit 0
else
        echo "> ERROR: CANTIDAD INCORRECTA DE ARGUMENTOS RECIBIDOS"
        echo "> PARA USAR ESTE SCRIPT PASE 2 NUMEROS COMO ARGUMENTOS"
        exit 1
fi
