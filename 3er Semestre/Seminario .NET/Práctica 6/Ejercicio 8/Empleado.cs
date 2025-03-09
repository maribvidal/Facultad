//No se podrán crear objetos de la clase padre Empleado
abstract public class Empleado 
{
    public string Nombre {get;}
    public int DNI {get;}
    public DateTime FechaDeIngreso {get;}
    public double SalarioBase {get; protected set;} //No puede ser solo de lectura
    public abstract double Salario {get;} //Sobreescribirla desde clases derivadas

    //Constructor
    public Empleado(string nombre, int dni, DateTime fechaDeIngreso, double salarioBase)
    {
        Nombre = nombre;
        DNI = dni;
        FechaDeIngreso = fechaDeIngreso;
        SalarioBase = salarioBase;
    }

    //Métodos
    public abstract void AumentarSalario();
    public override string ToString() {
        return $"Nombre: {Nombre}, DNI: {DNI} Antigüedad: {2022 - FechaDeIngreso.Year}\nSalario base: {SalarioBase}, Salario: {Salario}\n-------------";
    }
}
