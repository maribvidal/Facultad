// Ejercicio 12 - Práctica 1
using System;

//Input
Console.WriteLine("Ingrese un número: ");
int numInput = int.Parse(Console.ReadLine());

//Output
for (int i = 1; i < numInput; i++) {
  if (numInput % i == 0) {
    Console.WriteLine(i + " es un divisor de " + numInput);
  }
}
