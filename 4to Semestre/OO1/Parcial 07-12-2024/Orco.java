package parcial.segundaFecha;

public class Orco extends Personaje {
	// Al crear un orco, los valores iniciales de nivel, inteligencia
	// y fuerza son los siguientes: 1, 1, 2
	public Orco(String nom, IRol rol) {
		super(nom, rol);
		this.inteligencia = 1;
		this.fuerza = 2;
	}
	
	// En cambio, para los orcos, se incrementa un 60% solamente sí es de noche
	public double determinarPoderAtaque(int hora) {
		double valorBase = this.calcularValorBase();
		double poderAtq = valorBase + (!this.esDeDia(hora) ? valorBase * 0.6 : 0 );
		return poderAtq;
	}
	
	// Los orcos aumentan sus habilidades según su rol cada 3 niveles
	public void subirNivel() {
		this.nivel++;
		if (this.nivelMultiploTres()) {
			this.rol.incrementarHabilidad(this);
		}
	}
	
	// MÉTODOS SECUNDARIOS
	
	private boolean nivelMultiploTres() { return (this.nivel % 3 == 0); }
}
