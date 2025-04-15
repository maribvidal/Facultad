package unlp.oo2.patrones.ej7;

public class EstadoSumando implements IEstado {
	public String getResultado(Calculadora contexto) {
		return "" + contexto.getValorAcumulado();
	}

	public void borrar(Calculadora contexto) {
		contexto.cambiarEstado(new EstadoError());
	}

	public void setValor(Calculadora contexto, double unValor) {
		double valorViejo = contexto.getValorActual();
		contexto.setValorActual(unValor);
		contexto.setValorAcumulado(valorViejo + unValor);
	}

	public void mas(Calculadora contexto) {
		contexto.cambiarEstado(new EstadoError());
	}

	public void menos(Calculadora contexto) {
		contexto.cambiarEstado(new EstadoError());
	}

	public void por(Calculadora contexto) {
		contexto.cambiarEstado(new EstadoError());
	}

	public void dividido(Calculadora contexto) {
		contexto.cambiarEstado(new EstadoError());
	}
}