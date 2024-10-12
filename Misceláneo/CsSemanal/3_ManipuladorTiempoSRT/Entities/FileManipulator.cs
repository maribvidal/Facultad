namespace srtTimeShifter.Entities;

using System.Text;
using System.Text.RegularExpressions;

public abstract class FileManipulator
{
    protected void CheckPathAndFile(string path)
    {
        if (path.Length < 1)
            throw new FormatException("La cadena pasada es vacía");

        if (!File.Exists(path))
            throw new FileNotFoundException("No se encontró el archivo");
    }

    protected string[] GetFileLines(string path)
    {
        string[] content = File.ReadAllLines(path, Encoding.UTF8);
        return content;
    }
}