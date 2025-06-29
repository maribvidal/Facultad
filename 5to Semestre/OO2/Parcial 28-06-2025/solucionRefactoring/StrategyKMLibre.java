package refactoring280625;

public class StrategyKMLibre extends RentaStrategy {
	@Override 
	public double calcularTotal(Vehiculo vehiculo, int diasRenta, int kilometrajeInicial) {
		return calcularPreciosDiasTotal(vehiculo, diasRenta);
	}
}