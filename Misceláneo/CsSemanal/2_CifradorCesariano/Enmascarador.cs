namespace cifrador;

public class Enmascarador
{
    private readonly int LIMITE_SUPERIOR = 32; // Solo está para colocar poner un rango
    private readonly int INT_RANGE = 93;

    public Queue<int> generarMascara(int limite) 
    {
        revisarLimite(limite);

        var queueMask = new Queue<int>();
        var randomizer = new Random();

        for (int i = 0; i < limite; i++)
        {
            int generatedNumber = randomizer.Next(1, INT_RANGE);
            queueMask.Enqueue(generatedNumber);
            Console.Write(generatedNumber + " - ");
        }

        return queueMask;
    }

    public Queue<int> ingresarMascara(int limite)
    {
        revisarLimite(limite);

        var queueMask = new Queue<int>();
        
        Console.WriteLine($"> INGRESE {limite} DÍGITOS: ");

        for (int i = 0; i < limite; i++)
        {
            int receivedNumber = UtilityClass.GetNumber(1, INT_RANGE);
            queueMask.Enqueue(receivedNumber);
        }

        return queueMask;
    }

    private void revisarLimite(int limite)
    {
        if (limite < 1) 
            throw new ArgumentOutOfRangeException("Se necesita un límite superior a 0");

        if (limite > LIMITE_SUPERIOR)
            throw new ArgumentOutOfRangeException($"Se necesita un límite inferior a {LIMITE_SUPERIOR}");
    }
}