using System;
using System.Text;

StringBuilder myString = new StringBuilder("Una secuencia de numeros: ");
int i = 0;

while (i < 100)
{
    myString.Append(i.ToString() + "");
    i++;
}

Console.WriteLine(myString);
