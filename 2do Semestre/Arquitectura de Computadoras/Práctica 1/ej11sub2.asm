org 1000h
num1 db 9
num2 db 2
res db ?

org 4000h
resto: nop
pbucle: cmp ah, al
jc sbucle
sub ah, al
jmp pbucle
sbucle: inc cl
dec ah
jz terminar
jmp sbucle
terminar: ret

org 2000h
mov cx, 00h
mov ah, num1
mov al, num2
call resto
mov res, cl
hlt
end
