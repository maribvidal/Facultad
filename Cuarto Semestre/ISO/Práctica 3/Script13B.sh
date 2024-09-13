#!/bin/bash

select OPCION in Listar DondeEstoy QuienEsta
do
        case $OPCION in
                "Listar")
                        ls
                ;;
                "DondeEstoy"):
                        echo $(pwd)
                ;;
                "QuienEsta")
                        echo $(users)
                ;;
                *)
                        echo "Ese comando no es válido"
                ;;
        esac
        exit 0
done
