// Ejercicio 9 - Práctica 1
using System;

//Declarar variables
int contador = 1;

//Mientras número sea menor o igual que 1000...
while (contador <= 1000) {
    //Comprobar si numero es un múltiplo de 17
    if (contador % 17 == 0) {
        Console.WriteLine(contador + " es un múltiplo de 17");
    }

    //Comprobar si numero es un múltiplo de 29
    if (contador % 29 == 0) {
        Console.WriteLine(contador + " es un múltiplo de 29");
    }

    //Incrementar el contador
    contador++;
}
