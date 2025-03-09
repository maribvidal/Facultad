#!/bin/bash

vector1=(1 80 65 35 2)
vector2=(5 98 3 41 8 7)

# Si falta un elemento en uno de los dos vectores,
# se le sumará 0

function sumarVectores() {
	# Obtener la longitud de ambos vectores
	v1_long=${#vector1[@]}
	v2_long=${#vector2[@]}
	contador=0

	# Mientras uno de los dos siga teniendo elementos
	while [[ $v1_long -gt 0 || $v2_long -gt 0 ]]
	do
		suma=0
		
		if [ $v1_long -gt 0 ]; then
			suma=$(expr $suma + ${vector1[$contador]})
			v1_long=$(expr $v1_long - 1)
		fi

		if [ $v2_long -gt 0 ]; then
                        suma=$(expr $suma + ${vector2[$contador]})
                	v2_long=$(expr $v2_long - 1)
		fi
		
		echo "La suma de los elementos de la posición $contador de los vectores es $suma"
		contador=$(expr $contador + 1)
	done
}

sumarVectores
