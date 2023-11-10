.data 
	CONTROL: .word32 0x10000 
	DATA: .word32 0x10008 
	color_pelota: .word32 0xFF000000 ; Negro 
	color_fondo: .word32 0x00FFFFFF ; Blanco
	str_ingresar: .asciiz "Ingrese una tecla "
	str_w: .asciiz "Pulsaste la W "
	str_a: .asciiz "Pulsaste la A "
	str_s: .asciiz "Pulsaste la S "
	str_d: .asciiz "Pulsaste la D "
.text
	lwu $s6, CONTROL($zero) 
	lwu $s7, DATA($zero) 
	lwu $s0, color_pelota($zero)
	lwu $s1, color_fondo($zero)

	daddi $s2, $0, 50; X
	daddi $s3, $0, 50; Y

	daddi $s5, $0, 7; Código para borrar pantalla
	daddi $s4, $0, 5; Código para dibujar

	daddi $t0, $0, 4; Mensaje
	daddi $t1, $0, str_ingresar
	sd $t1, 0($s7)
	sd $t0, 0($s6)

	sw $s0, 0($s7)
	sb $s2, 4($s7)
	sb $s3, 5($s7)
	sd $s4, 0($s6)

	;LOOP
loop:	;DIBUJAR PUNTO
	sw $s0, 0($s7)
	sb $s2, 4($s7)
	sb $s3, 5($s7)
	sd $s4, 0($s6)
	;INGRESAR TECLA
	jal ingresar_tecla
	daddi $t2, $0, 0x77; Letra W
	beq $v0, $t2, letra_w
	daddi $t2, $0, 0x61; Letra A
	beq $v0, $t2, letra_a
	daddi $t2, $0, 0x73; Letra S
	beq $v0, $t2, letra_s
	daddi $t2, $0, 0x64; Letra D
	beq $v0, $t2, letra_d
	halt

letra_w: daddi $s3, $s3, 1; Aumentar el Y
	j loop

letra_a: daddi $t0, $0, 4
	daddi $t1, $0, str_a
	sd $t1, 0($s7)
	sd $t0, 0($s6)
	j loop

letra_s: daddi $t0, $0, 4
	daddi $t1, $0, str_s
	sd $t1, 0($s7)
	sd $t0, 0($s6)
	j loop

letra_d: daddi $t0, $0, 4
	daddi $t1, $0, str_d
	sd $t1, 0($s7)
	sd $t0, 0($s6)
	j loop

ingresar_tecla: daddi $t0, $0, 9
	sd $t0, 0($s6)
	ld $v0, 0($s7)
	jr $ra
