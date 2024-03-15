// Ejercicio 16 - Práctica 2

//Inciso A
for (int i = 0; i < args.Length; i++) {
    Console.WriteLine("¡Hola " + args[i] + "!");
}

//Inciso B
Console.WriteLine();
foreach (string nombre in args)
{
    Console.WriteLine("¡Hola " + nombre + "!");
}
