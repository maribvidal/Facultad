.data
	cadena1: .asciiz "pejelagarto"
	cadena2: .asciiz "pejerracapa"
	longitud: .word 11
	posicion: .word 0
.text
	daddi $a0, $0, cadena1; Dirección de la primera cadena
	daddi $a1, $0, cadena2; Dirección de la segunda cadena
	ld $a2, longitud($0);   Longitud de ambas cadenas
	jal comprobar;          Invocar la subrutina
	sd $v0, posicion($0);   Guardar la posición
	halt;                   Terminar el programa

comprobar: daddi $t0, $0, 0;    Lleva la cuenta del número de letra de la cadena
	lazo: 	lbu $t1, 0($a0)
		lbu $t2, 0($a1)
		beq $t1, $t2, saltar
		dadd $v0, $0, $t0; Guardar número de $t0 en el registro de salida
		j terminar
	saltar:	daddi $t0, $t0, 1;  Incrementar contador
		daddi $a0, $a0, 1
		daddi $a1, $a1, 1
		bne $t0, $a2, lazo; Mientras $t0 no sea igual a $a2 (la longitud de ambas cadenas...)
		daddi $v0, $0, -1;  Si se leyó la cadena entera y no se encontró diferencia, entonces...
	terminar: jr $ra; Retonar al programa principal
