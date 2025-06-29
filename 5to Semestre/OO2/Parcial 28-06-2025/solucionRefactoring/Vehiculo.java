package refactoring280625;

public class Vehiculo {
	private int kilometraje;
	private double precioPorDia;
	private double precioPorKm;
	private int antiguedad;
	
	public Vehiculo(int kilometraje, double precioPorDia, double precioPorKm, int antiguedad) {
		this.kilometraje = kilometraje;
		this.precioPorDia = precioPorDia;
		this.precioPorKm = precioPorKm;
		this.antiguedad = antiguedad;
	}

	public int getKilometraje() {
		return kilometraje;
	}

	public double getPrecioPorDia() {
		return precioPorDia;
	}

	public double getPrecioPorKm() {
		return precioPorKm;
	}

	public int getAntiguedad() {
		return antiguedad;
	}
	
	public void aumentarKilometraje(int cantidadKm) {
		this.kilometraje += cantidadKm;
	}

	public int calcularKilometrosRecorridos(int kilometrajeInicial) {
		int kilometrosRecorridos = getKilometraje() - kilometrajeInicial;
		return kilometrosRecorridos;
	}

	public double calcularCostoRecorrido(int kilometrajeInicial) {
		return calcularKilometrosRecorridos(kilometrajeInicial) * getPrecioPorKm();
	}
}