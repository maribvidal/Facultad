package ar.edu.unlp.oo1.ejercicio15;

public class Consumo {
	int consumoEnergiaActiva;
	int consumoEnergiaReactiva;
	
	public Consumo(int consumoEnergiaActiva, int consumoEnergiaReactiva) {
		this.consumoEnergiaActiva = consumoEnergiaActiva;
		this.consumoEnergiaReactiva = consumoEnergiaReactiva;
	}
	
	public int getEnergiaActiva() { return this.consumoEnergiaActiva; }
	public int getEnergiaReactiva() { return this.consumoEnergiaReactiva; }
}
