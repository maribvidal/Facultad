package unlp.oo2.patrones.ej20;

public class PersonajeThorBuilder extends PersonajeBuilder {
	//
	// INTERFAZ PÚBLICA
	
	public void colocarArmadura() {
		this.obtenerPersonaje().setArmadura(new ArmaduraDeHierro());
	}
	public void colocarArma() {
		this.obtenerPersonaje().setArma(new Martillo());
	}
	public void colocarHabilidades() {
		this.obtenerPersonaje().agregarHabilidad(new Habilidad("Lanzar rayos"));
		this.obtenerPersonaje().agregarHabilidad(new Habilidad("Combate a distancia"));
	} 
}