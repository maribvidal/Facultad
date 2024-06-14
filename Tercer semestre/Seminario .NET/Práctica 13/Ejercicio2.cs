using teoria13;

class Program
{
    static void Main(string[] args)
    {
        Task[] vectorTareas = new Task[100];
        for (int i = 0; i < 100; i++)
        {
            vectorTareas[i] = new Task(() => Imprimir();
            vectorTareas[i].Start();
        }
        Task.WaitAll(vectorTareas); //Espera a que todas las tareas dentro del vector terminen
    }
    
    //Métodos
    static void Imprimir()
    {
        int idThread = Thread.CurrentThread.ManagedThreadId;
        int? idTarea = Task.CurrentId;
        Console.WriteLine($"Tarea: {idTarea} Thread: {idThread}");
    }
}
