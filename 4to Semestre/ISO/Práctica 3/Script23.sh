#!/bin/bash

vec_num=(1 2 3 4 5 6 7 8 9 10)

function numerosPares() {
	vec_pares=()
	for n in ${vec_num[*]} 
	do
		if [ $(expr $n % 2) -eq 0 ]; then
			vec_pares=(${vec_pares[*]} $n)
		fi
	done
	echo ${vec_pares[*]}
}

numerosPares
