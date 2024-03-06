// Ejercicio 9 - Práctica 1
using System;

//Declarar variables
string firstInput;
string secondInput;
int inputIndex = 0;
Boolean simetria = true;

//Ingresar las palabras
Console.WriteLine("Ingresar la primera palabra: ");
firstInput = Console.ReadLine();
Console.WriteLine("Ingresar la segunda palabra: ");
secondInput = Console.ReadLine();

//Determinar si las palabras son simétricas
if (firstInput.Length == secondInput.Length) { // Comprobar si ambas palabras tienen la misma longitud
    while ((inputIndex < (firstInput.Length)) && simetria) {
        Console.WriteLine(firstInput[inputIndex] + " / " + secondInput[(secondInput.Length-1) - inputIndex]);
        if (firstInput[inputIndex] != secondInput[(secondInput.Length-1) - inputIndex]) {
            simetria = false;
        }
        inputIndex++;
    }
} else {
    simetria = false;
}

//Imprimir el resultado
if (simetria) {
    Console.Write("Las dos palabras son simétricas");
} else {
    Console.Write("Las dos palabras no son simétricas");
}
