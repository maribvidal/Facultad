// Ejercicio 18 - Práctica 2

//Versión no-recursiva
int Fac1(int n) {
    int factorial = 1;
    for (int i = 1; i <= n; i++) {
        factorial *= i;
        //Console.Write(i);
        //if (i < n) Console.Write(" * ");
    }
    //Console.Write(" = " + factorial);
    return factorial;
}

//Versión recursiva
int Fac2(int n) {
    if (n == 0) return 1;
    else return n * Fac2(n - 1);
}

//Versión recursiva en forma de expersión (con operador condicional ternario)
int Fac3(int n) => (n > 0 ? (n * Fac3(n - 1)) : 1);
//Si n es mayor a 0, entonces, devolver n multiplicado por el resultado de Fac3(n -1), si no, devolver 1.

Console.WriteLine("El factorial de " + args[0] + " es " + Fac3(Int32.Parse(args[0])));
