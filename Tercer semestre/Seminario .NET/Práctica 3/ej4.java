//Variables
double[,] miMatriz = {{1, 2, 3, 0}, //Esta es cuadrada
                      {4, 5, 6, 0},
                      {7, 8, 9, 0},
                      {10, 11, 12, 0}};
double[,] miOtraMatriz = {{1, 2, 3, 4}, //Esta NO es cuadrada
                          {5, 6, 7, 8},
                          {9, 10, 11, 12}};
double[] miVector;
double[] miOtroVector;

//Manejo de excepciones para la primera matriz
try 
{
    miVector = GetDiagonalPrincipal(miMatriz);
    imprimirVector(miVector);
    miVector = GetDiagonalSecundaria(miMatriz);
    imprimirVector(miVector);
}
catch (Exception e)
{
    Console.WriteLine(e.Message + ": Se requiere una matriz cuadrada");
}

//Manejo de excepciones para la segunda matriz
try 
{
    miOtroVector = GetDiagonalPrincipal(miOtraMatriz);
    imprimirVector(miOtroVector);
    miOtroVector = GetDiagonalSecundaria(miOtraMatriz);
    imprimirVector(miOtroVector);
}
catch (Exception e)
{
    Console.WriteLine(e.Message + ": Se requiere una matriz cuadrada");
}

double[] GetDiagonalPrincipal(double[,] matriz) {
    int matrizAncho = matriz.GetLength(0);
    int matrizLargo = matriz.GetLength(1);
    double[] vectorDiagonal = new double[matrizAncho];

    //Revisar si la matriz es cuadrada...
    if (matrizAncho == matrizLargo) {
        //Recorrer la matriz y generar un nuevo vector
        for (int i = 0; i < matrizAncho; i++) vectorDiagonal[i] = matriz[i, i];
    } else {
        throw new Exception("ArgumentException");
    }

    return vectorDiagonal;
}

double[] GetDiagonalSecundaria(double[,] matriz) {
    int matrizAncho = matriz.GetLength(0);
    int matrizLargo = matriz.GetLength(1);
    double[] vectorDiagonal = new double[matrizAncho];

    //Revisar si la matriz es cuadrada...
    if (matrizAncho == matrizLargo) {
        //Recorrer la matriz, desde "abajo", y generar un nuevo vector
        for (int i = 0; i < matrizAncho; i++) vectorDiagonal[i] = matriz[matrizAncho - 1 - i, i];
    } else {
        throw new Exception("ArgumentException");
    }

    return vectorDiagonal;
}

void imprimirVector(double[] vector) {
    for (int i = 0; i < vector.Length; i++) {
        Console.Write(vector[i].ToString() + " ");
    }
    Console.WriteLine();
}
