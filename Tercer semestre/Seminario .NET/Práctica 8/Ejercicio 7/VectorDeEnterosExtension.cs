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
}
