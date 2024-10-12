using srtTimeShifter.Interfaces;
using System.Text;
using System.Text.RegularExpressions;

namespace srtTimeShifter.Entities;

public class Saver(IDeparser deparser) : FileManipulator, ISaver
{
    public void SaveFile(string path, (TimeSpan, TimeSpan)[] timestamps)
    {
        CheckPathAndFile(path);
        string[] content = GetFileLines(path);

        ReplaceTimestamps(timestamps, ref content);
        File.WriteAllLines(path, content, Encoding.UTF8);
    }

    private void ReplaceTimestamps((TimeSpan, TimeSpan)[] timestamps, ref string[] content)
    {
        int index = 1;
        int index_tmstmp = 0;

        // Recorrido de vector optimizado
        while (index < content.Length)
        {
            content[index] = deparser.DeparseTuple(timestamps[index_tmstmp].Item1, timestamps[index_tmstmp].Item2);

            index_tmstmp++;
            index++;

            // Posicionarse en el próximo bloque de código
            while (index < content.Length && !Regex.IsMatch(content[index], " --> "))
            {
                index++;
            }
        }
    }
}