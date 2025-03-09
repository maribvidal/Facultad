org 1000h
cadena db "casa" ;Tambien cuento como carácter al espacio
final db 00h
res dw ?

org 3000h
longitud: push bx
          push cx
          push ax
          push dx
          mov bx, sp
          add bx, 12 ;Ir al inicio de la pila para encontrar la dirección de la CADENA
          mov bx, [bx] ;Asignarle a BX el inicio de CADENA
          mov cx, 0
          mov ax, 0
bucle:    mov ax, [bx] ;Pasar la dirección apuntada
          cmp al, 00h ;Comparar la letra con 00h para ver si se llegó al final
          jz fin
          inc cx ;Incrementar la cantidad de carácteres leidos
          add bx, 1 ;Incrementar la dirección apuntada
          jmp bucle ;Repetir el bucle
fin:      mov bx, sp
          add bx, 10
          mov bx, [bx] ;Asignarle la dirección de RES
          mov [bx], cx ;Guardar el número de carácteres leidos en 1004h
          pop dx
          pop ax
          pop cx
          pop bx
          ret

org 2000h
mov bx, offset cadena
mov ax, offset res
push bx
push ax
call longitud
pop ax
pop bx
hlt
end
