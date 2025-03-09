#!/bin/bash

# Primero voy a usar el comando 'ls -h' para obtener solo el nombre de los ficheros
# Luego voy a usar el comando "cut -d ' '" para hacer un vector con los nombres
# y así poder procesar cada nombre en solitario
# Por último, voy a usar el comando 'tr' para procesar cada cadena como se pide

vectorNombres=$(ls -h | cut -f1 -d ' ')

for nom in $vectorNombres
do
        # Primero se borran las a/A, y luego se intercambian las mayusculas y minusculas
        echo $nom | tr -d 'a' | tr -d 'A' | tr [:upper:][:lower:] [:lower:][:upper:]
done
