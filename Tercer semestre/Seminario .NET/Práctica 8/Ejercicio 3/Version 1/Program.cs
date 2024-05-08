using teoria7;
using System.Collections;

IEnumerable rango = new Rango(6, 30, 3);
IEnumerable potencias = new Potencias(2, 10);
IEnumerable divisibles = new DivisiblesPor(rango, 6);

foreach (int i in rango)
{
    Console.Write(i + " ");
}
Console.WriteLine();

foreach (int i in potencias)
{
    Console.Write(i + " ");
}
Console.WriteLine();

foreach (int i in divisibles)
{
    Console.Write(i + " ");
}
Console.WriteLine();
