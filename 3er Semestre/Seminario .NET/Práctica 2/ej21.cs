// Ejercicio 21 - Práctica 2
Imprimir(1, "casa", 'A', 3.4, DayOfWeek.Saturday);

void Imprimir(params object[] vector) {
    foreach (object elemento in vector)
    {
        Console.Write(elemento + " ");
    }
  Console.WriteLine();
}
