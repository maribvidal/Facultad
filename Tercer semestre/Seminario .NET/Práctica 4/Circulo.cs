namespace Figuras;

public class Circulo
{
    double _radio;

    public Circulo(double radio) {_radio = radio;}
    public double GetArea() => Math.PI * (_radio * _radio); //Utilizar un operador lambda para construir un método mas rápido
}
