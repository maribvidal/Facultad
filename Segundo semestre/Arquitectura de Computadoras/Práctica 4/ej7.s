.data
	tabla: .word 1, 2, 4, 8, 16, 32, 64, 128, 256, 512; Tabla de 10 numeros
	numx: .word 50
	cant: .word 0
	res: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; Dejar espacios en memoria reservados

.code
	daddi r1, r0, 0; Dejar el registro r1 como índice
	ld r2, numx(r0); Cargar el número X
	dadd r3, r3, r0; Dejar el registro r3 en 0
	dadd r4, r4, r0; Inicializar registro en 0 para usarlo para RES
	daddi r6, r0, 80; LONGITUD
loop:	ld r5, tabla(r1); Cargar en R5 la tabla con desplazamiento R1 (0 la primera vez)
	slt r4, r5, r2; Comparar a R5 con R2, y guardar el '1' en R4
	bnez r4, es_menor
		daddi r4, r0, 1; Ponerlo en 1 porque el numero es mayor
		daddi r3, r0, 1; Incrementar contador
		sd r4, res(r1)
		j avanzar	
es menor:
		dadd r4, r0, r0; Ponerlo en 0 porque el numero es menor
		sd r4, res(r1)
avanzar:daddi r1, r1, 8
	bnez r1, r6 loop
	halt
