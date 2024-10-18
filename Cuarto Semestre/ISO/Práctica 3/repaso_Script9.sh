#!/bin/bash

if [ $# -lt 2 ]; then
        echo "ERROR: Faltan pasar argumentos"
        exit 1
fi

ips_pasadas=()

# GUARDAR LAS IPS OBTENIDAS
for ipe in $*; do
        ips_pasadas+=($ipe)
done

unset ips_pasadas[0]

for ipe in ${ips_pasadas[@]}; do
        contador=0
        for log in $(ls -h ./logs); do
                archivo=$(cat ./logs/$log)
                ip=$(echo $archivo | cut -f1 -d' ')
                fecha=$(echo $archivo | cut -f3 -d' ')

                if [[ $ip == $ipe && $fecha == $1 ]]; then
                        contador=$(expr $contador + 1)
                fi
        done
        echo "$ipe - OCURRENCIAS $contador"
done
