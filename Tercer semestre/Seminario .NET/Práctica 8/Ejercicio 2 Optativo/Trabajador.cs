namespace teoria8;
class Trabajador
{
    private EventHandler? _trabajando;
    public event EventHandler? Trabajando
    {
        add
        {
            _trabajando += value;
            Trabajar();
        }
        remove
        {
        }
    }
    public void Trabajar()
    {
        _trabajando?.Invoke(this, EventArgs.Empty);
        Console.WriteLine("Trabajo concluido");
    }
}
