using System.IO;

namespace amigoSecreto2024.Servicios;

public class Ficherizador
{
    public void Ficherizar(string directorio, string[,] nombresEmparejados, string mensaje)
    {
        for (int i = 0; i < nombresEmparejados.GetLength(0); i++)
        {
            string filePath = directorio + $"para_{nombresEmparejados[i, 0]}.txt";
            crearArchivo("¡Buenos días! ", mensaje, 
                        nombresEmparejados[i, 0],
                        nombresEmparejados[i, 1],
                        filePath);
        }
    }

    private void crearArchivo(string msj1, string msj2, string destinatario, string receptor, string filePath)
    {
        using (StreamWriter sw = new StreamWriter(filePath, false))
        {
            sw.WriteLine($"{msj1} {destinatario}");
            sw.WriteLine($"{msj2} {receptor}");
        }
    }
}