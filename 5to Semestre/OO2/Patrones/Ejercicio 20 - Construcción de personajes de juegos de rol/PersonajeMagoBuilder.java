package unlp.oo2.patrones.ej20;

public class PersonajeMagoBuilder extends PersonajeBuilder {
	//
	// INTERFAZ PÚBLICA
	
	public void colocarArmadura() {
		this.obtenerPersonaje().setArmadura(new ArmaduraDeCuero());
	}
	public void colocarArma() {
		this.obtenerPersonaje().setArma(new Baston());
	}
	public void colocarHabilidades() {
		this.obtenerPersonaje().agregarHabilidad(new Habilidad("Magia"));
		this.obtenerPersonaje().agregarHabilidad(new Habilidad("Combate a distancia"));
	} 
}