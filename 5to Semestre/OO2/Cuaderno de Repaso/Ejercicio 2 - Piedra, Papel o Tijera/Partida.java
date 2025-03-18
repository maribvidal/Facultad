package unlp.oo2.ejercicio2;

public class Partida {
	private Opcion opcionJugador1;
	private Opcion opcionJugador2;
	
	public Partida(Opcion opcionJugador1, Opcion opcionJugador2) {
		this.opcionJugador1 = opcionJugador1;
		this.opcionJugador2 = opcionJugador2;
	}
	
	public String jugar() {
		String resultado = this.opcionJugador1.jugar(opcionJugador2);
		return resultado;
	}
}