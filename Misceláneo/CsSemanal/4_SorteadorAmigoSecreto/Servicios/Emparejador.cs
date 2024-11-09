namespace amigoSecreto2024.Servicios;

public class Emparejador 
{
    public string[,] Emparejar(string[] nombres) 
    {
        if (nombres.Length < 2)
            throw new FormatException("Se pasaron menos de dos argumentos");

        string[,] matrizNombres = new string[nombres.Length, 2];
        enlazarNombres(matrizNombres, nombres);

        return matrizNombres;
    }

    private void enlazarNombres(string[,] matriz, string[] nombres) 
    {
        string primerNombre = nombres[0];
        for (int i = 0; i < (nombres.Length - 1); i++)
        {
            matriz[i, 0] = nombres[i];
            matriz[i, 1] = nombres[i + 1];
        }
        matriz[nombres.Length - 1, 0] = nombres[nombres.Length - 1];
        matriz[nombres.Length - 1, 1] = primerNombre;
    }
}