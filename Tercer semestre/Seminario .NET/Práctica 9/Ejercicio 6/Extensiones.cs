using System.Runtime.InteropServices;

namespace teoria9;

public static class Extensiones
{
    public static void ForEach<T>(this IEnumerable<T> secuencia, Action<T> action)
    {
        foreach (T dato in secuencia)
            action(dato);
    }
    public static IEnumerable<T> Donde<T>(this IEnumerable<T> secuencia, Predicate<T> predicate)
    {
        foreach (T dato in secuencia)
        {
            if (predicate(dato))
                yield return dato;
        }
    }
    public static IEnumerable<TResult> Seleccionar<T, TResult>(this IEnumerable<T> secuencia, Action<T, TResult> action)
    {
        foreach (T dato in secuencia)
        {
            yield return action(dato);
        }
    }
}
