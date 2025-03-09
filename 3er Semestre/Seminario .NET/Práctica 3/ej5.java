// Ejercicio 5 - Práctica 3

//Variables
double[,] miMatriz = {{1, 2, 3}, //Esta es cuadrada
                      {4, 5, 6},
                      {7, 8, 9}};
double[,] miOtraMatriz = {{1, 2, 3, 4}, //Esta NO es cuadrada
                          {5, 6, 7, 8},
                          {9, 0, 0, 0}};
double[,] miTerceraMatriz = {{1, 2}, //Rectangular
                             {2, 3},
                             {3, 2},
                             {2, 1}};

//Programa principal
double[][] miArregloDoble = GetArregloDeArreglo(miMatriz);
double[][] miOtroArregloDoble = GetArregloDeArreglo(miTerceraMatriz);
imprimirArregloDoble(miArregloDoble);
Console.WriteLine();
imprimirArregloDoble(miOtroArregloDoble);

//Métodos
double[][] GetArregloDeArreglo(double[,] matriz) {
    int matrizAncho = matriz.GetLength(0);
    int matrizLargo = matriz.GetLength(1);
    double[][] arregloDeArreglo = new double[matrizAncho][];

    //Generar arreglo de arreglos
    for (int i = 0; i < matrizAncho; i++) {
        arregloDeArreglo[i] = new double[matrizLargo];
    }

    //Llenar arreglo de arreglos
    for (int i = 0; i < matrizAncho; i++) {
        for (int j = 0; j < matrizLargo; j++) arregloDeArreglo[i][j] = matriz[i, j];
    }

    return arregloDeArreglo;
}

void imprimirArregloDoble(double[][] arregloDoble) {
    for (int i = 0; i < arregloDoble.Length; i++) {
        for (int j = 0; j < arregloDoble[i].Length; j++) Console.Write("(" + i.ToString() + ", " + j.ToString() + ") = " + arregloDoble[i][j] + " ");
        Console.WriteLine();
    }
}
