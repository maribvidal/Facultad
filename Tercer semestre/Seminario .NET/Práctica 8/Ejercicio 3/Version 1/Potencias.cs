namespace teoria7;

using System.Collections;

public class Potencias : IEnumerable
{
    public int b { get; set; }
    public int k { get; set; }
    private int[] Intervalo;

    public Potencias(int b, int k)
    {
        this.b = b;
        this.k = k;

        //Generar intervalo
        this.Intervalo = new int[k];
        for (int i = 0; i < k; i++)
        {
            Intervalo[i] = (int )Math.Pow(2, i+1);
        }
    }

    public IEnumerator GetEnumerator()
    {
        return Intervalo.GetEnumerator();
    }
}
