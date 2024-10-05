#!/bin/bash

archivos=()
ruta="/var/log/"

for item in $(ls -h /var/log | grep -e "access"); do
        test -f $ruta$item && echo "$item"
        test -f $ruta$item && archivos+=($item)
done

function cantidad {
        echo ${#archivos[*]}
}

function listar {
        echo ${archivos[*]}
}

function eliminar {
        if [ $# -eq 2 ]; then
                case $2 in
                        "logica")
                                unset archivos[$(expr $1 - 1)]
                                ;;
                        "fisica")
                                unset archivos[$(expr $1 - 1)]
                                rm "$ruta$2"
                                ;;
                        *)
                                echo "Comando inválido"
                                ;;
                esac
        fi
}

select opt in cantidad listar eliminar salir; do
        case $opt in
                cantidad)
                        cantidad
                        ;;
#!/bin/bash

archivos=()
ruta="/var/log/"

for item in $(ls -h /var/log | grep -e "access"); do
        test -f $ruta$item && echo "$item"
        test -f $ruta$item && archivos+=($item)
done

function cantidad {
        echo ${#archivos[*]}
}

function listar {
        echo ${archivos[*]}
}

function eliminar {
        if [ $# -eq 2 ]; then
                case $2 in
                        "logica")
                                unset archivos[$(expr $1 - 1)]
                                ;;
                        "fisica")
                                unset archivos[$(expr $1 - 1)]
                                rm "$ruta$2"
                                ;;
                        *)
                                echo "Comando inválido"
                                ;;
                esac
        fi
}

select opt in cantidad listar eliminar salir; do
        case $opt in
                cantidad)
                        cantidad
                        ;;
                listar)
                        listar
                        ;;
                eliminar)
                        echo "Indique el índice y si desea borrar el archivo de manera logica o fisica"
                        read indice modo
                        eliminar $indice $modo
                        ;;
                salir)
                        exit 0
                        ;;
        esac
done
