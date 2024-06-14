using System.IO;
using teoria13;

class Program
{
    static void Main(string[] args)
    {
        Task<int> tarea = PalabrasAsync("archivo_prueba.txt");
        Console.WriteLine($"Número de palabras (medido con la cantidad de espacios): {tarea.Result}");
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
