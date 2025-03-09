org 1000h
varA db 05h
varB db 06h
varC db ?

org 2000h
mov al, varA
mov bl, varB
mov cl, varC
cmp al, bl ;hacer la cuenta
jc : if ;revisar si la operación dá carry o no
jnc : else
if: mov cl, varA ;si dió carry es porque A < B
jz : final
else: mov cl, varB ;si no, es porque A > B o A = B
final: hlt
hlt
end
