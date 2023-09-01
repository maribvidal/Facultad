;Escribir un programa que calcule la suma de dos números de 32 bits 
;almacenados en la memoria llamando a una 
;subrutina SUM32, que reciba los parámetros de entrada por valor a través de la pila, 
;y devuelva el resultado también por referencia a través de la pila. 

ORG 1000h
num1h DW 1234H
num1l DW 5678H
num2h DW 1111H
num2l DW 0FFFFH
resH DW ?
resL DW ?

ORG 3000h
SUM32: nop
mov DX, 00h; Inicializarlo en 0 para luego guardar el CARRY
mov BX, SP; Pasarle a BX la dirección de la pila
add BX, 8; Acceder a NUM1L
mov AX, [BX]; Pasarle el número a AX
sub BX, 4; Acceder a NUM2L
add AX, [BX]; Sumarle el número a AX (NUM1L + NUM2L)
adc DX, 0; Si hay CARRY, dejarlo en DX
add BX, 2; Acceder a NUM1H
mov CX, [BX]; Pasarle el número a CX
sub BX, 4; Acceder a NUM2H
add CX, [BX]; Sumarle el número a CX
add CX, DX; Si hay CARRY del cálculo pasado, sumárselo
mov WORD PTR [BX], CX; Pasar el resultado de la parte alta a la PILA
add BX, 2
mov WORD PTR [BX], AX; Pasar el resultado de la parte baja a la PILA
ret
  
ORG 2000h
;Guardar los valores de los registros para no perderlos
push AX
push BX
push CX
push DX
;Pasar los valores de los números
mov AX, num1l
push AX
mov AX, num1h
push AX
mov AX, num2l
push AX
mov AX, num2h
push AX
;Llamar a la subrutina
call SUM32
;Devolver todos los POPs
pop AX
mov resH, AX
pop AX
mov resL, AX
pop AX
pop AX
pop DX
pop CX
pop BX
pop AX
HLT
END
