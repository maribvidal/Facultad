namespace teoria5;

public class Cuenta
{
    //Variables de instancia
    private int _id;
    private int _saldo = 0;

    //Campos estáticos
    private static int s_extraccionesFallidas = 0;
    private static int s_operacionesDeposito = 0;
    private static int s_operacionesExtracciones = 0;
    private static int s_numId = 0;
    private static int s_totalDepositado = 0;
    private static int s_totalExtraido = 0;
    private static int s_totalSaldo = 0;
    private readonly static List<Cuenta> s_listaCuentas = new List<Cuenta>();

    //Método constructor
    public Cuenta()
    {
        _id = ++s_numId; //Asignarle la variable estática, incrementada, a la variable de instancia
        Console.WriteLine($"Se creó la cuenta Id={_id}");
        s_listaCuentas.Add(this);
    }

    //Métodos de instancia
    public Cuenta Depositar(int suma)
    {
        _saldo += suma;
        Console.WriteLine($"Se depositó {suma} en la cuenta {_id} (Saldo={_saldo})");
        //Miembros estáticos
        s_totalDepositado += suma;
        s_totalSaldo += suma;
        s_operacionesDeposito++;
        return this;
    }

    public Cuenta Extraer(int suma)
    {
        //Verificar si se puede realizar la extracción
        if (_saldo - suma >= 0) {
            _saldo -= suma;
            Console.WriteLine($"Se extrajo {suma} de la cuenta {_id} (Saldo={_saldo})");
            //Miembros estáticos
            s_totalExtraido += suma;
            s_totalSaldo -= suma;
            s_operacionesExtracciones++;
        }
        else 
        {
            s_extraccionesFallidas++;
            Console.WriteLine("Operación denegada - Saldo insuficiente");
        }
        return this;
    }

    //Métodos estáticos
    public static void ImprimirDetalle()
    {
        Console.WriteLine($"CUENTAS CREADAS: {s_numId}");
        Console.WriteLine($"DEPÓSITOS:       {s_operacionesDeposito}     - Total depositado:   {s_totalDepositado}");
        Console.WriteLine($"DEPÓSITOS:       {s_operacionesExtracciones}     - Total extraido:     {s_totalExtraido}");
        Console.WriteLine($"                       - Saldo:              {s_totalSaldo}");
        Console.WriteLine($"  * Se denegaron {s_extraccionesFallidas} extracciones por falta de fondos");
    }

    public static List<Cuenta> GetCuentas()
    {
        return new List<Cuenta>(s_listaCuentas); //Devolver un clon del listado interno de la Clase
    }
}
