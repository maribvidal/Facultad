package refactoring280625;

public class StrategyPlus extends RentaStrategy {
	@Override
	public double calcularTotal(Vehiculo vehiculo, int diasRenta, int kilometrajeInicial) {
		int kilometrosRecorridos = vehiculo.calcularKilometrosRecorridos(kilometrajeInicial);
		return vehiculo.calcularCostoRecorrido(kilometrosRecorridos);
	}
}
