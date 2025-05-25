package unlp.oo2.patrones.ej20;

public class PersonajeGuerreroBuilder extends PersonajeBuilder {
	//
	// INTERFAZ PÚBLICA
	
	public void colocarArmadura() {
		this.obtenerPersonaje().setArmadura(new ArmaduraDeAcero());
	}
	public void colocarArma() {
		this.obtenerPersonaje().setArma(new Espada());
	}
	public void colocarHabilidades() {
		this.obtenerPersonaje().agregarHabilidad(new Habilidad("Combate cuerpo a cuerpo"));
	} 
}