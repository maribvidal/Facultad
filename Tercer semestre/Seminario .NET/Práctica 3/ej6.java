// Ejercicio 6 - Práctica 3

using System.Runtime.CompilerServices;

//Variables

double[,] unaMatriz = {{1, 2, 3},
                       {4, 5, 6},
                       {7, 8, 9}};

double[,] otraMatriz = {{9, 8, 7},
                        {6, 5, 4},
                        {3, 2, 1}};

double[,] terceraMatriz = {{6, 6, 5, 4},
                          {6, 5, 4, 3},
                          {3, 2, 1, 0}};

double[,] cuartaMatriz = {{5, 3, -4, -2},
                          {8, -1, 0, -3}};

double[,] quintaMatriz = {{1, 4, 0},
                          {-5, 3, 7},
                          {0, -9, 5},
                          {5, 1, 4}};

double[,]? sumaMatricial = Suma(unaMatriz, otraMatriz);
double[,]? restaMatricial = Resta(terceraMatriz, terceraMatriz);
double[,] productoMatricial = Multiplicacion(cuartaMatriz, quintaMatriz);

//Programa principal
if (sumaMatricial != null) imprimirMatriz(sumaMatricial);
Console.WriteLine();
if (restaMatricial != null) imprimirMatriz(restaMatricial);
Console.WriteLine();
imprimirMatriz(productoMatricial);

//Métodos
double[,]? Suma(double[,] A, double[,] B) {
    int anchoMatriz = A.GetLength(0);
    int largoMatriz = A.GetLength(1);
    double[,]? nuevaMatriz = new double[anchoMatriz, largoMatriz];

    if ((anchoMatriz == B.GetLength(0)) & (largoMatriz == B.GetLength(1))) {
        //Recorrer la matriz
        for (int i = 0; i < anchoMatriz; i++) {
            //Sumar los elementos de ambas matrices
            for (int j = 0; j < largoMatriz; j++) nuevaMatriz[i, j] = A[i, j] + B[i, j];
        }
    } else nuevaMatriz = null;
    return nuevaMatriz;
}

double[,]? Resta(double[,] A, double[,] B) {
    int anchoMatriz = A.GetLength(0);
    int largoMatriz = A.GetLength(1);
    double[,]? nuevaMatriz = new double[anchoMatriz, largoMatriz];

    if ((anchoMatriz == B.GetLength(0)) & (largoMatriz == B.GetLength(1))) {
        //Recorrer la matriz
        for (int i = 0; i < anchoMatriz; i++) {
            //Sumar los elementos de ambas matrices
            for (int j = 0; j < largoMatriz; j++) nuevaMatriz[i, j] = A[i, j] - B[i, j];
        }
    } else nuevaMatriz = null;
    return nuevaMatriz;
}

double[,] Multiplicacion(double[,] A, double[,] B) {
    int filMatrizA = A.GetLength(0);
    int colMatrizB = B.GetLength(1);
    int matrizProdDim = A.GetLength(1);
    double[,] matrizProd = new double[filMatrizA, colMatrizB];
    double matrizProdElem;

    //Comparar la cantidad de columnas de A con la cantidad de filas de B
    if (A.GetLength(1) == B.GetLength(0)) {
        for (int i = 0; i < filMatrizA; i++) {
            for (int j = 0; j < colMatrizB; j++) {
                matrizProdElem = 0;
                for (int k = 0; k < matrizProdDim; k++) matrizProdElem += A[i, k] * B[k, j];
                matrizProd[i, j] = matrizProdElem;
            }
        }
    } else throw new Exception("ArgumentException");

    return matrizProd;
}

void imprimirMatriz(double[,] matriz) {
    for (int i = 0; i < matriz.GetLength(0); i++) {
        for (int j = 0; j < matriz.GetLength(1); j++) Console.Write("(" + matriz[i, j] + ") ");
        Console.WriteLine();
    }
}
