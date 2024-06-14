using teoria13;

class Program
{
    static void Main(string[] args)
    {
        List<Task> tareas = new List<Task>();
        {
            for (int i = 0; i <= 10; i++) 
            {
                tareas.Add(new Task(obj => Sumatoria((int)(obj ?? 0)), i));
                tareas.ElementAt(i).Start();
            }
        }
        Task.WaitAll(tareas.ToArray());
    }
    static void Sumatoria(int n)
    {
        int suma = Enumerable.Range(1, n).Sum();
        Console.WriteLine($" - Sumatoria de 1 hasta {n}: {suma} - ");
    }
}
