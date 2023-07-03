org 1000h
NUM1L DW 0FFFFH
NUM1H DW 0A002H
NUM2L DW 01H
NUM2H DW 02H
RESUL DW ?; 4 bytes
RESUH DW ?; 4 bytes
BIEN DB ?
MAL DB ?

org 2000h
MOV AX, NUM1L; Asignar la parte baja (los ultimos 4 bytes) del NUM1
MOV BX, NUM1H; Asignar la parte alta (los primeros 4 bytes) del NUM1
MOV CX, NUM2L; Asignar la parte baja (los ultimos 4 bytes) del NUM2
MOV DX, NUM2H; Asignar la parte alta (los primeros 4 bytes) del NUM2
ADD AX, CX; Sumar la parte baja de NUM1 con la de NUM2
ADC BX, DX; Suma la parte alta de NUM1 con la de NUM2 + carry
MOV RESUL, AX
MOV RESUH, BX
JO OVERFLOW; Preguntar si hubo overflow (osea que el resultado dió mal en CA2)
MOV BIEN, 0FFH
JMP FIN
OVERFLOW: MOV MAL, 0FFH
FIN: hlt
end
