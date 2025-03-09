// Ejercicio 17 - Práctica 2

bool esPrimo(int n)
{
    bool condicion = true;
    int i = 2;
    while ((condicion) && (i <= Math.Sqrt(n))) {
        if (n % i == 0) condicion = false;
        i++;
    }
    return condicion;
}

if (args.Length > 0) { //Revisar que se hayan pasado argumentos
    if (int.Parse(args[0]) > 1) { //Revisar que el número sea mayor a 1
        for (int i = 2; i <= int.Parse(args[0]); i++) {
            if (esPrimo(i)) Console.WriteLine("El número " + i + " es primo");
        }
    } else {
        Console.WriteLine("Ingrese un número mayor a 2");
    }
} else {
    Console.WriteLine("Ingrese argumentos");
}
