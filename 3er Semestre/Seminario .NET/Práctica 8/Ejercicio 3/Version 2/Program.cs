using teoria7;
using System.Collections;

IEnumerable rango = Rango(6, 30, 3);
IEnumerable potencias = Potencias(2, 10);
IEnumerable divisibles = DivisiblesPor(rango, 6);

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

//Habemus enumeradores
IEnumerable Rango(int i, int j, int p)
{
    for (int k = i; k <= j; k += p)
        yield return k;
}

IEnumerable Potencias(int b, int k)
{
    for (int i = 0; i < k; i++)
        yield return ((int) Math.Pow(2, i+1));
}

IEnumerable DivisiblesPor(IEnumerable e, int i)
{
    foreach (int num in e)
    {
        if (num % i == 0)
            yield return num;
    }
}
