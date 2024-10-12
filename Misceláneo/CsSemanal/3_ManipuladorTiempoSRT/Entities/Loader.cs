using System.Text.RegularExpressions;
using srtTimeShifter.Interfaces;

namespace srtTimeShifter.Entities;

public class Loader(IParser parser) : FileManipulator, ILoader
{
    // Lee las timestamps de un archivo, lo guarda en un vector de strings
    // y luego devuelve un vector de TimeSpans con esos timestamps
    public (TimeSpan, TimeSpan)[] LoadFile(string path) 
    {
        CheckPathAndFile(path);
        string[] content = GetFileLines(path);
        
        string[] timestamps = SelectTimestamps(content);
        (TimeSpan, TimeSpan)[] timespans = timestamps.Select(tmstmp => parser.ParseLine(tmstmp)).ToArray();
        
        return timespans;
    }

    private string[] SelectTimestamps(string[] content) {
        int index = 1;
        var timestamps = new List<string>();

        // Recorrido de vector optimizado
        while (index < content.Length)
        {
            timestamps.Add(content[index]);

            index++;

            // Posicionarse en el próximo bloque de código
            while (index < content.Length && !Regex.IsMatch(content[index], " --> "))
            {
                index++;
            }
        }

        if (timestamps.Count < 1)
            throw new InvalidOperationException("El archivo no tenía contenido");

        return timestamps.ToArray();
    }
}