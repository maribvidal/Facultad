#!/bin/bash

# EJERCICIO 29 (hecho de vuelta pero solo con comandos que aparecieron en la práctica (menos el unset)):
# Agregar todos los archivos del directorio /home
# cuya terminación sea .doc (asumamos que es el
# /home del usuario que ejecuta el script)

archivos=()

for item in $(ls -R $HOME | grep . | cut -f1 | grep -e ".doc"); do
        # Control rebuscado: asegurarse que sea un archivo
        test -f $item && archivos+=($item)
done

# Implementar las siguientes funciones:
# - verArchivo <nombre_de_archivo>
function verArchivo {
        # Revisar si se pasaron los argumentos
        if [ $# -ne 1 ]; then
                echo "* No se recibió el nombre del archivo"
                exit 1
        fi

        # Utilizar el grep
        if [ $(echo ${archivos[*]} | grep -e $1 | wc -l) -eq 1 ]; then
                ruta=$(find $HOME -type f -name "*$1*")
                cat $ruta
        else
                echo "Archivo no encontrado"
                exit 5
        fi
}

function cantidadArchivos {
        if [ ${#archivos[*]} -gt 0 ]; then
                echo ${#archivos[*]}
        else
                echo "El archivo está vacío"
                exit 5
        fi
}

function borrarArchivo {
        if [ $(echo ${archivos[*]} | grep -e $1 | wc -l) -eq 1 ]; then
                echo "> ¿Quiere eliminar el archivo solo de manera lógica? (Si/No)"
                read respuesta

                case $respuesta in
                        "Si")
                                count=0
                                for item in ${archivos[@]}; do
                                        count=$(expr $count + 1)
                                        if [[ item = $1 ]]; then
                                                unset archivos[$count]
                                        fi
                                done
                                echo ${archivos[@]}
                                ;;
                        "No")
                                count=0
                                for item in ${archivos[@]}; do
                                        count=$(expr $count + 1)
                                        if [[ item = $1 ]]; then
                                                unset archivos[$count]
                                        fi
                                done
                                ruta=$(find $HOME -type f -name "*$1*")
                                rm $ruta
                                echo "Se borró el archivo"
                                ;;
                        *)
                                echo "Opcion no válida"
                                ;;

                esac
        else
                echo "Archivo no encontrado"
                exit 10
        fi
}

# Invocar instrucciones

verArchivo "archivo.doc"
cantidadArchivos
borrarArchivo "archivo.doc"
