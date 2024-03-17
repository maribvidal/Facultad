// Ejercicio 19 - Práctica 2

int res;
Fac2(Int32.Parse(args[0]), out res);
Console.WriteLine(args[0] + "! = " + res);

//Versión no-recursiva
void Fac1(int n, out int f) {
    f = 1;
    for (int i = 1; i <= n; i++) {f *= i;};
}

//Versión recursiva
void Fac2(int n, out int f){
    f = 1;
    if (n > 0) {
        Fac2(n - 1, out f); 
        f = n * f;
    }
}
