ORG 1000H
mantisa db 00000110b; Mantisa (2 a la -2) BS
exponente db 1000b; Exponente 8 BSS

ORG 3000H; Subrutinas
ajustar: NOP
DEC AL; Decrementar el exponente
JO  no_posible; Si dió overflow es porque no es posible
ADD AH, AH; Sumar mantisa a la misma mantisa para doblarla
JC no_posible; Si la operación anterior devuelve carry, entonces
MOV BL, 00H
jmp final
no_posible: MOV BL, 0FFH; Si no es posible el ajuste...
final: RET

ORG 2000H
MOV AH, mantisa
MOV AL, exponente
CALL ajustar
HLT
END
