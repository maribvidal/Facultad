.data
	M:     .word 6
	tabla: .word 1, 2, 4, 8, 16, 20
	cant:  .word 0
	long:  .word 6
.code
	ld $a0, M($zero)
	ld $a1, tabla($zero)
	ld $a2, long($zero)
	jal buscarMayor
	sd $v0, cant($zero)
	halt

buscarMayor: daddi $v0, $zero, 0; Valor de salida (cantidad de numeros mayores que M)
	     daddi $t2, $zero, 0; Índice
       lazo: slt $t1, $a1, $a0; Comparar si el número es menor que $a1
 	     bnez $t1, saltar; Saltar
	     beq $a1, $a0, saltar; Comparar si son iguales y saltar si lo son
	     daddi $v0, $v0, 1; Incrementar la cantidad de números mayores que M
     saltar: daddi $t2, $t2, 8; Incrementar el índice
	     ld $a1, tabla($t2); Traer otro dato de la tabla
	     daddi $a2, $a2, -1; Decrementar la cantidad de elementos a leer
	     bnez $a2, lazo; Si no es igual a 0, repetir el lazo
	     jr $ra; Retonar la subrutina
