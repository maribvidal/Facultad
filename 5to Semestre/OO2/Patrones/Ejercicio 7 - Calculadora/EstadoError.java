package unlp.oo2.patrones.ej7;

public class EstadoError implements IEstado {
	public String getResultado(Calculadora contexto) {
		return "ERROR";
	}

    public void borrar(Calculadora contexto) {
		contexto.setValorAcumulado(0);
		contexto.cambiarEstado(new EstadoInicial());
	}

	public void setValor(Calculadora contexto, double unValor) {}
	public void mas(Calculadora contexto) {}
	public void menos(Calculadora contexto) {}
	public void por(Calculadora contexto) {}
	public void dividido(Calculadora contexto) {}
}