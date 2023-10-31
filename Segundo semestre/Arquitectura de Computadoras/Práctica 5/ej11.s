.data
	tablaNum: .asciiz "12345"
	numImpares: .word 0
	paraAnd: .word 0x0001
.code
	daddi $a0, $zero, tablaNum; pasar la dirección
	daddi $sp, $zero, 0x400;    inicializar pila
	jal contarImpares
	sd $v1, numImpares($zero)
	halt

esImpar: ld $t0, paraAnd($zero)
	and $v0, $a1, $t0
	jr $ra
contarImpares: dadd $s0, $zero, $a0
		daddi $v1, $zero, 0
		daddi $sp, $sp, -8
		sd $ra, 0($sp)
	lazo:	lbu $a1, 0($s0)
		daddi $sp, $sp, -8
		sd $s0, 0($sp)
		jal esImpar
		beqz $v0, saltar
			daddi $v1, $v1, 1
	saltar: ld $s0, 0($sp)
		daddi $sp, $sp, 8
		daddi $s0, $s0, 1
		bnez $a1, lazo
		ld $ra, 0($sp)
		daddi $sp, $sp, 8
		jr $ra
