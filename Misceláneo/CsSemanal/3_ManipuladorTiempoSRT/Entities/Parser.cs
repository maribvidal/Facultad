namespace srtTimeShifter.Entities;

using srtTimeShifter.Interfaces;

public class Parser : IParser
{
    // Este método analiza el renglón recibido del archivo
    // y de este saca dos objetos TimeSpans
    public (TimeSpan, TimeSpan) ParseLine(string line) 
    {
        string firstTimestamp = line.Substring(0, 12);
        string secondTimestamp = line.Substring(17);

        TimeSpan firstTimespan = ParseTimestamp(firstTimestamp);
        TimeSpan secondTimespan = ParseTimestamp(secondTimestamp);

        return (firstTimespan, secondTimespan);
    }

    // Este método analiza una de las partes recibidas de la
    // línea de la Timestamp, y la convierte a un objeto TimeSpan
    private TimeSpan ParseTimestamp(string line) 
    {
        int[] sections = line.Split(':', ',').Select(str => int.Parse(str)).ToArray();
        TimeSpan convertedLine = new TimeSpan(0, sections[0], sections[1], sections[2], sections[3]);
        return convertedLine;
    }
}