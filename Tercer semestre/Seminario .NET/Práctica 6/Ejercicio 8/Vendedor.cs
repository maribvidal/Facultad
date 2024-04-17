public class Vendedor : Empleado {
    //Las demás propiedades heradedadas
    public override double Salario {
        get => SalarioBase + Comision;
    }
    public double Comision {get;set;}

    //Constructor
    public Vendedor(string nombre, int dni, DateTime fechaDeIngreso, double salarioBase) : base(nombre, dni, fechaDeIngreso, salarioBase) {}

    //Métodos
    public override void AumentarSalario()
    {
        //se incrementará el salario base en un 5% si su antigüedad es inferior a 10 años o en un 10% en caso contrario
        if (2022 - FechaDeIngreso.Year < 10)
            SalarioBase *= 1.05;
        else
            SalarioBase *= 1.10;
    }

    public override string ToString() {
        return "Vendedor " + base.ToString();
    }
}
