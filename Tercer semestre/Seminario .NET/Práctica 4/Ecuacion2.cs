namespace teoria1;

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
        switch (this.GetDiscriminante())
        {
            case 0: cantidadRaices = 1; break;
            case > 0: cantidadRaices = 2; break;
        }
        return cantidadRaices;
    }

    public void ImprimirRaices()
    {
        if (this.GetCantidadDeRaices() > 0)
        {
            double raiz = ((-1) * this.cofB + Math.Sqrt(this.GetDiscriminante())) / (2 * this.cofA);
            Console.WriteLine("Raíz 1: " + raiz);
            if (this.GetCantidadDeRaices() > 1)
            {
                double raiz2 = ((-1) * this.cofB - Math.Sqrt(this.GetDiscriminante())) / (2 * this.cofA);
                Console.WriteLine("Raíz 2: " + raiz2);
            }
        }
        else
        {
            Console.WriteLine("Esta ecuación de segundo grado no posee soluciones reales");
        }
    }
}
