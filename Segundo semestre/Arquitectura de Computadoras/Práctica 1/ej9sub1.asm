org 1000h
bait db 00110011b

org 3000h
ROTARIZQ: nop
push ax ;Pushear BX para usarlo luego
mov bx, sp
add bx, 4
mov bx, [bx] ;Asignarle a BX la dirección que tiene la pila
mov ah, [bx] ;Pasarle a AX lo que esté apuntando BX
add ah, ah ;Sumarse a si mismo para mover los bits de derecha a izquierda
adc ah, 0 ;Sumar el carry si es que hubo
mov byte ptr [bx], ah ;Devolver el byte rotado
pop ax
ret

org 2000h
mov bx, offset bait ;Pasar dirección por referencia
push bx
call ROTARIZQ
pop bx
hlt
end
