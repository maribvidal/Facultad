package refactoring280625;

public class Renta {
	private Vehiculo vehiculo;
	private Cliente cliente;
	private int diasRenta;
	private RentaStrategy rentaStrategy;
	private int kilometrajeInicial;
	
	public Renta(Vehiculo vehiculo, 
			Cliente cliente, int diasRenta) {
		this.vehiculo = vehiculo;
		this.cliente = cliente;
		this.diasRenta = diasRenta;
		this.kilometrajeInicial = 
				vehiculo.getKilometraje();
		this.rentaStrategy = new StrategyBasico();
	}
	
	public void setRentaStrategy(RentaStrategy rentaStrategy){
		this.rentaStrategy = rentaStrategy;
	}
	
	public double calcularTotal() {
		return this.rentaStrategy.calcularTotal(vehiculo, diasRenta, kilometrajeInicial);
	}
}