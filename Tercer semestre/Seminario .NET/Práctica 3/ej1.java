double[,] matrix = new double[,] {{1.5, 2.5, 3.5}, {4.5, 5.5, 6.5}, {7.5, 8.5, 9.5}, {10.24, 11.25, 12.26}};
ImprimirMatriz(matrix);

void ImprimirMatriz(double[,] matriz) {
    for (int i = 0; i < matriz.GetLength(1); i++) {
        for (int j = 0; j < matriz.GetLength(0); j++) {
            Console.Write("[" + matriz[j, i] + "]");
            if (j < (matriz.GetLength(0)-1)) {Console.Write(" - ");}
        }
        Console.WriteLine();
    }
}
