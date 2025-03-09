// Ejercicio 5a - Práctica 1
using System;

//Solicitar el nombre del usuario
Console.WriteLine("Ingrese su nombre: ");
string userInput = Console.ReadLine();

//Según el valor de userInput, imprimir una línea diferente
if (userInput == "Juan") { //Si se ha ingresado Juan
    Console.Write("¡Hola amigo!");
} else if (userInput == "María") { //Si se ha ingresado María
    Console.Write("Buen día señora");
} else if (userInput == "Alberto") { //Si se ha ingresado Alberto
    Console.Write("Hola Alberto");
} else if (String.IsNullOrEmpty(userInput)) { //Si se ha ingresado una línea vacía
    Console.Write("¡Buen día mundo!");
} else { //En cualquier otro caso
    Console.Write("Buen día " + userInput);
}
