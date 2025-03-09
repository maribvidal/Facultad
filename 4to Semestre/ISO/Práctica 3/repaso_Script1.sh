#!/bin/bash

#revisar parámetros
if [ $# -ne 1 ]; then
        exit 1;
fi      

# revisar que el usuario exista en el sistema
if [ $(cat /etc/passwd | grep -e $1 | wc -l) -ne 1 ]; then
        exit 1;
fi      

veces=0
nomUsu=$1

while [ $veces -lt 30 ]; do
        sleep 30
        if [ $(users | grep -e $nomUsu | wc -l) -eq 1 ]; then
                veces=$(expr $veces + 1)
                nomArch="access$nomUsu.log"
                echo "$nomUsu $(date)" >> $nomArch
        fi      
done    

exit 0
