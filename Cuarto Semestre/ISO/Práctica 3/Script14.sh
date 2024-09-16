#!/bin/bash

numArgs=$#

# Se deberán recibir 3 argumentos:
# - El primero, una opción -[ab].
# - El segundo, la ruta del fichero.
# - El tercero, la cadena a concatenar.
# Se debe comprobar si la ruta 
# pasada corresponde a un fichero

if [[ $numArgs -eq 3 && -f "$2" ]]; then
        # Obtener la ruta sin nombre de fichero
        # y el nombre de fichero sin ruta
        #
        rutaDir=$(dirname "$2")
        nomFichero=$(basename "$2")
        # Leer las opciones
        while getopts ":ab" opcion; do
                case "$opcion" in
                        a) nuevaRuta="${rutaDir}/${nomFichero}$3"
                           mv $2 $nuevaRuta
                           ;;
                        b) nuevaRuta="${rutaDir}/$3${nomFichero}"
                           mv $2 $nuevaRuta
                           ;;
                        \?) echo "-$DPTARG: OPCIÓN INVÁLIDA - "
                           exit 1;;
                esac
        done
else
        echo " - ERROR: Se esperaban 3 argumentos / una ruta de fichero válida"
        exit 1
fi
echo "- ACCIÓN REALIZADA CON ÉXITO"
echo "- Nueva ruta del archivo: $nuevaRuta"
exit 0
                                                                                                 24,42-63     T
