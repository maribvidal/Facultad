public static class Extensiones
{
    public static void ForEach<T>(this IEnumerable<T> secuencia, Action<T> action)
    {
        foreach (T dato in secuencia)
            action(dato);
    }
}
