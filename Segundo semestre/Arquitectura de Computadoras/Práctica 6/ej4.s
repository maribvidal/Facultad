.data
	clave: .asciiz "F4LL"
	str_bien: .asciiz "Bienvenido"
	str_mal: .asciiz "ERROR "
	dir_control: .word32 0x10000
	dir_data: .word32 0x10008
	cadena: .byte 0, 0, 0, 0, 0
.code
	lwu $t0, dir_control($0)
	lwu $t1, dir_data($0)
	daddi $sp, $0, 0x3F0
	sd $t0, 0($sp)
	sd $t1, 8($sp)
ingresar: daddi $a0, $0, cadena
	jal char
	daddi $a0, $0, cadena
	daddi $a1, $0, clave
	jal respuesta
	bnez $v0, ingresar
	daddi $sp, $sp, 16
	halt

char:	ld $s0, 0($sp)
	ld $s1, 8($sp)
	daddi $t0, $0, 4
lazo:	daddi $t1, $0, 9
	sd $t1, 0($s0)
	lbu $t2, 0($s1)
	sb $t2, 0($a0)
	daddi $a0, $a0, 1
	daddi $t0, $t0, -1
	bnez $t0, lazo
	jr $ra

respuesta:	ld $s0, 0($sp)
	ld $s1, 8($sp)
	daddi $t0, $0, 4
	daddi $t1, $0, 0
	daddi $v0, $0, 0
lazo2:	lbu $t2, clave($t1)
	lbu $t3, cadena($t1)
	beq $t2, $t3, saltar
		daddi $v0, $0, 1
		j no_es
saltar:	daddi $t1, $t1, 1
	daddi $t0, $t0, -1
	bnez $t0, lazo2
	daddi $t0, $0, str_bien
	sd $t0, 0($s1)
	j terminar
no_es:	daddi $t0, $0, str_mal
	sd $t0, 0($s1)
terminar:	daddi $t0, $0, 4
	sd $t0, 0($s0)
	jr $ra
