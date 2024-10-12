namespace srtTimeShifter.Interfaces;

public interface IDeparser
{
    string DeparseTuple(TimeSpan firstTimespan, TimeSpan secondTimespan);
}