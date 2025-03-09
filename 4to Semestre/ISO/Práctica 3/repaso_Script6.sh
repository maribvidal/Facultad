#!/bin/bash

usuarios=()

# AGREGAR USUARIOS AL VECTOR
for nom in $(cat /etc/passwd | cut -f1 -d:); do
        usuarios+=($nom)
done

function existe {
        for nom in ${usuarios[*]}; do
                if [ $nom = $1 ]; then
                        echo "existe el nombre pasado"
                        exit 0
                fi
        done
        exit 1
}

function eliminar_usuario {
        ind=0
        for nom in ${usuarios[*]}; do
                ind=$(expr $ind + 1)
                if [ $nom = $1 ]; then
                        unset usuarios[$ind]
                        exit 0
                fi
        done
        exit 2
}

function usuarios_con_patron {
        for nom in ${usuarios[*]}; do
                if [ $(echo $nom | grep -e $1 | wc -c) -gt 0 ]; then
                        echo $nom
                fi
        done
}

function cantidad {
        echo ${#usuarios[*]}
}

function usuarios {
        echo ${usuarios[*]}
}

select opt in existe eliminar_usuario usuarios_con_patron cantidad usuarios salir; do
        case $opt in
                existe)
                        echo "NOMBRE DEL USUARIO:"
                        read nombre
                        existe $nombre
                        ;;
                eliminar_usuario)
                        echo "NOMBRE DEL USUARIO:"
                        read nombre
                        eliminar_usuario $nombre
                        ;;
                usuarios_con_patron)
                        echo "PATRON:"
                        read patron
                        usuarios_con_patron $patron
                        ;;
                cantidad)
                        cantidad
                        ;;
                usuarios)
                        usuarios
                        ;;
                salir)
                        echo "SALIENDO"
                        exit 0
                        ;;
        esac
done
