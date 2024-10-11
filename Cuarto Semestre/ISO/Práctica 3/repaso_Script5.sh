#!/bin/bash

contador=0

# VALIDAR QUE SE RECIBA UN PARÁMETRO
if [ $# -lt 1 ]; then
        exit 1
fi

# ITERAR POR TODOS LOS PARÁMETROS RECIBIDOS
for ruta in $@; do
        if [[ -f $ruta || -d $ruta && -r $ruta ]]; then
                tar -cvzf ${ruta}Comprimido.tar $ruta
        elif [[ -d $ruta && -w $ruta ]]; then
                rmdir $ruta
        else
                contador=$(expr $contador + 1)
        fi
done

echo "Cantidad elementos inválidos: $contador"
exit 0
