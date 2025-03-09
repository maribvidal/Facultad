.data
	num1: .word 5
	num2: .word 3
	res: .word 0
.code
	ld r1, num1(r0)
	ld r2, num2(r0)
	dadd r3, r1, r0; Pasar el 5 a un registro temporal
	daddi r2, r2, -1
	loop: daddi r2, r2, -1
		bnez r2, loop
		dadd r1, r1, r3
	sd r1, res(r0)
	halt
