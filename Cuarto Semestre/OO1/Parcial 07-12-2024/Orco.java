package parcial.segundaFecha;

public class Orco extends Personaje {
	// Al crear un orco, los valores iniciales de nivel, inteligencia
	// y fuerza son los siguientes: 1, 1, 2
	public Orco(String nom, IRol rol) {
		this.nombre = nom;
		this.nivel = 1;
		this.habilidad = new Habilidad(1, 2);
		this.rol = rol;
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
			this.rol.incrementarHabilidad(this.nivel, this.habilidad);
		}
	}
	
	// MÉTODOS SECUNDARIOS
	
	private boolean nivelMultiploTres() { return (this.nivel % 3 == 0); }
}
