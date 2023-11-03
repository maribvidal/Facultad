.data
	dirControl: .word32 0x10000
	dirData: .word32 0x10008
	texto: .asciiz "Hola mundo"
	longitud: .word 10
.code
	;INICIALIZAR PUERTO DE E/S
	lwu $s0, dirControl($0)
	lwu $s1, dirData($0)
	ld $t1, longitud($0)
	
	;LIMPIAR LA PANTALLA
	daddi $t0, $0, 6
	sd $t0, dirControl($s0)

	;INGRESAR CARÁCTERES
	daddi $t3, $0, texto; Pasar dirección
lazo:	daddi $t0, $0, 9;     CODIGO - Ingresar carácter
	sd $t0, 0($s0);                Pasar código
	lbu $t2, 0($s1);       Retornar la letra ingresada
	sb $t2, 0($t3);	      Guardar letra en dirección
	daddi $t3, $t3, 1;    Pasar a la próxima dirección
	daddi $t1, $t1, -1
	bnez $t1, lazo

	;IMPRIMIRLOS
	daddi $t0, $0, texto
	sd $t0, 0($s1)
	daddi $t0, $0, 4;     CODIGO - Imprimir
	sd $t0, 0($s0)
	halt
