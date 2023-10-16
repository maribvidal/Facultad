.data
	A: .word 1; num entero 1
	B: .word 2; num entero 2
	C: .word 1; num entero 3
	D: .word 0; Contador de numeros coincidentes
.code
	ld r1, A(r0); Cargar datos en los registros
	ld r2, B(r0)
	ld r3, C(r0)
	dadd r4, r0, r0; Inicializar registro en 0
	bne r1, r2, salti
		daddi r4, 1; Sumarle 1 al registro
salti: bne r1, r3, salta
		  daddi r4, 1
salta: bne r2, r3, salte
		  daddi r4, 1
salte: sd r4, D(r0)
	halt
