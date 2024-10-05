#!/bin/bash

arr=()

function insert {
        if [ $# -eq 1 ]; then
                arr+=($1)
        fi
}

function rellenar {
        if [ $# -eq 1 ]; then
                count=$1
                for ((i=0; i<$count; i++)); do
                        echo "INTRODUZCA UNA CADENA:"
                        read cadena
                        insert $cadena
                done
        fi
}

function seleccionar {
        if [ $# -eq 1 ]; then
                if [ $1 = "*" ]; then
                        echo ${arr[*]}
                else
                        test -f $1 && cat $1 || echo "Elemento no encontrado"
                fi
        fi
}

function borrar {
        if [ $# -eq 1 ]; then
                if [ $1 = "*" ]; then
                        arr=()
                else
                        for it in ${arr[*]}; do
                                if [ $it = $1 ]; then
                                        rm $1
                                        exit 0
                                fi
                        done
                        echo "Elemento no encontrado"
                fi
        fi
}

rellenar 5
seleccionar "copa"
borrar "copa"
