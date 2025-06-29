package refactoring280625;

public class Renta {
	private Vehiculo vehiculo;
	private Cliente cliente;
	private int diasRenta;
	private String tipoRenta;
	private int kilometrajeInicial;
	
	public Renta(Vehiculo vehiculo, 
			Cliente cliente, int diasRenta) {
		this.vehiculo = vehiculo;
		this.cliente = cliente;
		this.diasRenta = diasRenta;
		this.kilometrajeInicial = 
				vehiculo.getKilometraje();
		this.tipoRenta = "BASICO";
	}
	
	public void setTipoRenta(String tipoRenta){
		this.tipoRenta = tipoRenta;
	}
	
	public double calcularTotal() {
		if (this.tipoRenta == "BASICO") {
			int kilometrosRecorridos = vehiculo.getKilometraje() - this.kilometrajeInicial;
			double precio = diasRenta * vehiculo.getPrecioPorDia()
					+ kilometrosRecorridos * vehiculo.getPrecioPorKm();
			double adicional = 1;
			// los autos mas viejos tienen un 15% de descuento
			if (vehiculo.getAntiguedad() > 5) {
				adicional = 0.85;
			}
			return precio * adicional;
		}
		else if (this.tipoRenta == "PLUS") {
			int kilometrosRecorridos = vehiculo.getKilometraje() - this.kilometrajeInicial;
			return kilometrosRecorridos * vehiculo.getPrecioPorKm();
		} else { // sí el tipo de renta es "KILOMETRAJE_LIBRE"
			return diasRenta * vehiculo.getPrecioPorDia();
} } }