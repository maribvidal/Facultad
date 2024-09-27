#!/bin/bash
#
function encontrarArchivo() {
        ruta=$(find /home -name $1)
        if [ $? -eq 0 ]; then
                echo $ruta
        fi
        exit 1
}

function verArchivo() {
        fich=$(encontrarArchivo $1)
        if [ -f $fich ]; then
                echo $(cat $fich)       
        else
                exit 5
        fi
}

function cantidadArchivos() {
        echo ${#documentos[*]}
}

function borrarArchivo() {
        echo "> ¿DESEA BORRAR EL ARCHIVO SOLO DE MANERA LÓGICA? (Si/No): "
        read resp
        if [ $resp = "Si" ]; then
                documentos=("${documentos[@]/$1}")
        elif [ $resp = "No" ]; then
                documentos=("${documentos[@]/$1}")
                fich=$(encontrarArchivo $1)
                rm $fich
        else
                echo "> ERROR: Respuesta inválida"
        fi
}

documentos=$(ls -Rh /home | cut -f1 -d ' ' | grep -e ".doc")
cantidadArchivos
verArchivo "docu.doc"
