package refactoring280625;

public class StrategyBasico extends RentaStrategy {
	@Override
	public double calcularTotal(Vehiculo vehiculo, int diasRenta, int kilometrajeInicial) {
		double precio = calcularPreciosDiasTotal(vehiculo, diasRenta)
				+ vehiculo.calcularCostoRecorrido(kilometrajeInicial);
		return precio * calcularAdicional(vehiculo);
	}

	public double calcularAdicional(Vehiculo vehiculo) {
		return (vehiculo.getAntiguedad() > 5 ? 0.85 : 1);
	}
}