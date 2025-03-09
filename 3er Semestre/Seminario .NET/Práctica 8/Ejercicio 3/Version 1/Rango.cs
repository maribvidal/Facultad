namespace teoria7;

using System.Collections;

public class Rango : IEnumerable
{
    public int i { get; set; }
    public int j { get; set; }
    public int p { get; set; }
    private int[] Intervalo;

    public Rango(int i, int j, int p)
    {
        this.i = i;
        this.j = j;
        this.p = p;

        //Generar intervalo
        this.Intervalo = new int[(j - i) / p + 1];
        int aux = 0;
        for (int k = i; k <= j; k += p)
        {
            Intervalo[aux] = k;
            aux++;
        }
    }

    public IEnumerator GetEnumerator()
    {
        return Intervalo.GetEnumerator();
    }
}
