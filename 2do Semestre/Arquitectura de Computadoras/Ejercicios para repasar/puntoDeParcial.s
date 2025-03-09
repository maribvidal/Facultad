.data
	tabla1: .word 4, 2, 4, 6, 8, 10
	tabla2: .word 8, 6, 4, 1, 10, 12
	min_tabla1: .word 0
	max_tabla1: .word 0
	min_tabla2: .word 0
	max_tabla2: .word 0
	cant_elem: .word 6
	CONTROL: .word32 0x10000
	DATA: .word32 0x10008
	COLOR_VERDE: .byte 0, 255, 0, 0
	COLOR_AZUL: .byte 0, 0, 255, 0
.code
	lwu $s6, CONTROL($0)
	lwu $s7, DATA($0)
	
	;OBTENER MINMAX de la primera tabla
	daddi $a0, $0, tabla1
	ld $a1, cant_elem($0)
	jal min_max
	sd $v0, min_tabla1($0)
	sd $v1, max_tabla1($0)

	;OBTENER MINMAX de la segunda tabla
	daddi $a0, $0, tabla2
	ld $a1, cant_elem($0)
	jal min_max
	sd $v0, min_tabla2($0)
	sd $v1, max_tabla2($0)

	;DIBUJAR PUNTO VERDE en MIN_TABLA2, MAX_TABLA2
	daddi $t0, $0, 5; - Código de dibujo
	lwu $t1, COLOR_VERDE($0)
	sw $t1, 0($s7)
	lb $t2, min_tabla2($0)
	sb $t2, 4($s7)
	lb $t2, max_tabla2($0)
	sb $t2, 5($s7)
	sd $t0, 0($s6);  - Dibujar

	;DIBUJAR PUNTO AZUL en MIN_TABLA1, MAX_TABLA1
	lwu $t1, COLOR_AZUL($0)
	sw $t1, 0($s7)
	lb $t2, min_tabla1($0)
	sb $t2, 4($s7)
	lb $t2, max_tabla1($0)
	sb $t2, 5($s7)
	sd $t0, 0($s6);  - Dibujar

	halt

;$A0 RECIBE TABLA - $A1 RECIBE CANTIDAD DE ELEMENTOS
;$V0 OBTENER ELEMENTO MENOR - $V1 OBTENER ELEMENTO MAYOR
min_max: daddi $v0, $0, 99; - elemento menor
	daddi $v1, $0, 0;  - elemento mayor
lazo:	ld $t1, 0($a0)
	slt $t2, $v0, $t1;  - ver si T0 (elem. menor) es menor que T1 (elem. actual)
	bnez $t2, buscar_mayor
		daddi $v0, $t1, 0; - Actualizar elemento menor
buscar_mayor: slt $t2, $t1, $v1; - ver si T1 (elem. actual) es menor que T3 (elem. mayor)
	bnez $t2, saltar;        - si T1 es menor que T3, saltar
	beq $t1, $v1, saltar;    - si ambos numeros son iguales, saltar
		daddi $v1, $t1, 0; - Actualizar elemento mayor
saltar:	daddi $a0, $a0, 8;	- Ir al próximo elemento de la tabla
	daddi $a1, $a1, -1
	bnez $a1, lazo
	jr $ra
