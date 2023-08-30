org 1000h
caracter db " "
cadena db "the quick brown fox"
fin db 00h ;La cadena termina en 0

org 3000h
CONTAR_CAR: push dx ;Vamos a usar DX, guardar lo que tenga en la PILA por las dudas
mov dx, 00h ;Usar DX como almacenador temporal de carácteres
mov bx, sp ;Pasarle a BX la dirección de la pila
add bx, 6 ;Acceder al carácter
mov al, [bx] ;Pasarle el carácter por valor a AL
sub bx, 2 ;Acceder a la cadena
mov bx, [bx] ;Pasarle a BX la dirección inicial de la cadena
  BUCLE: mov dl, [bx] ;Pasarle a DL la letra
  cmp dl, 00h ;Fijarse si se llegó al final de la cadena
  jz FINAL
  cmp dl, al ;Comparar a la letra actual con la letra de la variable caracter
  jnz PASAR
  inc cx ;Incrementar contador
    PASAR: inc bx ;Pasar a la próxima dirección
    jmp BUCLE
FINAL: pop dx
ret

org 2000h
mov al, caracter ;El carácter se debe pasar por valor
mov ah, 00h ;Dejar la parte de arriba en 0
mov cx, 00h ;Usar CX como contador de carácter
mov bx, offset cadena ;La cadena se debe pasar porreferencia
push ax 
push bx ;Y ambas se obtienen a través de la pila
call CONTAR_CAR
pop bx
pop ax
hlt
end
