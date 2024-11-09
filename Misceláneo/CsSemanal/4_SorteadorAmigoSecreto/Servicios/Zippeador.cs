using System.IO.Compression;

namespace amigoSecreto2024.Servicios;

public class Zippeador
{
    public void Ejecutar(string directorioActual, string directorioArchivos)
    {
        ZipFile.CreateFromDirectory(directorioArchivos, directorioActual + "sorteado.zip");
    }
}