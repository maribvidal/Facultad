public class Ecuacion2
{
    private double cofA;
    private double cofB;
    private double cofC;

    public Ecuacion2(double cofA, double cofB, double cofC)
    {
        this.cofA = cofA;
        this.cofB = cofB;
        this.cofC = cofC;
    }

    //Métodos
    public double GetDiscriminante()
    {
        double primeraParte = Math.Pow(this.cofB, 2);
        double segundaParte = (4 * this.cofA * this.cofC);
        return (primeraParte - segundaParte);
    }

    public int GetCantidadDeRaices()
    {
        int cantidadRaices = 0;
        if (this.GetDiscriminante() >= 0)
        {
            cantidadRaices++;
            if (this.GetDiscriminante() > 0) { cantidadRaices++; }
        }
        return cantidadRaices;
    }

    public void ImprimirRaices()
    {
        if (this.GetCantidadDeRaices() > 0)
        {
            double raiz = Math.Sqrt(this.GetDiscriminante());
            Console.WriteLine("Raíz 1: " + raiz);
            Console.WriteLine("Raíz 2: " + (-raiz));
        }
        else
        {
            Console.WriteLine("Esta ecuación de segundo grado no posee soluciones reales");
        }
    }
}
