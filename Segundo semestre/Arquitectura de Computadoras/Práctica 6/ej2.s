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
	daddi $sp, $0, 0x400
	daddi $sp, $sp, -16
	sd $s1, 0($sp) ;Guardar valores en la pila
	sd $s0, 8($sp)
	jal ingreso
	dadd $a0, $0, $v0; Usar el dato obtenido de salida como entrada
	jal muestra
	daddi $sp, $sp, 16
	halt

ingreso:	ld $s1, 0($sp)
		ld $s0, 8($sp)
ciclo:		daddi $t0, $0, 0;  Para hacer slti
		daddi $t1, $0, 8; NÚMERO DE INGRESO
		sd $t1, 0($s0); Pedir dato
		ld $v0, 0($s1); Recibir dato
		slti $t0, $v0, 10
		beqz $t0, ciclo
		slti $t0, $v0, 0
		bnez $t0, ciclo
		jr $ra; Se verificó que $v0 fuera un valor

muestra:	ld $s0, 8($sp)
		ld $s1, 0($sp)
		daddi $t1, $0, 0
		slti $t1, $a0, 1
		beqz $t1, num_1
		daddi $t0, $0, str_cero
		j terminar
num_1:		slti $t1, $a0, 2
		beqz $t1, num_2
		daddi $t0, $0, str_uno
		j terminar
num_2:	slti $t1, $a0, 3
	beqz $t1, num_3
	daddi $t0, $0, str_dos
	j terminar
num_3:		slti $t1, $a0, 4
		beqz $t1, num_4
		daddi $t0, $0, str_tres
		j terminar
num_4:	slti $t1, $a0, 5
	beqz $t1, num_5
	daddi $t0, $0, str_cuatro
	j terminar
num_5:		slti $t1, $a0, 6
		beqz $t1, num_6
		daddi $t0, $0, str_cinco
		j terminar
num_6:	slti $t1, $a0, 7
	beqz $t1, num_7
	daddi $t0, $0, str_seis
	j terminar
num_7:		slti $t1, $a0, 8
		beqz $t1, num_8
		daddi $t0, $0, str_siete
		j terminar
num_8:	slti $t1, $a0, 9
	beqz $t1, num_9
	daddi $t0, $0, str_ocho
	j terminar
num_9:	daddi $t0, $0, str_nueve
terminar: sd $t0, 0($s1)
	daddi $t0, $0, 4; CÓDIGO DE LECTURA DE STRING
	sd $t0, 0($s0)
	jr $ra	
