namespace teoria7;

public class ComparadorLongitudNombre() : System.Collections.IComparer
{
    public int Compare(object? x, object? y)
    {
        int result = 1;
        if (x is INombrable pe && y is INombrable pr)
        {
            int longPe = pe.Nombre.Length;
            int longPr = pr.Nombre.Length;
            result = longPe.CompareTo(longPr);
        }
        return result;
    }
}
