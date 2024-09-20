#!/bin/bash

function inicializar() {
	arrayVacio=()
}

function agregar_elem() {
	arrayVacio=(${arrayVacio[@]} $1)
}

function eliminar_elem() {
	delete=$1
	arrayVacio=("$(arrayVacio[@]/$delete)")
}

function longitud() {
	echo ${#arrayVacio[*]}
}

function imprimir() {
	echo ${arrayVacio[@]}
}

function inicializar_Con_Valores() {
	arrayVacio=()
	longitud=$1

	while [ $longitud -gt 0 ]; do
		arrayVacio=(${arrayVacio[@]} $2)
		longitud=$(expr $longitud - 1 )
	done
}

inicializar_Con_Valores 10 5
longitud
imprimir
exit 0
