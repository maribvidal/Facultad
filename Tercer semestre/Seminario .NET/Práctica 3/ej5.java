//Variables
double[,] miMatriz = {{1, 2, 3}, //Esta es cuadrada
                      {4, 5, 6},
                      {7, 8, 9}};
double[,] miOtraMatriz = {{1, 2, 3, 4}, //Esta NO es cuadrada
                          {5, 6, 7, 8},
                          {9, 0, 0, 0}};

//Programa principal
double[][] miArregloDoble = GetArregloDeArreglo(miMatriz);
double[][] miOtroArregloDoble = GetArregloDeArreglo(miOtraMatriz);
arregloDobleLength(miArregloDoble);
imprimirArregloDoble(miArregloDoble);

//Métodos
double[][] GetArregloDeArreglo(double[,] matriz) {
    int matrizAncho = matriz.GetLength(0);
    int matrizLargo = matriz.GetLength(1);
    double[][] arregloDeArreglo = {new double[matrizAncho], new double[matrizLargo]};

    for (int i = 0; i < matrizAncho - 1; i++) 
    {
        for (int j = 0; j < matrizLargo - 1; j++) arregloDeArreglo[i][j] = matriz[j, i];
    }

    return arregloDeArreglo;
}

void imprimirArregloDoble(double[][] arregloDoble) {
    for (int i = 0; i < arregloDoble[0].Length; i++) {
        for (int j = 0; j < arregloDoble[1].Length; j++) {
            Console.Write("(" + i.ToString() + " / " + j.ToString() + ") I " + arregloDoble[i][j] + " ");
        }
        Console.WriteLine();
    }
}

void arregloDobleLength(double[][] arregloDoble) {
    Console.WriteLine(arregloDoble.Length); //Dimensiones
    for (int i = 0; i < arregloDoble.Length; i++) Console.WriteLine(arregloDoble[i].Length); //Largo y ancho
}
