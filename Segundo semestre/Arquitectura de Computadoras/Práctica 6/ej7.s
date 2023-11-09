.data 
	CONTROL: .word32 0x10000 
	DATA: .word32 0x10008
	numero: .word 0
	color_negro: .word32 0xFF000000
	coordX: .byte 0
	coordY: .byte 0
.text
	;CONFIGURACIÓN DE E/S Y DE PILA
	lwu $s0, CONTROL($0)
	lwu $s1, DATA($0)
	daddi $sp, $sp, 0x3F0
	sd $s0, 0($sp)
	sd $s1, 8($sp)
	
	;LIMPIAR PANTALLA GRÁFICA
	daddi $t0, $0, 6; Código para limpiar pantalla alfanumérica
	lb $s3, coordX($0); Cargar coordenadas en este momento para
	lb $s4, coordY($0); Evitar atasco por WAW (anti-dependencia)
	sd $t0, 0($s0);   Enviárselo a CONTROL
	lwu $s2, color_negro($0); Cargar color negro

	;PEDIR INPUT
lazo:	daddi $t1, $0, 9; Código para pedir que se ingrese un carácter
	sd $t1, 0($s0);   Enviárselo a CONTROL
	lb $t0, 0($s1);   Obtener carácter
	slti $t2, $t0, 0x40; COMPROBAR QUE EL DATO ES MENOR QUE '9'
	beqz $t2, lazo
	slti $t2, $t0, 0x30; COMPROBAR QUE EL DATO ES MAYOR QUE '0'
	bnez $t2, lazo
	sb $t0, numero($0); Guardarlo en memoria
	daddi $t1, $0, 5; Comando para dibujar
	slti $t2, $t0, 0x31
	bnez $t2, dibujar_cero
	slti $t2, $t0, 0x32
	bnez $t2, dibujar_uno
	slti $t2, $t0, 0x33
	bnez $t2, dibujar_dos
	slti $t2, $t0, 0x34
	bnez $t2, dibujar_tres
	slti $t2, $t0, 0x35
	bnez $t2, dibujar_cuatro
	slti $t2, $t0, 0x36
	bnez $t2, dibujar_cinco
	slti $t2, $t0, 0x37
	bnez $t2, dibujar_seis
	slti $t2, $t0, 0x38
	bnez $t2, dibujar_siete
	slti $t2, $t0, 0x39
	bnez $t2, dibujar_ocho
	;DIBUJAR NUEVE
	jal dibujar_trozo2
	jal dibujar_trozo3
	jal dibujar_trozo4
	jal dibujar_trozo5
	jal dibujar_trozo6
	j terminar_programa

	;DIBUJAR CERO
dibujar_cero: jal dibujar_trozo0
	jal dibujar_trozo1
	jal dibujar_trozo2
	jal dibujar_trozo4
	jal dibujar_trozo5
	jal dibujar_trozo6
	j terminar_programa

	;DIBUJAR UNO
dibujar_uno: jal dibujar_trozo2
	jal dibujar_trozo5
	j terminar_programa

	;DIBUJAR DOS
dibujar_dos: jal dibujar_trozo0
	jal dibujar_trozo1
	jal dibujar_trozo3
	jal dibujar_trozo5
	jal dibujar_trozo6
	j terminar_programa

	;DIBUJAR TRES
dibujar_tres: jal dibujar_trozo0
	jal dibujar_trozo2
	jal dibujar_trozo3
	jal dibujar_trozo5
	jal dibujar_trozo6
	j terminar_programa

	;DIBUJAR CUATRO
dibujar_cuatro: jal dibujar_trozo2
	jal dibujar_trozo3
	jal dibujar_trozo4
	jal dibujar_trozo5
	jal dibujar_trozo6
	j terminar_programa

	;DIBUJAR CINCO
dibujar_cinco: jal dibujar_trozo0
	jal dibujar_trozo2
	jal dibujar_trozo3
	jal dibujar_trozo4
	jal dibujar_trozo6
	j terminar_programa

	;DIBUJAR SEIS
dibujar_seis: jal dibujar_trozo0
	jal dibujar_trozo1
	jal dibujar_trozo2
	jal dibujar_trozo3
	jal dibujar_trozo4
	jal dibujar_trozo6
	j terminar_programa

	;DIBUJAR SIETE
dibujar_siete: jal dibujar_trozo2
	jal dibujar_trozo4
	jal dibujar_trozo5
	jal dibujar_trozo6
	j terminar_programa

	;DIBUJAR OCHO
dibujar_ocho: jal dibujar_trozo0
	jal dibujar_trozo1
	jal dibujar_trozo2
	jal dibujar_trozo3
	jal dibujar_trozo4
	jal dibujar_trozo5
	jal dibujar_trozo6
terminar_programa: halt

dibujar_pixel: daddi $t1, $0, 5; Comando para dibujar
	lwu $s0, 8($sp)
	lwu $s1, 0($sp)
	sw $s2, 0($s1);    COLOR
	sb $a0, 4($s1);    X
	sb $a1, 5($s1);    Y
	sd $t1, 0($s0); CÓDIGO
	jr $ra

dibujar_trozo0: daddi $sp, $sp, -8;                 (2, 1) (3, 1) (4, 1)
	sd $ra, 0($sp); Guardar dirección de retorno
	daddi $a0, $0, 2; X
	daddi $a1, $0, 1; Y
	jal dibujar_pixel
	daddi $a0, $0, 3; X
	jal dibujar_pixel
	daddi $a0, $0, 4; X
	jal dibujar_pixel
	;Desapilarla
	ld $ra, 0($sp)
	daddi $sp, $sp, 8
	jr $ra

dibujar_trozo1: daddi $sp, $sp, -8;                (1, 2) (1, 3) (1, 4)
	sd $ra, 0($sp); Guardar dirección de retorno
	daddi $a1, $0, 2; Y
	daddi $a0, $0, 1; X
	jal dibujar_pixel
	daddi $a1, $0, 3; Y
	jal dibujar_pixel
	daddi $a1, $0, 4; Y
	jal dibujar_pixel
	;Desapilarla
	ld $ra, 0($sp)
	daddi $sp, $sp, 8
	jr $ra

dibujar_trozo2: daddi $sp, $sp, -8;               (5, 2) (5, 3) (5, 4)
	sd $ra, 0($sp); Guardar dirección de retorno
	daddi $a1, $0, 2; Y
	daddi $a0, $0, 5; X
	jal dibujar_pixel
	daddi $a1, $0, 3; Y
	jal dibujar_pixel
	daddi $a1, $0, 4; Y
	jal dibujar_pixel
	;Desapilarla
	ld $ra, 0($sp)
	daddi $sp, $sp, 8
	jr $ra

dibujar_trozo3: daddi $sp, $sp, -8;               (2, 5) (3, 5) (4, 5)
	sd $ra, 0($sp); Guardar dirección de retorno
	daddi $a0, $0, 2; X
	daddi $a1, $0, 5; Y
	jal dibujar_pixel
	daddi $a0, $0, 3; X
	jal dibujar_pixel
	daddi $a0, $0, 4; X
	jal dibujar_pixel
	;Desapilarla
	ld $ra, 0($sp)
	daddi $sp, $sp, 8
	jr $ra

dibujar_trozo4: daddi $sp, $sp, -8;               (1, 6) (1, 7)
	sd $ra, 0($sp); Guardar dirección de retorno
	daddi $a1, $0, 6; Y
	daddi $a0, $0, 1; X
	jal dibujar_pixel
	daddi $a1, $0, 7; Y
	jal dibujar_pixel
	;Desapilarla
	ld $ra, 0($sp)
	daddi $sp, $sp, 8
	jr $ra

dibujar_trozo5: daddi $sp, $sp, -8;              (5, 6) (5, 7)
	sd $ra, 0($sp); Guardar dirección de retorno
	daddi $a1, $0, 6; Y
	daddi $a0, $0, 5; X
	jal dibujar_pixel
	daddi $a1, $0, 7; Y
	jal dibujar_pixel
	;Desapilarla
	ld $ra, 0($sp)
	daddi $sp, $sp, 8
	jr $ra

dibujar_trozo6: daddi $sp, $sp, -8;              (2, 8) (3, 8) (4, 8)
	sd $ra, 0($sp); Guardar dirección de retorno
	daddi $a0, $0, 2; X
	daddi $a1, $0, 8; Y
	jal dibujar_pixel
	daddi $a0, $0, 3; X
	jal dibujar_pixel
	daddi $a0, $0, 4; X
	jal dibujar_pixel
	;Desapilarla
	ld $ra, 0($sp)
	daddi $sp, $sp, 8
	jr $ra
