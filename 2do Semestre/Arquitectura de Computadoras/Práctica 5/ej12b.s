.data; Intento de solución
	valor: .word 10
	result: .word 0
.text
	daddi $sp, $zero, 0x400
	ld $a0, valor($zero)
	daddi $a1, $zero, 1; Usamos un parámetro de entrada para guardar el número que se va decrementando
	jal factorial
	sd $v0, result($zero)
	halt

factorial: daddi $t1, $zero, 1
	daddi $sp, $sp, -8
	sd $ra, 0($sp)
	beq $a0, $t1, fin
	dadd $t0, $zero, $a0
	dmul $a1, $a1, $t0
	daddi $a0, $a0, -1
	jal factorial
	fin: ld $ra, 0($sp)
	daddi $sp, $sp, 8
	jr $ra
