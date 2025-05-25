package unlp.oo2.patrones.ej20;

public abstract class PersonajeBuilder {
	private Personaje producto;
	//
	public PersonajeBuilder() {
		this.producto = new Personaje();
	}
	
	// INTERFAZ PÚBLICA
	
	public abstract void colocarArmadura();
	public abstract void colocarArma();
	public abstract void colocarHabilidades(); 
	public Personaje obtenerPersonaje() { return this.producto; }
}