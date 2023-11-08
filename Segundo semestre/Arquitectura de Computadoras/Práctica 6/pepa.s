;intenté hacer a lain, prob dsp lo termine
.data 
	CONTROL: .word32 0x10000 
	DATA: .word32 0x10008
	color_marron: .word32 0x000C0C50
	color_blanco: .word32 0x00FFFFFF
	color_negro: .word32 0xFF000000
	color_piel: .word32 0x00A0CBFF
.code
	lwu $s5, CONTROL($0)
	lwu $s6, DATA($0)
	daddi $s4, $0, 5; Comando para dibujar

	;EJEMPLO
	;BLOQUE COLOR PIEL
	ld $a3, color_piel($0); Color
	daddi $t0, $0, 30; Y
	daddi $t1, $0, 8; Contador
lazo:   daddi $a0, $0, 10; Longitud
	dadd $a1, $0, $t0; Coordenada Y principal
	daddi $a2, $0, 20; Coordenada X principal
	jal dibujar_linea
	daddi $t0, $t0, -1
	daddi $t1, $t1, -1
	bnez $t1, lazo

	;LINEAS MARRONES
	;Cabello
	daddi $a0, $0, 10; Longitud
	daddi $a1, $0, 30; Coordenada Y principal
	daddi $a2, $0, 20; Coordenada X principal
	ld $a3, color_marron($0); Color
	jal dibujar_linea

	daddi $a0, $0, 6; Longitud
	daddi $a1, $0, 31; Coordenada Y principal
	daddi $a2, $0, 22; Coordenada X principal
	jal dibujar_linea

	daddi $a0, $0, 2; Longitud
	daddi $a1, $0, 29; Coordenada Y principal
	daddi $a2, $0, 19; Coordenada X principal
	jal dibujar_linea
	daddi $a0, $0, 2; Longitud
	daddi $a1, $0, 28; Coordenada Y principal
	daddi $a2, $0, 19; Coordenada X principal
	jal dibujar_linea

	daddi $a0, $0, 3; Longitud
	daddi $a1, $0, 29; Coordenada Y principal
	daddi $a2, $0, 29; Coordenada X principal
	jal dibujar_linea
	daddi $a0, $0, 2; Longitud
	daddi $a1, $0, 28; Coordenada Y principal
	daddi $a2, $0, 30; Coordenada X principal
	jal dibujar_linea

	;Mechon
	daddi $a0, $0, 4; Longitud
	daddi $a1, $0, 28; Coordenada Y principal
	daddi $a2, $0, 30; Coordenada X principal
	jal dibujar_vert

	;Ojos?
	ld $a3, color_blanco($0); Color
	daddi $a0, $0, 2; Longitud
	daddi $a1, $0, 28; Coordenada Y principal
	daddi $a2, $0, 22; Coordenada X principal
	jal dibujar_vert
	daddi $a0, $0, 2; Longitud
	daddi $a1, $0, 28; Coordenada Y principal
	daddi $a2, $0, 27; Coordenada X principal
	jal dibujar_vert
	ld $a3, color_negro($0); Color
	daddi $a0, $0, 2; Longitud
	daddi $a1, $0, 28; Coordenada Y principal
	daddi $a2, $0, 23; Coordenada X principal
	jal dibujar_vert
	daddi $a0, $0, 2; Longitud
	daddi $a1, $0, 28; Coordenada Y principal
	daddi $a2, $0, 26; Coordenada X principal
	jal dibujar_vert

	;Boca
	daddi $a0, $0, 3; Longitud
	daddi $a1, $0, 24; Coordenada Y principal
	daddi $a2, $0, 24; Coordenada X principal
	jal dibujar_linea
	halt

;Para dibujar línea horizontal
;Se modífica la coordenada X de manera positiva
dibujar_linea: sw $a3, 0($s6);  Color
	loop:  	sb $a1, 4($s6); Coordenada Y
	       	sb $a2, 5($s6); Coordenada X
		sd $s4, 0($s5); Dibujar
		daddi $a2, $a2, 1
		daddi $a0, $a0, -1
		bnez $a0, loop
	jr $ra

;Para dibujar línea vertical
;Se modifica la coordenada Y de manera negativa
dibujar_vert: sw $a3, 0($s6);  Color
	lup:  	sb $a1, 4($s6); Coordenada Y
	       	sb $a2, 5($s6); Coordenada X
		sd $s4, 0($s5); Dibujar
		daddi $a1, $a1, -1
		daddi $a0, $a0, -1
		bnez $a0, lup
	jr $ra
