// Ejercicio 14 - Práctica 1
using System;

//Variables
int a, b, c;

//Ingresar valores
Console.WriteLine("Ingresa un número: ");
b = int.Parse(Console.ReadLine());
Console.WriteLine("Ingresa otro número: ");
c = int.Parse(Console.ReadLine());

//Operación
a = (b < c) ? b : c;
Console.WriteLine("a = " + a);
