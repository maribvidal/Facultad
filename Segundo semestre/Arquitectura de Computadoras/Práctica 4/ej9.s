.data
	valorA: .word 5
	valorX: .word 1
	valorY: .word 2
.code
	ld r1, valorA(r0)
	ld r2, valorX(r0)
	ld r3, valorY(r0)
	loop: daddi r1, r1, -1
		bne r1, r0, loop
		dadd r2, r2, r3
	halt
