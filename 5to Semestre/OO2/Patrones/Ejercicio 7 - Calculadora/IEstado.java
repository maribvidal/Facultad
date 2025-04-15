package unlp.oo2.patrones.ej7;

public interface IEstado {
    public String getResultado(Calculadora contexto);
    public void borrar(Calculadora contexto);
    public void setValor(Calculadora contexto, double unValor);
    public void mas(Calculadora contexto);
    public void menos(Calculadora contexto);
    public void por(Calculadora contexto);
    public void dividido(Calculadora contexto);
}