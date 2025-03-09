.data
	caracter: .ascii "A"
	vocales: .asciiz "AEIOUaeiou"
	long: .word 10
.code
	lbu $a0, caracter($zero)
	lbu $a1, vocales($zero)
	lbu $a2, long($zero)
	jal esVocal
	halt

esVocal: daddi $t1, $zero, 0
	lazo: lbu $a1, vocales($t1)
		bne $a0, $a1, saltar
		j loes
	saltar: daddi $t1, $t1, 1
		bne $t1, $a2, lazo
		j noes
	loes: daddi $v0, $zero, 1
		j terminar
	noes: daddi $v0, $zero, 0
	terminar: jr $ra
