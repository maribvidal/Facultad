using teoria7;

static class VectorDeEnterosExtension
{
    public static void Print(this int[] vector, string leyenda)
    {
        Console.WriteLine(leyenda + string.Join(", ", vector));
    }
    public static int[] Seleccionar(this int[] vector, FuncionEntera func)
    {
        int[] nuevoVector = new int[vector.Length];
        for (int i = 0; i < vector.Length; i++)
        {
            nuevoVector[i] = func(vector[i]);
        }
        return nuevoVector;
    }

    //Lo que hace este método es anexar a una lista los elementos del vector que cumplan con la función delegada, y luego convertir esa lista a vector
    public static int[] Donde(this int[] vector, Predicado pred)
    {
        List<int> listaTemp = new List<int>();
        foreach (int num in vector)
        {
            if (pred(num))
            {
                listaTemp.Add(num);
            }
        }
        return listaTemp.ToArray();
    }
}
