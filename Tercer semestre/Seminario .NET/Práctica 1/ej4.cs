// Ejercicio 2 - Práctica 1
using System;

//Solicitar el nombre del usuario
Console.WriteLine("INGRESE SU NOMBRE: ");
string userInput = Console.ReadLine();

//Imprimir un saludo personalizado o la frase "Hola mundo", dependiendo del valor de userInput
if (String.IsNullOrEmpty(userInput)) 
{
    Console.Write("Hola mundo");
} else 
{
    Console.Write("Bienvenido de vuelta, " + userInput);
}
