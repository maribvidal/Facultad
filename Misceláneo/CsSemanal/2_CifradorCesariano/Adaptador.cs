namespace cifrador;

public class Adaptador
{
    private readonly int ASCII_LOWERBOUND = 32; // Permitir el espacio en blanco
    private readonly int ASCII_UPPERBOUND = 126;

    public string adaptarCadena(string cadena)
    {
        char[] charArray = cadena.ToCharArray();
        int[] asciiArray = charArray.Select(ch => (int)ch).Where(code => (code >= ASCII_LOWERBOUND && code <= ASCII_UPPERBOUND)).ToArray();
        charArray = asciiArray.Select(code => Convert.ToChar(code)).ToArray();
        
        return new string(charArray);
    }
}