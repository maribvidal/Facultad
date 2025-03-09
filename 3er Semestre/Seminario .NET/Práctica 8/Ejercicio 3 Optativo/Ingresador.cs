namespace teoria8;
public class Ingresador()
{
    private EventHandler? _contarLineas = null;
    public event EventHandler ContarLineas
    {
        add
        {
            if (_contarLineas == null)
            {
                _contarLineas += value;
                Console.WriteLine("Método agregado");
            }
            else
            {
                Console.WriteLine("No se pudo agregar dicho método");
            }
        }
        remove
        {
            _contarLineas -= value;
        }
    }
    public void Ingresar()
    {
        string st = Console.ReadLine() ?? "";
        while (st != "")
        {
            _contarLineas?.Invoke(this, EventArgs.Empty);
            st = Console.ReadLine() ?? "";
        }
    }
}
