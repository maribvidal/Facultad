// Ejercicio 11 - Práctica 2
using System;

Console.Write("Ingrese una oración: ");
string st = Console.ReadLine();
string[] recibirSplit = st.Split(" ");

foreach (string itemSplit in recibirSplit)
{
    Console.WriteLine("Palabra de la oración: " + itemSplit);
}
