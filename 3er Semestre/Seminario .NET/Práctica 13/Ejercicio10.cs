using teoria13;

class Program
{
    static string leyenda = "Valores procesados: ";
    static object _bloqueo = new();
    public static void Main()
    {
        List<Task> tareas = new List<Task>();
        for (int n = 1; n <= 10; n++)
        {
            Task t = new Task((o) => Procesar(o), n);
            tareas.Add(t);
            t.Start();
        }
        Task.WaitAll(tareas.ToArray());
        Console.WriteLine(leyenda);
    }
    static void Procesar(object obj)
    {
        // hace algún trabajo y accede a una variable compartida;
        lock (_bloqueo)
        {
            leyenda += obj + " ";
        }
    }
}
