namespace teoria1;

public class Cuenta
{
    private double _monto = 0; //Inicializarlo en 0 por defecto
    private int _titularDNI;
    private string? _titularNombre;

    //Sobrecarga del método constructor
    public Cuenta() {} //Incluir método vacío
    public Cuenta(int titularDNI)
    {
        _titularDNI = titularDNI;
    }
    public Cuenta(string titularNombre)
    {
        _titularNombre = titularNombre;
    }
    public Cuenta(string titularNombre, int titularDNI)
    {
        _titularNombre = titularNombre;
        _titularDNI = titularDNI;
    }

    //Métodos de instancia
    public void Depositar(int monto)
    {
        _monto += monto;
    }
    public void Extraer(int extraer)
    {
        //Primero comprobar si hay suficiente plata en la cuenta para extraer
        if (_monto - extraer > 0)
        {
            _monto -= extraer;
        }
        else
        {
            Console.WriteLine("Operación cancelada, monto insuficiente");
        }
    }
    public void Imprimir()
    {
        string nombre = _titularNombre ?? "No especificado"; //Hacer uso del null-coalescing, operación que pregunta si el primer valor es igual a null, y en dicho caso asigna el segundo
        string DNI = (_titularDNI != 0) ? _titularDNI.ToString() : "No especificado";
        
        Console.WriteLine($"Nombre: {nombre}, DNI: {DNI}, Monto: {_monto}");
    }
}
