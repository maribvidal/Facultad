package unlp.oo2.patrones.ej5;

import java.util.List;

public interface ISugeridor {
	public abstract List<Pelicula> retornarSugerencias(List<Pelicula> peliculas);
}