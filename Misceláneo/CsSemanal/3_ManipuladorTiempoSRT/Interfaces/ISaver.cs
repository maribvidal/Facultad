namespace srtTimeShifter.Interfaces;

public interface ISaver
{
    void SaveFile(string path, (TimeSpan, TimeSpan)[] timestamps);
}