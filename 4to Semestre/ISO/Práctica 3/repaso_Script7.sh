#!/bin/bash

if [ $# -lt 3 ]; then
        exit 1
fi

if ! [ -d $1 ]; then
        exit 2
fi

function agregarArchivosDirectorio {
        for arch in $(ls -h $1); do
                test -f $1/$arch && arr+=($arch)
        done
}

function eliminarArchivosPatron {
        count=0
        for elem in ${arr[@]}; do
                if [ $(echo $elem | grep -c $1 ) -eq 1 ]; then
                        unset arr[$count]
                        if [[ $2 = "-f" ]]; then
                                touch -f $dirPrimera/$elem && rm $dirPrimera/$elem
                        fi
                fi
                count=$(expr $count + 1)
        done
}

echo $*

if [[ $2 = "-a" || $2 = "-d" ]]; then
        arr=()
        agregarArchivosDirectorio $1
        dirPrimera=$1
        if [ $2 = "-a" ]; then
                agregarArchivosDirectorio $3
        elif [ $2 = "-d" ]; then
                eliminarArchivosPatron $3 $4
        else
                exit 1
        fi
        echo ${arr[@]}
        exit 0
fi
