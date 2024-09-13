#!/bin/bash

numArgs=$#
resultado=0

if [ $numArgs -eq 3 ]; then
	# Revisar argumentos
	# OPERANDO
	case $2 in
		"+")
			resultado=$(expr $1 + $3)
		;;
		"-")
                        resultado=$(expr $1 - $3)
                ;;
		"x")
                        resultado=$(expr $1 \* $3)
                ;;
		"/")
                        resultado=$(expr $1 / $3)
                ;;
		*)
			echo "OPERADOR INVÁLIDO"
		;;
	esac
	echo $resultado
else
	echo "ARGUMENTOS MAL INGRESADOS"
fi
