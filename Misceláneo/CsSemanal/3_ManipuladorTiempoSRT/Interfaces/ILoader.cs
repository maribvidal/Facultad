namespace srtTimeShifter.Interfaces;

public interface ILoader
{
    (TimeSpan, TimeSpan)[] LoadFile(string path);
}