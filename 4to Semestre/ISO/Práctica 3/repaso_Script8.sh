#!/bin/bash

if [ $# -ne 1 ]; then
        exit 1
fi

usuarios=()

# GUARDAR LOS NOMBRES QUE CUMPLAN EL PATRÓN

for usu in $(cat /etc/passwd | cut -f1 -d':'); do
        v=$(echo $usu | grep -e $1)
        if [ $(echo $? ) -eq 0 ]; then
                usuarios+=($usu)
        fi
done

# FUNCIONES
function listar {
        for usu in ${usuarios[*]}; do
                echo $usu
        done
}

eliminar() {
        count=0
        for usu in ${usuarios[*]}; do
                echo "USUARIO: $usu / INDICE: $count"
                count=$(expr $count + 1)
        done

        echo "INGRESE UN INDICE:"
        read indice

        if ! [[ $indice -ge 0 && $indice -le $count ]]; then
                echo "ERROR: El índice no es válido"
                return 1
        else
                unset usuarios[$indice]
        fi
}

contar() {
        echo ${#usuarios[*]}
}

select opt in listar eliminar contar salir; do
        case $opt in
                "listar")
                        listar
                        ;;
                "eliminar")
                        eliminar
                        ;;
                "contar")
                        contar
                        ;;
                "salir")
                        exit 0
                        ;;
                *)
                        echo "sos un mogolico"
                        ;;
        esac
done
