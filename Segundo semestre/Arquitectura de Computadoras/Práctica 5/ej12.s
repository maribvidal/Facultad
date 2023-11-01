.data
	valor: .word 10
	result: .word 0
.text
	daddi $sp, $zero, 0x400
	ld $a0, valor($zero)
	jal factorial
	sd $v0, result($zero)
	halt

factorial: daddi $sp, $sp, -16; Vamos a apilar 2 valores
	sd $ra, 0($sp)
	sd $s0, 8($sp)
	beqz $a0, saltar; Si el $a0 es 0 (porque ya llamamos 10 veces a la subrutina...)
	dadd $s0, $zero, $a0; Pasar el número a un registro que se guarda
	daddi $a0, $a0, -1; Decrementar el número del parámetro de entrada
	jal factorial; Recursividad
	dmul $v0, $v0, $s0; Multiplicar $v0 por el número salvaguardado
	j fin; Terminar subrutina
saltar: daddi $v0, $v0, 1; Si se llegó al final (0), inicializar $v0 en 1
fin:	ld $s0, 8($sp); Desapilar $s0
	ld $ra, 0($sp); Desapilar dirección de retorno
	daddi $sp, $sp, 16; Incrementar el stack pointer
	jr $ra
