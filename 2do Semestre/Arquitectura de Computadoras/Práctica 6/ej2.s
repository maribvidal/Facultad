.data
	dirControl: .word32 0x10000
	dirData: .word32 0x10008
	str_cero: .asciiz "CERO"
	str_uno: .asciiz "UNO"
	str_dos: .asciiz "DOS"
	str_tres: .asciiz "TRES"
	str_cuatro: .asciiz "CUATRO"
	str_cinco: .asciiz "CINCO"
	str_seis: .asciiz "SEIS"
	str_siete: .asciiz "SIETE"
	str_ocho: .asciiz "OCHO"
	str_nueve: .asciiz "NUEVE"
.code
	;INICIALIZAR PUERTO DE E/S y la pila
	lwu $s0, dirControl($0)
	lwu $s1, dirData($0)
	daddi $sp, $0, 0x3F0
	sd $s1, 0($sp) ;Guardar valores en la pila
	sd $s0, 8($sp)
	jal ingreso
	dadd $a0, $0, $v0; Usar el dato obtenido de salida como entrada
	jal muestra
	daddi $sp, $sp, 16
	halt

ingreso:	ld $s0, 8($sp)
		ld $s1, 0($sp)
ciclo:		daddi $t0, $0, 0
		daddi $t1, $0, 8
		sd $t1, 0($s0)
		ld $v0, 0($s1)
		slti $t0, $v0, 10
		beqz $t0, ciclo
		slti $t0, $v0, 0
		bnez $t0, ciclo
		jr $ra

muestra:	ld $s0, 8($sp)
		ld $s1, 0($sp)
		daddi $t1, $0, 8
		dmul $t1, $t1, $a0
		daddi $t0, $0, str_cero
		dadd $t0, $t0, $t1
		sd $t0, 0($s1)
		daddi $t0, $0, 4
		sd $t0, 0($s0)
		jr $ra
