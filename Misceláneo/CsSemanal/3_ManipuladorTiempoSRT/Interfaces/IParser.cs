namespace srtTimeShifter.Interfaces;

public interface IParser
{
    (TimeSpan, TimeSpan) ParseLine(string line);
}