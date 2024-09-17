#!/bin/bash

msjError="> ERROR: No se encontró el script"

clear
echo "MENU DE COMANDOS"

select opcion in Ejercicio3 Ejercicio12A Ejercicio12B Ejercicio12C Ejercicio13A Ejercicio13B Ejercicio13C Ejercicio14 Ejercicio16 Ejercicio17 Ejercicio18 Salir
        do
                clear
                echo "MENU DE COMANDOS"

                case $opcion in
                        "Ejercicio3")
                                test -f Script3.sh && bash Script3.sh  || echo "$msjError $opcion"
                                ;;
                        "Ejercicio12A")
                                test -f script12a.sh && bash script12a.sh || echo "$msjError $opcion"
                                ;;
                        "Ejercicio12B")
                                echo "> NUMERO 1: "
                                read num1
                                echo "> NUMERO 2: "
                                read num2
                                test -f Script12B.sh && bash Script12B.sh $num1 $num2 || echo "$msjError $opcion"
                                ;;
                        "Ejercicio12C")
                                echo "> NUMERO 1: "
                                read num1
                                echo "> OPERADOR: "
                                read ope
                                echo "> NUMERO 2: "
                                read num2
                                test -f script12c.sh && bash script12c.sh $num1 $ope $num2 || echo "$msjError $opcion"
                                ;;
                        "Ejercicio13A")
                                test -f Script13A.sh && bash Script13A.sh || echo "$msjError $opcion"
                                ;;
                        "Ejercicio13B")
                                test -f Script13B.sh && bash Script13B.sh || echo "$msjError $opcion"
                                ;;
                        "Ejercicio13C")
                                test -f Script13C.sh && bash Script13C.sh || echo "$msjError $opcion"
                                ;;
                        "Ejercicio14")
                                echo "> ELIJA OPCION -a O -b:"
                                read opt
                                echo "> RUTA DEL FICHERO:"
                                read ruta
                                echo "> CADENA:"
                                read cadena
                                test -f Script14.sh && bash Script14.sh $opt $ruta $cadena || echo "$msjError $opcion"
                                ;;
                        "Ejercicio16")
                                echo "> EXTENSION:"
                                read ext
                                test -f Script16.sh && bash Script16.sh $ext || echo "$msjError $opcion"
                                ;;
                        "Ejercicio17")
                                test -f Script17.sh && bash Script17.sh || echo "$msjError $opcion"
                                ;;
                        "Ejercicio18")
                                echo "> NOMBRE DE USUARIO:"
                                read usu
                                test -f Script18.sh && bash Script18.sh $usu || echo "$msjError $opcion"
                                ;;
                        "Salir")
                                echo "* TERMINANDO PROGRAMA"
                                exit 0
                                ;;
                esac
        done

exit 1
                                                                                                                                            1,11     Comienzo
