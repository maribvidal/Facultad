namespace teoria7;

using System.Collections;
using System.Numerics;

public class DivisiblesPor : IEnumerable
{
    public IEnumerable e { get; set; }
    public int i { get; set; }
    private int[] Intervalo;

    public DivisiblesPor(IEnumerable e, int i)
    {
        this.e = e;
        this.i = i;

        List<int> IntervaloTemp = new List<int>();

        //Generar intervalo
        foreach (int num in e)
        {
            if (num % i == 0)
                IntervaloTemp.Add(num);
        }
        Intervalo = IntervaloTemp.ToArray();
    }

    public IEnumerator GetEnumerator()
    {
        return Intervalo.GetEnumerator();
    }
}
