package refactoring280625;

public abstract class RentaStrategy {
	public abstract double calcularTotal(Vehiculo vehiculo, int diasRenta, int kilometrajeInicial);
	
	public double calcularPreciosDiasTotal(Vehiculo vehiculo, int diasRenta) {
		return diasRenta * vehiculo.getPrecioPorDia();
	}
}