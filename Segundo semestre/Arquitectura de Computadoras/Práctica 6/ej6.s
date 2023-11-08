.data 
	coorX: .byte 0 ; coordenada X de un punto
	coorY: .byte 0 ; coordenada Y de un punto
	color: .byte 0, 0, 0, 255; color: máximo rojo + máximo azul => magenta
	CONTROL: .word32 0x10000 
	DATA: .word32 0x10008 
.text 
	;INICIALIZAR E/S Y PILA
	daddi $sp, $sp, 0x400
	lwu $s6, CONTROL($zero) ; $s6 = dirección de CONTROL 
	lwu $s7, DATA($zero) ; $s7 = dirección de DATA
	daddi $sp, $sp, -16
	sd $s6, 0($sp)
	sd $s7, 8($sp)

	;LIMPIAR PANTALLA
	daddi $t0, $zero, 7 ; $t0 = 7 -> función 7: limpiar pantalla gráfica 
	sd $t0, 0($s6) ; CONTROL recibe 7 y limpia la pantalla gráfica

	;INGRESAR COORDENADAS
	jal ingr_dato
	sb $v0, coorX($0); Guardar coordenada X
	sb $v0, 5($s7); DATA + 5 = X
	jal ingr_dato
	sb $v0, coorY($0); Guardar coordenada Y
	sb $v0, 4($s7); DATA + 4 = Y

	;INGRESAR COLOR
	lwu $s2, color($0)
	sw $s2, 0($s7) ; DATA recibe el valor del color a pintar (el R del RGB)
	jal ingr_dato
	sb $v0, 0($s7); Guardar color R

	;IMPRIMIR PUNTO Y TERMINAR PROGRAMA
	daddi $t0, $zero, 5 ; $t0 = 5 -> función 5: salida gráfica 
	sd $t0, 0($s6) ; CONTROL recibe 5 y produce el dibujo del punto
	daddi $sp, $sp, 16
	halt

;EL DATO SE RECIBE POR EL REGISTRO DE SALIDA V0
ingr_dato: ld $t0, 0($sp); CONTROL
	   ld $t1, 8($sp); DATA
	daddi $t2, $0, 8;  Código para ingresar un número
	sd $t2, 0($t0);    Enviar el código a CONTROL
	ld $v0, 0($t1);    Recibir input en V0
	jr $ra
