package unlp.oo2.patrones.ej5;

import java.util.ArrayList;
import java.util.List;

public class Decodificador {
	private List<Pelicula> grilla;
	private ISugeridor sugeridor;
	
	public Decodificador(List<Pelicula> grilla, ISugeridor sugeridor) {
		this.grilla = (grilla != null ? grilla : new ArrayList<Pelicula>());
		this.sugeridor = sugeridor;
	}
	
	// Para cambiar el algoritmo
	public void setSugeridor(ISugeridor s) {
		this.sugeridor = s;
	}
	
	public void agregarPelicula(Pelicula p) {
		this.grilla.add(p);
	}
	
	public List<Pelicula> obtenerSugerencias() {
		return this.sugeridor.retornarSugerencias(grilla);
	}
}