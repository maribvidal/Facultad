org 1000h
num1 db 23
num2 db 4
res dw ?

org 3000h
div: mov bx, sp
add bx, 2
mov ax, [bx]
mov cx, 00h
bucle: cmp ah, 0
jz acabo
cmp ah, al
jc acabo
sub ah, al
inc cl
jmp bucle
acabo: ret

org 2000h
push ax
push bx
push cx
push dx
mov ah, num1
mov al, num2
push ax
call div
mov res, cx
pop ax
pop dx
pop cx
pop bx
pop ax
hlt
end
