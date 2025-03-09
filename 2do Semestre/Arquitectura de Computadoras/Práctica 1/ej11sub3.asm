org 1000h
num1h dw 1234H
num1l dw 5678H
num2h dw 1111H
num2l dw 2222H

org 2000h
mov ax, num1l
mov bx, num2l
add ax, bx ;La suma de las partes bajas va a estar en AX
mov bx, num1h
mov cx, num2h
adc bx, cx ;La suma de las partes altas va a estar en BX
;El programa solo pide calcular, no guardar
hlt
end
