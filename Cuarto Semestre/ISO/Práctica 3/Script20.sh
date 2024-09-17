#!/bin/bash

# Posible implementación de la pila
# Declárese a la pila como un vector
pila=()

# Una pila tiene longitud
longitud=0
long_max=100

# Una pila permite ver su tope
function peek() {
        if [ $longitud -ge 0 ]; then
                echo ${pila[$longitud]}
        else
                echo "> ERROR: No hay ningún elemento"
        fi
}

# Una pila agrega elementos por delante
function push() {
        if [ $longitud -le $long_max ]; then
                longitud=$(expr $longitud + 1)
                pila=("${pila[@]}" $1)
        else
                echo "> ERROR: La capacidad está llena"
        fi
}

# Una pila quita elementos por delante
function pop() {
        if [ $longitud -ge 0 ]; then
                echo pila[$longitud]
                unset pila[$longitud]
                longitud=$(expr $longitud - 1)
        else
                echo "> ERROR: La capacidad está vacía"
        fi
}

function verPila() {
        contador=1
        for elem in "${pila[@]}"
        do
                echo "$contador. - $elem"
                contador=$(expr $contador + 1)
        done
}

function guardarPila() {
        echo "> NOMBRE PARA LA PILA:"
        read nombre
        nomFichero="$nombre.stk"

        touch $nomFichero
        echo $longitud > $nomFichero
        echo $long_max >> $nomFichero
        echo "${pila[@]}" >> $nomFichero
}

function cargarPila() {
        echo "> NOMBRE DE LA PILA:"
        read nombre
        nomFichero="$nombre.stk"

        if [ -f "$nomFichero" ]; then
                longitud=$(sed -n '1p' $nomFichero)
                long_max=$(sed -n '2p' $nomFichero)
                args="$(sed -n '3p' $nomFichero)"
                readarray -td, a <<<"$args"; declare -p a;

                #Cargar elementos
                for it in $a
                do
                        pila=("${pila[@]}" $it)
                done

                echo "> PILA CARGADA"
        else
                echo "> PILA NO ENCONTRADA"
        fi
}

select opcion in VerPila VerTope Push Pop Guardar Cargar Salir
do
        case $opcion in
                "VerPila")
                        verPila
                        ;;
                "VerTope")
                        peek
                        ;;
                "Push")
                        echo "> Elemento a introducir:"
                        read item
                        push $item
                        ;;
                "Pop")
                        pop
                        ;;
                "Guardar")
                        guardarPila
                        ;;
                "Cargar")
                        cargarPila
                        ;;
                "Salir")
                        exit 0
                        ;;
        esac
done

exit 1                                                                                                                                                                                                                                                                                                                                                                                                               
