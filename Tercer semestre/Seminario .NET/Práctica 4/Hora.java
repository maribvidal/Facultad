public class Hora
{
    private int Horas;
    private int Minutos;
    private double Segundos;

    //Método constructor
    public Hora(int Horas, int Minutos, double Segundos)
    {
        this.Horas = Horas;
        this.Minutos = Minutos;
        this.Segundos = Segundos;
    }

    //Sobrecarga del método constructor
    public Hora(double tm)
    {
        double decimales = tm - Math.Floor(tm);
        double min = decimales * 60;
        this.Horas = (int)(Math.Floor(tm));
        this.Minutos = (int)(Math.Floor(tm));
        this.Segundos = (min - Math.Floor(min)) * 60;
    }

    //Otros métodos de instancia
    public void Imprimir()
    {
        //Determinar si es un número entero o no
        if (this.Segundos % 1 == 0)
        {
            Console.WriteLine($"{this.Horas} horas, {this.Minutos} minutos y {this.Segundos} segundos");
        }
        else
        {
            Console.WriteLine($"{this.Horas} horas, {this.Minutos} minutos y {this.Segundos:0.000} segundos");
        }
    }
}
