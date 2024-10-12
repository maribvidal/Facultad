using srtTimeShifter.Interfaces;

namespace srtTimeShifter.Entities;

public class Deparser : IDeparser

{
    // Este método convierte las Timespan recibidas en una
    // sola línea Timestamp
    public string DeparseTuple(TimeSpan firstTimespan, TimeSpan secondTimespan) 
    {
        string firstTimestamp = firstTimespan.ToString(@"hh\:mm\:ss\.fff").Replace('.', ',');
        string secondTimestamp = secondTimespan.ToString(@"hh\:mm\:ss\.fff").Replace('.', ',');
        string convertedLine = $"{firstTimestamp} --> {secondTimestamp}";

        return convertedLine;
    }
}