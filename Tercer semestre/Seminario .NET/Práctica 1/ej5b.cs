// Ejercicio 5b - Práctica 1
using System;

//Solicitar el nombre del usuario
Console.WriteLine("Ingrese su nombre: ");
string userInput = Console.ReadLine();

//Según el valor de userInput, imprimir una línea diferente
switch (userInput)
{
    case "Juan":
        Console.Write("¡Hola amigo!");
        break;
    case "Maria":
        Console.Write("Buen día señora");
        break;
    case "Alberto":
        Console.Write("Hola Alberto");
        break;
    default:
        if (String.IsNullOrEmpty(userInput)) {
            Console.Write("¡Buen día mundo!");
        } else {
            Console.Write("Buen día " + userInput);
        }
        break;
}
