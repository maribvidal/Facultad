.data
	dirControl: .word32 0x10000
	dirData: .word32 0x10008
	numUno: .word 0
	numDos: .word 0
	resultado: .word 0
	strSuma: .asciiz " + "
	strIgual: .asciiz " = "
.code
	;INICIAR CONTROL Y PILA
	lwu $s0, dirControl($0)
	lwu $s1, dirData($0)
	daddi $sp, $0, 0x3F0
	sd $s1, 0($sp)
	sd $s0, 8($sp)

	;INGRESAR NUMEROS
	jal ingreso
	sd $v0, numUno($0)
	daddi $t0, $0, strSuma
	ld $t4, 0($sp)
	sd $t0, 0($t4)
	ld $t4, 8($sp)
	daddi $t0, $0, 4
	sd $t0, 0($t4)
	jal ingreso
	sd $v0, numDos($0)
	ld $a0, numUno($0)
	dadd $a1, $0, $v0

	;RESULTADO
	ld $t4, 0($sp)
	daddi $t0, $0, strIgual
	sd $t0, 0($t4)
	ld $t4, 8($sp)
	daddi $t0, $0, 4
	sd $t0, 0($t4)
	jal resultado
	sd $v0, resultado($0)
	halt

ingreso:	ld $s0, 8($sp)
	ld $s1, 0($sp)
ciclo:	daddi $t0, $0, 0
	daddi $t1, $0, 8
	sd $t1, 0($s0)
	ld $v0, 0($s1)
	slti $t0, $v0, 10
	beqz $t0, ciclo
	slti $t0, $v0, 0
	bnez $t0, ciclo
	jr $ra

resultado:	ld $s0, 8($sp)
	ld $s1, 0($sp)
	dadd $t2, $a0, $a1
	sd $t2, 0($s1)
	daddi $t0, $0, 1
	sd $t0, 0($s0)
	jr $ra
