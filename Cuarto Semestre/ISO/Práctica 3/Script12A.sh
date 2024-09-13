#!/bin/bash

clear

echo "> INGRESE NUMERO 1:"
read num1
echo "> INGRESE NUMERO 2:"
read num2
echo ""
echo "> NÚMERO 1 RECIBIDO: $num1"
echo "> NÚMERO 2 RECIBIDO: $num2"
echo ""
echo "> $num1 * $num2 = `expr $num1 \* $num2`"
echo "> $num1 + $num2 = `expr $num1 + $num2`"
echo "> $num1 - $num2 = `expr $num1 - $num2`"
echo
# IMPRIMIR EL NÚMERO MAYOR
if [ $num1 -gt $num2 ]; then
        echo "> EL NÚMERO MAYOR ES EL $num1"
elif [ $num2 -gt $num1 ]; then
        echo "> EL NÚMERO MAYOR ES EL $num2"
else
        echo "> AMBOS NÚMEROS SON IGUALES"
fi
