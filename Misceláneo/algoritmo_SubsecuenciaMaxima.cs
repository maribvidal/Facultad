// Crear un algoritmo que encuentre la subseciencia de una secuencia de números enteros que tenga el valor mas grande

int operaciones = 0;
int iteraciones = 0;

int[] vectorPrueba = [-2, 11, -4, 13, -5, -2, 6, 7, -2];
int[] subsecuencia = SubsecuenciaMaxima(vectorPrueba);
if (subsecuencia != null)
{
    ImprimirVector(subsecuencia);
}

// Módulos

int[] SubsecuenciaMaxima(int[] vector)
{
    int longitud = vector.Length;
    //Analizar los casos en los que el vector es vacío o el vector no existe
    if (longitud < 1 || vector == null || vector.GetType() != typeof(int[]))
        return null;
    else if (longitud == 1)
        return vector;
    else 
    {
        int[] resultado;
        //Indices y acumuladores
        int i = 0; int j = 0;
        int iM = 0; int jM = 0;
        int subAct = 0; int subMax = 0;
        
        while (i < longitud)
        {
            //Encontrar un número positivo
            while (vector[i] < 0 && i < longitud - 1)
            {
                i++;
                iteraciones++;
            }
            j = i;

            subAct = 0;
            //Ir probando diferentes subsecuencias
            while (j < longitud)
            {
                subAct += vector[j];
                //Comprobar si el valor de subAct es mayor que el de subMax
                if (subAct > subMax)
                {
                    subMax = subAct;
                    operaciones += 3;
                    //Guardar los indices de la subsecuencia máxima
                    iM = i;
                    jM = j;
                }
                j++;
                iteraciones++;
            }

            iteraciones++;
            //Si el vector se va a seguir recorriendo
            if (i < longitud) i++;
        }

        resultado = new int[jM - iM + 1];
        Console.WriteLine($"Iteraciones realizadas: {iteraciones}\n\tCantidad de operaciones: {operaciones}");
        for (int k = iM; k <= jM; k++)
            resultado[k - iM] = vector[k]; 
        return resultado;
    }
}

void ImprimirVector(int[] vector)
{
    foreach (int num in vector)
        Console.Write(num + " ");
}
