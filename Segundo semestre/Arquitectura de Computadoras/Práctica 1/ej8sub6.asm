org 1000h
original db "n"
reemplazo db "t"
cadena db "nuca"
fin db 00h ;La cadena termina en 0

org 3000h
REEMPLAZAR_CAR: push dx ;Vamos a usar DX, guardar lo que tenga en la PILA por las dudas
mov dx, 00h ;Usar DX como almacenador temporal de carácteres
mov bx, sp ;Pasarle a BX la dirección de la pila
add bx, 6 ;Acceder al carácter
mov ax, [bx] ;Pasar los dos carácteres por valor
sub bx, 2 ;Acceder a la cadena
mov bx, [bx] ;Pasarle a BX la dirección inicial de la cadena
  BUCLE: cmp BYTE PTR [bx], 00h ;Fijarse si se llegó al final de la cadena
  jz FINAL
  cmp al, [bx] ;Comparar la letra actual con la ORIGINAL
  jnz PASAR
  mov  BYTE PTR [bx], ah ;Reemplazar la letra de la cadena por el REEMPLAZO
    PASAR: inc bx ;Pasar a la próxima dirección
    jmp BUCLE
FINAL: pop dx
ret

org 2000h
mov al, original ;El carácter se debe pasar por valor
mov ah, reemplazo ;El carácter se debe pasar por valor
push ax ;Los valores se pasan a través de la pila
mov bx, offset cadena
push bx ;La cadena también se pasa a través de la pila
call REEMPLAZAR_CAR
pop bx
pop ax
hlt
end
