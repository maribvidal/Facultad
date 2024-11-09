namespace amigoSecreto2024.Servicios;

public class Mezclador
{
    public void Mezclar(string[] nombres)
    {
        Random rnd = new Random();
        
        for (int i = nombres.Length - 1; i >= 0; i--)
        {
            int index = rnd.Next(i);
            string temp = nombres[index];
            nombres[index] = nombres[i];
            nombres[i] = temp;
        }
    }
}