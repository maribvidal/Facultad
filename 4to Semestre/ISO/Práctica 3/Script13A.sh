#!/bin/bash

for ((i=1; i < 101; i++))
do
	echo "> NRO $i / CUADRADO: $(expr $i \* $i)"
done
