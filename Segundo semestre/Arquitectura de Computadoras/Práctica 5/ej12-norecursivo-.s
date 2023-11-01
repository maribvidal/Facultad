.data
	valor: .word 10
	result: .word 0
.text
	ld $a0, valor($zero)
	jal factorial
	sd $v0, result($zero)
	halt

factorial: daddi $v0, $zero, 1
	daddi $t0, $zero, 1
lazo:	dmul $v0, $v0, $a0
	bne $a0, $t0, lazo
	daddi $a0, $a0, -1
	jr $ra
