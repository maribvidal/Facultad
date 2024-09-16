#!/bin/bash

# Corroborar que se haya pasado UN argumento

if [[ $# -eq 1 ]]; then
        cant=$(find / -user $USER | grep -e .$1 | wc -l)
        touch reporte.txt
        printf "NOMBRE DE USUARIO | CANT. ARCHIVOS ($1)\n" > reporte.txt
        # solo porque la quiero tryhardear
        usrLong=${#USER}
        if [ $usrLong -ge 18 ]; then
                echo $(cut -c 1-18 $USER) >> reporte.txt
        else
                # mientras la longitud no sea igual a 18
                echo -ne $USER >> reporte.txt
                while [ $usrLong -ne 18 ]; 
                do
                       echo -ne " " >> reporte.txt
                       usrLong=$(expr $usrLong + 1)
                done
        fi
        echo "| $cant" >> reporte.txt
        echo "> ARCHIVO reporte.txt GENERADO CON ÉXITO" 
else
        echo "> ESPECIFIQUE LA EXTENSION"
fi
