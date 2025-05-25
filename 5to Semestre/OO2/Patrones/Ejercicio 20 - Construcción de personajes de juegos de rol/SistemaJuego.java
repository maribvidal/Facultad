package unlp.oo2.patrones.ej20;

public class SistemaJuego {
	//
	// INTERFAZ PÚBLICA
	
	public Personaje crearPersonaje(PersonajeBuilder constructor) {
		constructor.colocarArmadura();
		constructor.colocarArma();
		constructor.colocarHabilidades();
		return constructor.obtenerPersonaje();
	}
}