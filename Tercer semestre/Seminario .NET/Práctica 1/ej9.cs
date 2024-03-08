using System;

//Variables
Boolean esPalindroma = true;

//Ingresar las palabras
Console.WriteLine("Ingrese una palabra: ");
string palabra1 = Console.ReadLine();
Console.WriteLine("Ingrese otra palabra: ");
string palabra2 = Console.ReadLine();

//Comprobar si son palindromas
if (palabra1.Length == palabra2.Length) 
{
  int i = 0;
  while (esPalindroma && (i < palabra1.Length)) 
  {
    Console.WriteLine(palabra1[i] + " / " + palabra2[palabra2.Length - 1 - i]);
    if (palabra1[i] != palabra2[palabra2.Length - 1 - i]) esPalindroma = false;
    i++;
  }
}
  else
{
  esPalindroma = false;
}

//Imprimir resultado
if (esPalindroma) {
  Console.WriteLine("Ambas palabras son simétricas");
} 
}
