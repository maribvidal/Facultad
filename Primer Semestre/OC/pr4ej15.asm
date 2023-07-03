ORG 1000H
TABLA1 DW 0FFFFh, 0FFh, 20, 30; 3 elementos de 4 bytes
       DW 01, 10, 20, 30
       DW 02, 10, 20, 30
TABLA2 DW 0FFFFh, 0FFh, 10, 10; 3 elementos de 4 bytes
       DW 01, 10, 10, 10
       DW 01, 10, 10, 10
TABLA3 DW ?, ?, ?, ?; 3 elementos de 4 bytes
       DW ?, ?, ?, ?
       DW ?, ?, ?, ?
CANT DB 12
F_CARRY DB 0; Celda de memoria para el Carry
F_OVER DB 0; Celda de memoria para el Overflow
DIR3 Dw ?

ORG 2000H
MOV AX, OFFSET TABLA1; Mover a AX la dirección de la TABLA1
MOV CX, OFFSET TABLA2; Mover a AX la dirección de la TABLA1
MOV DIR3, OFFSET TABLA3; Mover la dirección de la TABLA3
LAZO: MOV BX, AX; Mover a BX la dirección contenida en AX (TABLA1)
 MOV DX, [BX]; Mover en DX lo que está contenido en la dirección de BX
 MOV BX, CX; Mover a BX la dirección contenida en CX (TABLA2)
 ADD DX, [BX]
 JNC : NO_CARRY
 ADD DX, F_CARRY; (Reg <- Mem, sumar el CARRY)
 MOV F_CARRY, 1; Si hubo Carry asignar un 1
 JMP LAZO_2
 NO_CARRY: ADD DX, F_CARRY; (Reg <- Mem, sumar el CARRY)
 MOV F_CARRY, 0; No hubo Carry
 LAZO_2: NOP
 JNO : NO_OVER
 MOV F_OVER, 1; Si hubo Overflow
 JMP LAZO_3
 NO_OVER: MOV F_OVER, 0; No hubo Overflow
 LAZO_3: MOV BX, DIR3
 MOV [BX], DX; Guardar resultado de la suma en la dirección de DIR3
 ADD AX, 2; Incrementamos la dirección de la TABLA1 en 2 porque son de 4 bytes
 ADD CX, 2; Incrementamos la dirección de la TABLA2 en 2 porque son de 4 bytes
 ADD DIR3, 2; Incrementamos la dirección de la TABLA3 en 2 porque son de 4 bytes
 DEC CANT; Decrementamos la cantidad guardada en una dir. de memoria
 JNZ LAZO; Si CANT es diferente de 0, entonces seguire ejecutando el LAZO
FIN: HLT
END
