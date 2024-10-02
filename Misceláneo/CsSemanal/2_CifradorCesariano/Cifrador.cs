namespace cifrador;

public class Cifrador(Queue<int> mascara)
{
    private readonly int ASCII_LOWERBOUND = 33;
    private readonly int ASCII_UPPERBOUND = 126;

    public string traducir(string text, bool cifrar)
    {
        Queue<int> copia = new Queue<int>(mascara);
        char[] charArray = text.ToCharArray();
        int[] asciiArray = charArray.Select(ch => (int)ch).ToArray();

        for (int i = 0; i < asciiArray.Length; i++)
        {
            int charCode = asciiArray[i];
            
            // No contamos los espacios
            if (charCode != 32)
            {
                int dequeuedNumber = copia.Dequeue();

                // ¿Cifrar o descifrar?
                if (cifrar)
                    charCode += dequeuedNumber;
                else
                    charCode -= dequeuedNumber;

                copia.Enqueue(dequeuedNumber);
                charCode = normalizeNumber(charCode);
            }

            asciiArray[i] = charCode;
        }

        charArray = asciiArray.Select(code => Convert.ToChar(code)).ToArray();
        string newText = new String(charArray);

        return newText;
    }

    private int normalizeNumber(int numero)
    {
        int range = ASCII_UPPERBOUND - ASCII_LOWERBOUND;

        if (numero > ASCII_UPPERBOUND)
        {
            int desplacement = numero - ASCII_UPPERBOUND;
            return (ASCII_LOWERBOUND + desplacement);
        }
        if (numero < ASCII_LOWERBOUND)
        {
            int desplacement = ASCII_LOWERBOUND;

            if (numero >= 0)
                desplacement = ASCII_LOWERBOUND - numero;
            else
                desplacement += Math.Abs(numero);

            return (ASCII_UPPERBOUND - desplacement);
        }

        return numero;
    }
}