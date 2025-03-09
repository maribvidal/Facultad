using System.Diagnostics;
namespace teoria8;

public class Temporizador
{
    //Delegados
    private TemporizadorEventHandler _tic;
    public event TemporizadorEventHandler Tic
    {
        add { if (_tic == null) {_tic = value;} }
        remove { _tic -= value; }
    }
    //Propiedades
    private int _intervalo;
    public int Intervalo
    {
        get => _intervalo;
        set => _intervalo = (value > 100) ? value : 100;
    }
    private bool _habilitado = false;
    public bool Habilitado
    {
        set
        {
            if (_tic != null) {_habilitado = value; }
        }
    }

    //Métodos
    public void Comenzar()
    {
        int ticks = 0;

        double oldTicks = DateTime.Now.Ticks;
        double newTicks = oldTicks;

        while (_habilitado)
        {
            newTicks = DateTime.Now.Ticks;
            if (newTicks - oldTicks > _intervalo)
            {
                ticks++;
                var argumentos = new TemporizadorEventArgs() { Tics = ticks };
                _tic(this, argumentos); //Llamar a la función delegada
                Thread.Sleep(_intervalo); //Simular tiempo
                oldTicks = newTicks;
            }
        }
    }
}
