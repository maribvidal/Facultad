// Ejercicio 12 - Práctica 1
using System;

//Variables
int aux = 1;
int numInput;

//Input
Console.WriteLine("Ingrese un número: ");
string st = Console.ReadLine();
numInput = int.Parse(st);

//Output
while (aux <= numInput) {
    if (numInput % aux == 0) {
        Console.WriteLine(aux + " es un divisor de " + numInput);
    }
    aux++;
}
