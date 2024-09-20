#!/bin/bash

num=(10 3 5 7 9 3 5 4)
num2=(1 2 3 4 5)

function factorial() {
	total=1

	for n in ${num2[*]}
	do
		echo "$total * $n ="
		total=$(expr $total \* $n)
	done

	echo $total
}

factorial

exit 0
