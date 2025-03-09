using teoria13;

class Program
{
    static void Main(string[] args)
    {
            List<Task> tareas = new List<Task>();
            {
                for (int a = 1; a <= 3; a++)
                {
                    for (int b = a + 2; b <= a + 4; b++)
                    {
                        tareas.Add(new Task(obj => Sumatoria((int[])(obj ?? new int[]{1, 1})), new int[]{a, b}));
                    }
                }
                foreach (Task tarea in tareas)
                    tarea.Start();
            }
            Task.WaitAll(tareas.ToArray());
    }
    static void Sumatoria(int[] numeros)
    {
        int distancia = numeros[1] - numeros[0] + 1;
        int suma = Enumerable.Range(numeros[0], distancia).Sum();
        Console.WriteLine($" - Sumatoria de {numeros[0]} hasta {numeros[1]}: {suma} - ");
    }
}
