using teoria13;

class Program
{
    static void Main(string[] args)
    {
        List<Task> tareas = new List<Task>();
        for(int a = 1; a <= 3; a++)
        {
            for (int b = a + 2; b <= a + 4; b++)
            {
                tareas.Add(SumatoriaAsync(a, b));
            }
        }
        Task.WaitAll(tareas.ToArray());
    }
    static async Task SumatoriaAsync(int a, int b)
    {
        int distancia = b - a + 1;
        int suma = 0;
        Task t = new Task(() => suma = Enumerable.Range(a, distancia).Sum());
        t.Start();
        await t; // await suspende la ejecución del método SumatoriaAsync
        Console.WriteLine($"suma de {a} hasta {b} = {suma}");
    }
}
