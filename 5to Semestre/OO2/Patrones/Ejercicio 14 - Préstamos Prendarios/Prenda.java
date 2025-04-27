package unlp.oo2.patrones.ej14;

public abstract class Prenda {
	//
	// INTERFAZ PÚBLICA
	
	public abstract double calcularLiquidez();
	public abstract double calcularValor();
	public double calcularValorPrendario() {
		double calculo = this.calcularValor() * this.calcularLiquidez();
		return calculo;
	}
}