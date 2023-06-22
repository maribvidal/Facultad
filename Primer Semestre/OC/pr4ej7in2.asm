org 1000h
varA db 06h
varB db 08h
varC db ?

org 2000h
mov al, varA
mov bl, varB
mov cl, varC
cmp al, bl; hacer la cuenta
jz : cero; si la operación dió cero, cumplió con A <= B, por lo que C = A
jnz : no_cero; si no dió cero, quedan dos posibilidades, o A < B, o A > B
cero: mov cl, varA; asignar primer resultado (C = A)
jmp final; terminar el programa
no_cero: nop; no hacer nada durante esta línea de código
js : priRes
jns : segRes
priRes : nop
mov cl, varA
jmp final
segRes : nop
mov cl, varB
jmp final
final: hlt
end
