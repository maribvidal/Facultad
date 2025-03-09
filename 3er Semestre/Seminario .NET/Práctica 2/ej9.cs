using System;
using System.Text;

DateTime tiempoActual = DateTime.Now;
StringBuilder myString = new StringBuilder("Una secuencia de numeros: ");
int i = 0;

while (i < 100)
{
    myString.Append(i.ToString() + "");
    i++;
}

DateTime tiempoActual2 = DateTime.Now;
TimeSpan tiempoDiferencia = tiempoActual2 - tiempoActual;

Console.WriteLine("El programa comenzó a ejecutarse a las: " + tiempoActual);
Console.WriteLine("El programa terminó a las: " + tiempoActual2);
Console.WriteLine("En total se tardó: " + tiempoDiferencia.ToString());
