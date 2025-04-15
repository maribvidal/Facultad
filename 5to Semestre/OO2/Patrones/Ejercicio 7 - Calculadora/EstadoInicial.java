package unlp.oo2.patrones.ej7;

public class EstadoInicial implements IEstado {
	public String getResultado(Calculadora contexto) {
		return "" + contexto.getValorAcumulado();
	}

	public void borrar(Calculadora contexto) {
		contexto.setValorAcumulado(0);
	}

	public void setValor(Calculadora contexto, double unValor) {
		contexto.setValorActual(unValor);
	}

	public void mas(Calculadora contexto) {
		contexto.cambiarEstado(new EstadoSumando());
	}

	public void menos(Calculadora contexto) {
		contexto.cambiarEstado(new EstadoRestando());
	}

	public void por(Calculadora contexto) {
		contexto.cambiarEstado(new EstadoMultiplicando());
	}

	public void dividido(Calculadora contexto) {
		contexto.cambiarEstado(new EstadoDividiendo());
	}
}