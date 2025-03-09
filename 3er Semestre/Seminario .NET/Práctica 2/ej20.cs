// Ejercicio 20 - Práctica 2

int valorA = 5;
int valorB = 10;

swap(ref valorA, ref valorB);
Console.WriteLine("Valor A: " + valorA + " / Valor B: " + valorB);

void swap (ref int primerValor, ref int segundoValor) {
    int aux = segundoValor;
    segundoValor = primerValor;
    primerValor = aux;
}
