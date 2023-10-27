.data
	cadena1: .asciiz "winmips"
	cadena2: .asciiz "winmivs"
	longitud: .word 7
	coincidencias: .word 0
	pos: .word 0
.code
	daddi $a0, $zero, 0; Inicializar desplazador en 0
	ld $a1, longitud($zero); Longitud de las cadenas
	jal analizarCadena
	sd $v0, pos($zero)
	halt

analizarCadena: daddi $t3, $zero, 0; Para contar las coincidencias
	lazo:	ld $t1, cadena1($a0); Cadena 1
		ld $t2, cadena2($a0); Cadena 2
		bne $t1, $t2, saltar; Si $t1 =/= $t2
			daddi $t3, $t3, 1; Incrementar la cant. de coincidencias
	saltar: daddi $a0, $a0, 1; Ir al próximo carácter
		bne $a0, $a1, lazo; Si el desplazamiento no es igual que la longitud...
		bne $t3, $a1, saltar2
			daddi $v0, $zero, -1; Setear $v0 en -1
			j terminar
	saltar2: dadd $v0, $zero, $a0
	terminar: jr $ra
