// Ejercicio 6 - Práctica 1
using System;

//Usar do-while para ingresar el input al menos la primera vez
string strInput; //Inicializar variable
do {
    strInput = Console.ReadLine();
    Console.WriteLine("Cantidad de carácteres de la cadena: " + strInput.Length);
} while (String.IsNullOrEmpty(strInput) == false);
