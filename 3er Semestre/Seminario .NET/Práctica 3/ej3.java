double[,] matrix = new double[,] {{1.543, 2.51, Math.PI}, 
                                    {4.5, 5.5, 6.1111}, 
                                    {7.5, 8.5, 9.1509}, 
                                    {10.24, 11.25, 12.26}};
ImprimirMatrizConFormato(matrix, "0.0");

void ImprimirMatrizConFormato(double[,] matriz, string formatString) {
    for (int i = 0; i < matriz.GetLength(1); i++) {
        for (int j = 0; j < matriz.GetLength(0); j++) {
            Console.Write("[" + matriz[j, i].ToString(formatString) + "]");
            if (j < (matriz.GetLength(0)-1)) {Console.Write(" - ");}
        }
        Console.WriteLine();
    }
}
