using teoria13;

class Program
{
    static void Main(string[] args)
    {
        List<Task<int>> tareas = new List<Task<int>>();
        for (int n = 1; n <= 10; n++)
            tareas.Add(Task<int>.Factory.StartNew(obj => Sumatoria((int)(obj ?? 1)), n));
        Task.WaitAll(tareas.ToArray());

        foreach (Task<int> tarea in tareas)
            Console.WriteLine(tarea.Result);
    }
    static int Sumatoria(int n)
    {
        int suma = 0;
        for (int i = 1; i <= n; i++)
        {
            suma += i;
        }
        return suma;
    }
}
