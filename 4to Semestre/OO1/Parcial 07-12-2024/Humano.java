package parcial.segundaFecha;

public class Humano extends Personaje {
	// Al crear un humano, los valores iniciales de nivel, inteligencia
	// y fuerza son los siguientes: 1, 2, 1
	public Humano(String nom, IRol rol) {
		super(nom, rol);
		this.inteligencia = 2;
		this.fuerza = 1;
	}
	
	// En el caso de los humanos, se incrementa un 40% solamente si es de día
	public double determinarPoderAtaque(int hora) {
		double valorBase = this.calcularValorBase();
		double poderAtq = valorBase + (this.esDeDia(hora) ? valorBase * 0.4 : 0 );
		return poderAtq;
	}
	
	// Los humanos aumentan sus habilidades según su rol a partir del nivel 7
	public void subirNivel() {
		this.nivel++; // --nota: esto lo podría haber generalizado
		if (this.nivelMayorSiete()) {
			this.rol.incrementarHabilidad(this);
		}
	}
	
	// MÉTODOS SECUNDARIOS
	
	private boolean nivelMayorSiete() { return (this.nivel >= 7); }
}
