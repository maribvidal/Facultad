using teoria13;

class Program
{
    static void Main(string[] args)
    {
        //Primero, calculemos cuanto tarda ejecutar las 4 tareas de manera asincrónica
        Task[] vectorTareas = new Task[4];
        for (int i = 0; i < 4; i++)
            vectorTareas[i] = new Task(Procesar);

        DateTime tiempoInicial = DateTime.Now;
        for (int i = 0; i < 4; i++)
            vectorTareas[i].Start();
        Task.WaitAll(vectorTareas);
        double tiempoTranscurrido = (DateTime.Now - tiempoInicial).TotalMilliseconds;
        
        Console.WriteLine($"Tiempo transcurrido (ejecución asincrónica): {tiempoTranscurrido} \n");

        //Luego, veamos cuanto tarda si las ejecutamos secuencialmente
        tiempoInicial = DateTime.Now;
        for (int i = 0; i < 4; i++)
            Procesar();
        tiempoTranscurrido = (DateTime.Now - tiempoInicial).TotalMilliseconds;

        Console.WriteLine($"Tiempo transcurrido (ejecución sincrónica): {tiempoTranscurrido}");
    }
    
    //Métodos
    static void Procesar()
    {
        for (int i = 0; i < 100000; i++)
        {
            string st = i.ToString();
        }
        Console.WriteLine("Fin del procesamiento");
    }
}

// OBSERVACIONES:
// Es de interés notar que, mientras mas crece la cantidad de operaciones que se le asigne al método Procesar,
// mas eficiente se vuelve el uso de los métodos asincrónicos que los sincrónicos, ya que no es lo mismo hacer
// las cuatro mismas tareas con un solo thread, que repartir las cuatro tareas entre dos o mas threads de la CPU.
