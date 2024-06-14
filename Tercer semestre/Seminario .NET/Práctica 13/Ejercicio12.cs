using teoria13;

class Program
{
    static void Main(string[] args)
    {
        List<Task<int>> tareas = new List<Task<int>>();

        for (int n = 1; n <= 10; n++)
            tareas.Add(SumatoriaAsync(n));

        Task.WaitAll(tareas.ToArray());

        foreach (Task<int> tarea in tareas)
            Console.WriteLine(tarea.Result);
    }
    static async Task<int> SumatoriaAsync(int n)
    {
        int suma = 0;
        Task tareaEjecutandose = new Task(() => {
            for (int i = 1; i <= n; i++)
                suma += i;
        });
        tareaEjecutandose.Start();
        await tareaEjecutandose;
        return suma;
    }
}
