namespace Figuras;

public class Rectangulo
{
    double _base;
    double _altura;

    public Rectangulo(double baseR, double altura) 
    {
        _base = baseR;
        _altura = altura;
    }

    public double GetArea() => _base * _altura;
}
