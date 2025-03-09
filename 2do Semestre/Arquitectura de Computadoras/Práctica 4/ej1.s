a) dadd r1, r2, r0 (Asignación de registro)
Le pasa a r1 el valor de r2. Su equivalente (o por lo menos uno de ellos) sería "mov REG, REG2"

b) daddi r3, r0, 5 (Asignación valor inmediato)
Le pasa al registro r3, en modo inmediato (suma 0 + 5), un 5. Su equivalente sería "mov REG, 5"

c) dsub r4, r4, r4 (Dejar un registro en 0)
Le resta a r4 lo que está dentro de r4. Su equivalente sería "sub REG, REG"

d) daddi r5, r5, -1 (Suma de registro con valor inmediato)
Le suma (resta) -1 al valor del registro r5. Su equivalente sería "add REG, -1"

e) xori r6, r6, 0xffffffffffffffff (XOR con valor inmediato)
Le hace una operación XOR con un valor inmediato al valor del r5. Su equivalente sería "xor REG, 0FFFFh"
