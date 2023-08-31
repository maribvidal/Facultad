org 1000h
bait db 10010100b
n_veces db 2; Cuantas veces rotar el número

org 3000h
ROTARIZQ: nop
push ax ;Pushear BX para usarlo luego
mov bx, sp
add bx, 6
mov bx, [bx] ;Asignarle a BX la dirección que tiene la pila
mov ah, [bx] ;Pasarle a AX lo que esté apuntando BX
add ah, ah ;Sumarse a si mismo para mover los bits de derecha a izquierda
adc ah, 0 ;Sumar el carry si es que hubo
mov byte ptr [bx], ah ;Devolver el byte rotado
pop ax
ret

org 4000h
ROTARIZQ_N: nop
BUCLE: cmp ch, 00h
JZ PASAR
call ROTARIZQ
dec ch
JMP BUCLE
PASAR: nop
ret

org 2000h
mov bx, offset bait ;Pasar dirección por referencia
mov cx, 00h
mov ch, n_veces ;Pasar por valor y por registro
push bx
call ROTARIZQ_N
pop bx
hlt
end
