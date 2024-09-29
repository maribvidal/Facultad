namespace textShuffler;

public class CargadorArchivo
{
    public FileInfo Cargar(string extension)
    {
        FileInfo newFile;
        Console.WriteLine("* INGRESE LA RUTA DEL ARCHIVO DE TEXTO:");

        string filePath = UtilityClass.GetFilePath();
        newFile = new FileInfo(filePath);

        while (newFile.Extension != extension)
        {
            Console.WriteLine("* EL TIPO DE ARCHIVO DEBE SER DE TEXTO");
            filePath = UtilityClass.GetFilePath();
            newFile = new FileInfo(filePath);
        }

        return newFile;
    }
}
