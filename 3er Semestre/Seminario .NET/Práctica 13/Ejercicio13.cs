using System.IO;
using teoria13;

class Program
{
    static void Main(string[] args)
    {
        Task<string> tarea = ContenidoAsync("archivo_prueba.txt");
        Console.WriteLine(tarea.Result);
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
