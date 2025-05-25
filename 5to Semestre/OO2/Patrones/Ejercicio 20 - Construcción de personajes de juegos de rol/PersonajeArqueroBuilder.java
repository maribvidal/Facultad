package unlp.oo2.patrones.ej20;

public class PersonajeArqueroBuilder extends PersonajeBuilder {
	//
	// INTERFAZ PÚBLICA
	
	public void colocarArmadura() {
		this.obtenerPersonaje().setArmadura(new ArmaduraDeCuero());
	}
	public void colocarArma() {
		this.obtenerPersonaje().setArma(new Arco());
	}
	public void colocarHabilidades() {
		this.obtenerPersonaje().agregarHabilidad(new Habilidad("Disparos de flecha"));
	} 
}