package unlp.oo2.patrones.ej5;

import java.util.List;

public class SugeridorNovedad implements ISugeridor {
	public List<Pelicula> retornarSugerencias(List<Pelicula> peliculas) {
		return peliculas.stream().sorted((peli1, peli2) -> peli1.compararPorAño(peli2)).limit(3).toList();
	}
}