#!/bin/bash

# este script se fija si el recurso al que 
# se intenta acceder es un documento HTML,
# y en caso de que sea así, también se fija
# de que exista en el directorio actual, y
# de que si existe, si fue descargado antes
# después de la última fecha de modificación

# no se controlan los casos que no devuelvan
# un status code 2xx

if [ $# -ne 1 ]; then
	echo "ERROR: falta especificar una página web"
	exit 2
fi

resp_mod=$(curl -I -s $1 | grep "Last-Modified" | cut -c 16-)
resp_cont=$(curl -I -s $1 | grep "Content-Type" | cut -d' ' -f 2 | tr -d '\r\n')

if [[ "$resp_cont" = "text/html" ]]; then
	fn=$(echo $1 | sed 's|^https[s]*://||')
	if [ -f "$fn" ]; then
		date_web=$(date -d "$resp_mod" "+%s")
		date_file=$(date -r "$fn" "+%s")
		if [[ "$date_web" -gt "$date_file" ]]; then
			curl $1 > "$fn"
		fi
	else
		curl $1 > "$fn"
	fi
else
	echo "ERROR: el recurso solicitado no tiene representación textual"
fi
