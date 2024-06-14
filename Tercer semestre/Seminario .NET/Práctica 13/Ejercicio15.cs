using System.IO;
using teoria13;

class Program
{
    static void Main(string[] args)
    {
        string[] nombresDeArchivos = ["archivo_prueba.txt", "archivo_prueba2.txt", "archivo_prueba3.txt"];
        Task<int[]> tarea = VariosAsync(nombresDeArchivos);
        int[] longitudesDeArchivos = tarea.Result;

        for (int i = 0; i < nombresDeArchivos.Length; i++)
            Console.WriteLine($" * Cantidad de palabras de ({nombresDeArchivos[i]}) - {longitudesDeArchivos[i]}");
    }

    static async Task<int[]> VariosAsync(string[] nombres)
    {
        int[] longitudes = new int[nombres.Length];

        //Vamos a crear un vector de tareas<int> para poder manejarlas todas
        Task<int>[] tareas = new Task<int>[nombres.Length];

        //Asignarle a cada espacio del vector una de las tareas con un nombre de archivo
        for (int i = 0; i < nombres.Length; i++)
            tareas[i] = PalabrasAsync(nombres[i]);

        //Esperar a que se terminen de completar todas las tareas
        await Task.WhenAll(tareas);

        //Copiar el resultado de cada tarea en su respectivo lugar del vector de longitudes
        for (int i = 0; i < nombres.Length; i++)
            longitudes[i] = tareas[i].Result;

        return longitudes;
    }

    static async Task<int> PalabrasAsync(string nombreArchivo)
    {
        int numeroPalabras = 0;
        Task<string> tareaExtraer = ContenidoAsync(nombreArchivo);
        await tareaExtraer;

        numeroPalabras = tareaExtraer.Result.Split(" ").Length - 1;

        return numeroPalabras;
    }

    static async Task<string> ContenidoAsync(string nombreArchivo)
    {
        string contenidoDevuelto = "";
        string curDir = System.AppDomain.CurrentDomain.BaseDirectory;

        Task extraerContenido = new Task(() => {
            if (!File.Exists(curDir + nombreArchivo))
                Console.WriteLine($"ERROR: Esta dirección no existe ({curDir + nombreArchivo})");
            else
                contenidoDevuelto = File.ReadAllText(curDir + nombreArchivo);
        });

        extraerContenido.Start();

        await extraerContenido;
        return contenidoDevuelto;
    }
}
