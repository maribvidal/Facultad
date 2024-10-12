using srtTimeShifter.Entities;
using srtTimeShifter.Interfaces;
using textShuffler;

namespace srtTimeShifter;

public class Program 
{
    public static void Main(string[] args) 
    {
        /*
        string[] bloque = { "1", "00:02:27,208 --> 00:02:29,208", "Hombres, ¿tienen más de 40 años?", "" };

        Parser parser = new Parser();

        (TimeSpan, TimeSpan) tupla = parser.ParseBlock(bloque);

        Deparser deparser = new Deparser();

        Console.WriteLine(deparser.DeparseTuple(tupla.Item1, tupla.Item2));
        */

        IParser parser = new Parser();
        IDeparser deparser = new Deparser();

        ILoader loader = new Loader(parser);
        ISaver saver = new Saver(deparser);

        string path = "C:\\Programacion\\La ventana indiscreta.srt";

        var fileTimespans = loader.LoadFile(path);

        TimeSpan tiempoAgregar = UtilityClass.GetTimeSpan();
        Console.WriteLine($"> Se agregará este tiempo: {tiempoAgregar}");
        SincronizarTimespans(ref fileTimespans, tiempoAgregar);

        saver.SaveFile(path, fileTimespans);
    }

    private static void SincronizarTimespans(ref (TimeSpan, TimeSpan)[] timespans, TimeSpan agregador)
    {
        for (int i = 0; i < timespans.Length; i++)
            timespans[i] = (timespans[i].Item1.Add(agregador), timespans[i].Item2.Add(agregador));
    }
}