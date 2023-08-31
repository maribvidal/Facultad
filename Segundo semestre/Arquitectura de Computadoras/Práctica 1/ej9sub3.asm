;En este algoritmo se puede ver como sería un código con anidamiento de subrutinas (hasta 3)
;El anidamiento de subrutinas está limitado por la cantidad de espacio que haya en la memoria básicamente, aunque pueden haber otros factores
org 1000h
bait db 10010100b ;Colocar el byte a rotar aquí
n_veces db 6; Cuantas veces rotar el número hacia la derecha (hasta 8)

org 3000h
ROTARIZQ: nop
push ax ;Pushear BX para usarlo luego
mov bx, sp
add bx, 8; Es un 8 porque cada SUBRUTINA ocupa 2 celdas de la pila y por el PUSH hecho recien (2 bytes mas)
mov bx, [bx] ;Asignarle a BX la dirección que tiene la pila
mov ah, [bx] ;Pasarle a AX lo que esté apuntando BX
add ah, ah ;Sumarse a si mismo para mover los bits de derecha a izquierda
adc ah, 0 ;Sumar el carry si es que hubo
mov byte ptr [bx], ah ;Devolver el byte rotado
pop ax
ret

org 3500h
ROTARIZQ_N: nop
BUCLE: cmp ch, 00h
JZ PASAR
call ROTARIZQ
dec ch
JMP BUCLE
PASAR: nop
ret

org 4000h
ROTARDER_N: nop
mov ch, 8; Poner 8 en DH (8 bits)
sub ch, dh; Restarle a DH los bits que tiene CH para saber cuantas veces hay que rotar
call ROTARIZQ_N
ret

org 2000h
mov bx, offset bait ;Pasar dirección por referencia
mov cx, 00h
mov dx, 00h
mov dh, n_veces ;Pasar por valor y por registro
push bx
call ROTARDER_N
pop bx
hlt
end
