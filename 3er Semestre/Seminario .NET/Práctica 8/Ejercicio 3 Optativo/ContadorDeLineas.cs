using teoria8;
namespace teoria8;

public class ContadorDeLineas()
{
    private int _cantLineas = 0;
    Ingresador ingr = new Ingresador();
    ingr.ContarLineas += UnaLineaMas;
    ingr.Ingresar();


    public void Contar()
    {
        Console.WriteLine($"Cantidad de líneas ingresadas: {_cantLineas}");
    }
    void UnaLineaMas(object? sender, EventArgs e) => _cantLineas++;
}
