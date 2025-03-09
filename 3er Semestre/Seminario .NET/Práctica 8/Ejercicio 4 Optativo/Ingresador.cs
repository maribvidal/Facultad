namespace teoria8;

public class Ingresador
{
    private EventHandler? _lineaVaciaIngresada;
    public event EventHandler LineaVaciaIngresada
    {
        add
        {
            if (_lineaVaciaIngresada == null)
                _lineaVaciaIngresada = value;
        }
        remove
        { 
            _lineaVaciaIngresada -= value;
        }
    }
    public IngresadorEventHandler? NroIngresado;
    public void Ingresar()
    {
        string st = Console.ReadLine() ?? "";
        int valorNum;
        while (st != "fin")
        {
            st = Console.ReadLine() ?? "";
            //Si lo que se ingresa es una línea vacía...
            if (st == "")
            {
                if (_lineaVaciaIngresada != null)
                    _lineaVaciaIngresada(this, EventArgs.Empty);
            }
            //Si lo que se ingresa es un número
            else if (int.TryParse(st, out valorNum))
            {
                var n = new IngresadorEventArgs() { Valor = valorNum };
                NroIngresado(this, n);
            }
        }
    }
}
