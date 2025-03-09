;eee da pedotita (implementación horrible hecha con paja, se debería hacer hecho con pila pienso)
.data 
	CONTROL: .word32 0x10000 
	DATA: .word32 0x10008 
	color_pelota: .word32 0x00FF0000 ; Azul 
	color_fondo: .word32 0x00FFFFFF ; Blanco 
	color_verde: .word32 0x0000FF00 ; Azul 
.text
	lwu $s6, CONTROL($zero) 
	lwu $s7, DATA($zero) 
	lwu $v0, color_pelota($zero) 
	lwu $v1, color_fondo($zero)
	lwu $t6, color_verde($zero)
	daddi $s0, $zero, 23 ; Coordenada X de la pelota 
	daddi $s1, $zero, 1 ; Coordenada Y de la pelota 
	daddi $s2, $zero, 1 ; Dirección X de la pelota 
	daddi $s3, $zero, 1 ; Dirección Y de la pelota 
	daddi $s4, $zero, 5 ; Comando para dibujar un punto
	;SEGUNDA PELOTA
	daddi $t2, $zero, 15; X
	daddi $t3, $zero, 5; Y
	daddi $t4, $zero, 1; Dir X
	daddi $t5, $zero, 1; Dir Y
loop: sw $v1, 0($s7) ; Borra la pelota 
	sb $s0, 4($s7) 
	sb $s1, 5($s7) 
	sd $s4, 0($s6)
	sb $t2, 4($s7)
	sb $t3, 5($s7)
	sd $s4, 0($s6)
	dadd $s0, $s0, $s2 ; Mueve la pelota en la dirección actual
	dadd $t2, $t2, $t4 ; Mueve la pelota_2 en la dirección actual
	dadd $s1, $s1, $s3 
	dadd $t3, $t3, $t5

	daddi $t1, $zero, 48 ; Comprueba que la pelota no esté en la columna de más 
	slt $t0, $t1, $s0 ; a la derecha. Si es así, cambia la dirección en X. 
	dsll $t0, $t0, 1 
	dsub $s2, $s2, $t0

	slt $t0, $t1, $s1 ; Comprueba que la pelota no esté en la fila de más arriba. 
	dsll $t0, $t0, 1 ; Si es así, cambia la dirección en Y. 
	dsub $s3, $s3, $t0

	slti $t0, $s0, 1 ; Comprueba que la pelota no esté en la columna de más 
	dsll $t0, $t0, 1 ; a la izquierda. Si es así, cambia la dirección en X. 
	dadd $s2, $s2, $t0 

	slti $t0, $s1, 1 ; Comprueba que la pelota no esté en la fila de más abajo. 
	dsll $t0, $t0, 1 ; Si es así, cambia la dirección en Y. 
	dadd $s3, $s3, $t0

	daddi $t1, $zero, 48 ; Hacer lo mismo para la pelota 2
	slt $t0, $t1, $t2 ; a la derecha. Si es así, cambia la dirección en X. 
	dsll $t0, $t0, 1 
	dsub $t4, $t4, $t0

	slt $t0, $t1, $t3 ; Comprueba que la pelota 2 no esté en la fila de más arriba. 
	dsll $t0, $t0, 1 ; Si es así, cambia la dirección en Y. 
	dsub $t5, $t5, $t0

	slti $t0, $t2, 1 ; Comprueba que la pelota 2 no esté en la columna de más 
	dsll $t0, $t0, 1 ; a la izquierda. Si es así, cambia la dirección en X. 
	dadd $t4, $t4, $t0 

	slti $t0, $t3, 1 ; Comprueba que la pelota no esté en la fila de más abajo. 
	dsll $t0, $t0, 1 ; Si es así, cambia la dirección en Y. 
	dadd $t5, $t5, $t0

	sw $v0, 0($s7) ; Dibuja la pelota. 
	sb $s0, 4($s7) 
	sb $s1, 5($s7) 
	sd $s4, 0($s6)
	sw $t6, 0($s7);  Dibuja la segunda pelota.
	sb $t2, 4($s7)
	sb $t3, 5($s7)
	sd $s4, 0($s6)
	daddi $t0, $zero, 1000 ; Hace una demora para que el rebote no sea tan rápido. 
demora: daddi $t0, $t0, -1 ; Esto genera una infinidad de RAW y BTS pero... 
	bnez $t0, demora ; ¡hay que hacer tiempo igualmente! 
	j loop
	halt
