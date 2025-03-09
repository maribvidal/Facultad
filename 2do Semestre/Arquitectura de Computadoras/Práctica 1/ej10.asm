org 1000h
dato1 dw 0ABCDh
dato2 dw 0EEEEh

org 3000h
SWAP: nop
mov bx, sp
add bx, 4
mov cx, [bx]; Pasar dirección del dato1 a CX
sub bx, 2
mov dx, [bx]; Pasar dirección del dato2 a DX
mov bx, [bx]; Pasar dato2 a BX
mov ax, [bx]; Pasar dato2 de BX a AX
mov bx, cx; Pasarle a BX la dirección dato1 de CX
mov cx, [bx]; Pasarle a CX el dato1
mov word ptr [bx], ax; Reemplazar dato1 con dato2
mov bx, dx; Pasar la dirección del dato2 a BX
mov word ptr [bx], cx; Reemplazar dato2 con dato1
ret

org 2000h
mov dx, 00h
mov cx, 00h
mov ah, 00h
mov bx, offset dato1 ;Pasar dirección por referencia
push bx
mov bx, offset dato2 ;Pasar dirección por referencia
push bx
call SWAP
pop bx
pop bx
hlt
end
