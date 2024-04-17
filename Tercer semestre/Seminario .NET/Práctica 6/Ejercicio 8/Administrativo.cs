public class Administrativo : Empleado {
    //Las demás propiedades heradedadas
    public override double Salario {
        get => SalarioBase + Premio;
    }
    public double Premio {get;set;}

    //Constructor
    public Administrativo(string nombre, int dni, DateTime fechaDeIngreso, double salarioBase) : base(nombre, dni, fechaDeIngreso, salarioBase) {}

    //Métodos
    public override void AumentarSalario()
    {
        //se incrementará el salario base en un 1% por cada año de antigüedad que posea en la empresa
        int añosAntiguedad = 2022 - FechaDeIngreso.Year;
        SalarioBase *= (1 + (0.01 * añosAntiguedad));
    }

    public override string ToString() {
        return "Administrativo " + base.ToString();
    }
}
