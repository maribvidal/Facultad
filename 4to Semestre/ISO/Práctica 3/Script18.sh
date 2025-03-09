#!/bin/bash

# Comprobar si se pasó el argumento
if [ $# -eq 1 ]; then

        #Comprobar si el usuario existe
        # \b hace que solo se busquen cadenas enteramente 
        # conformadas por letras
        if [ $(cat /etc/passwd | grep -e "\b$1\b" | wc -l) -eq 1 ]; then

                # Esperar que el usuario se conecte
                while [ $(users | grep -e "\b$1\b" | wc -l) -ne 1 ]; do
                        echo "> $1 NO SE ENCUENTRA CONECTADO"
                        # Dormir 10 segundos
                        sleep 10
                done
                echo "> $1 ESTÁ CONECTADO"
                exit 0
        fi

        echo "> ERROR: EL USUARIO '$1' NO EXISTE"
        exit 1
fi

echo "> ERROR: NO SE PASÓ EL ARGUMENTO"
exit 1
