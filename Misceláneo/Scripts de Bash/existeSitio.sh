#!/bin/bash

# Corroborar que se haya recibido un argumento solo
if [[ $# -ne 1 ]]; then
	echo "> Falta pasar el parámetro"
	exit 1
fi

dominio=$1
ip=$(host $1 | grep -m 1 "address" | cut -d' ' -f 4)

# Comprobar si hubieron errores durante la obtención
if [ $? -ne 0 ]; then
	echo "> Hubo un problema tratando de conseguir la IP"
	exit 1
else
	echo "> La IP del sitio ($dominio) es: $ip"
	exit 0
fi
