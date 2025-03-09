.data
	cadena: .asciiz "adbdcdedfdgdhdid" ; cadena a analizar
	car: .asciiz "d" ; caracter buscado
	cant: .word 0 ; cantidad de veces que se repite el caracter car en cadena.
.code
	dadd r1, r0, r0
	lbu r2, car(r0)
	ld r3, cant(r0)
	daddi r4, r0, 16
	loop: lbu r5, cadena(r1)
		daddi r1, r1, 1
		daddi r4, r4, -1
		bne r5, r2, avanzar
			daddi r3, r3, 1 
	avanzar: bnez r4, loop
	sd r3, cant(r0)
	halt
