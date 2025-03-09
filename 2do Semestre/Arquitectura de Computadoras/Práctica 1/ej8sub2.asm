org 1000h
cadena db "acgikpruz!P"; Solo contar las letras que estén entre el 'a' y la 'z'
final db 00h
res dw ?

org 3000h
CONTAR_MIN: push bx
            push cx
            push ax
            push dx
            mov ax, 0
            mov cx, 0
            mov bx, sp
            add bx, 12; Para obtener la celda de la pila que guarda la dire
            mov bx, [bx]; Para guardar la dirección del inicio de la cadena en BX
bucle:      mov al, [bx]; Mover a AL la letra que se encuentre apuntada la dir de BX
            cmp al, 00h; Si arroja flag CERO, es porque se llegó al final de la cadena
            jz fin
            cmp al, 061h; Restarle a AL la letra A (61h). Si el resultado da BORROW, es porque es MENOR y por lo tanto no pertenece al rango.
            jc pasar; Si da CARRY es porque no pertenece a la cadena
              cmp al, 07AH; Restarle a AL la letra Z (7Ah).
              jc segcond; Si no da CARRY es porque o es Z o es mayor.
              jnz pasar; Si no da CERO (ni CARRY) es porque es mayor, y por lo tanto, no pertenece al rango.
segcond:         inc cx; Incrementar el número del rango
pasar:      inc bx; Incrementar la dirección de la lista
            jmp bucle
fin:        mov bx, sp
            add bx, 10
            mov bx, [bx]
            mov [bx], cx
            pop dx
            pop ax
            pop cx
            pop bx
            ret

org 2000h
mov bx, offset cadena; Pasar la dirección del inicio de la cadena (7FFEh)
mov ax, offset res; Guardar en la pila la dirección de la celda de resultado (7FFCh)
push bx
push ax
call CONTAR_MIN
pop ax
pop bx
hlt
end
