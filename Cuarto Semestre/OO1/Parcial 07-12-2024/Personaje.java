package parcial.segundaFecha;

import java.util.List;

// Cada personaje tiene un nombre, un nivel y habilidades distribuidas
// Un personaje tiene un rol

public abstract class Personaje {
	protected String nombre;
	protected int nivel;
	protected double fuerza;
	protected double inteligencia;
	protected IRol rol;
	
	public Personaje(String nom, IRol rol) {
		this.nombre = nom;
		this.nivel = 1;
		this.rol = rol;
	}
	
	// MÉTODOS QUE VAN A TENER QUE IMPLEMENTAR LAS SUBCLASES
	
	public abstract double determinarPoderAtaque(int hora);
	public abstract void subirNivel();
	 
	// Dados dos personajes, y el momento del día, se determina el ganador.
	// El personaje con el mayor poder de ataque gana el enfrentamiento y 
	// sube de nivel. En caso de empate, ambos suben de nivel.
	public void enfrentarCon(Personaje otro, int hora) {
		if (this.determinarPoderAtaque(hora) > otro.determinarPoderAtaque(hora)) {
			this.subirNivel();
		} else if (otro.determinarPoderAtaque(hora) > this.determinarPoderAtaque(hora)) {
			otro.subirNivel();
		} else {
			this.subirNivel();
			otro.subirNivel();
		}
	}
	
	// Dados un personaje y una colección de personajes, se quiere obtener los
	// personajes cuyo nivel es adecuado para un enfrentamiento parejo.
	public List<Personaje> oponentesNivelSimilar(List<Personaje> coleccion) {
		List<Personaje> similares = coleccion.stream().filter(op -> this.esSimilarA(op)).toList();
		return similares;
	}
	
	// [El rol] se debe poder cambiar en cualquier momento a lo largo del juego
	public void cambiarRol(IRol nuevoRol) { this.rol = nuevoRol; }
	
	// MÉTODOS SECUNDARIOS
	
	protected boolean mismoNivel(Personaje otro) { return (this.nivel == otro.nivel); }
	protected boolean poderAceptable() { return (this.determinarPoderAtaque(12) < 5); }
	protected boolean diferenciaNivelAceptable(Personaje otro) { return (Math.abs(this.nivel - otro.nivel) <= 2); }
	
	public void aumentarInteligencia(double cant) { this.inteligencia += cant; }
	public void aumentarFuerza(double cant) { this.fuerza += cant; }
	
	public double getInteligencia() { return this.inteligencia; }
	public double getFuerza() { return this.fuerza; }
	public int getNivel() { return this.nivel; }
	
	// Si el nivel del oponente es igual al del personaje dado, su poder de ataque
	// a las 12 horas debe ser menor a 5. En otros casos, un oponente se considera
	// de nivel similar si la diferencia entre su nivel y el del personaje dado es
	// de 2 o menos.
	protected boolean esSimilarA(Personaje otro) {
		boolean similar = (this.mismoNivel(otro) && otro.poderAceptable() 
				|| this.diferenciaNivelAceptable(otro));
		return similar;
	}
	
	protected boolean esDeDia(int hora) { return (hora >= 8 && hora < 20); }
	protected double calcularValorBase() { return (this.rol.determinarValorBase(this)); }
}
