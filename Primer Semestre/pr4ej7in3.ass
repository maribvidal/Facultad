;práctica 4 ejercicio 7 inciso 3
org 1000h
varA db 01h
varB db 01h
varC db ?

org 2000h
mov al, varA
mov bl, varB
mov cl, varC
cmp al, bl
jz : if
jnz : else
if: mov cl, varA
jz : final
else: mov cl, varB
final: hlt
hlt
end
