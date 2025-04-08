package unlp.oo2.patrones.ej5;

import java.util.ArrayList;
import java.util.List;

public class SugeridorSimilaridad implements ISugeridor {
	public List<Pelicula> retornarSugerencias(List<Pelicula> peliculas) {
		return obtenerListaOrdenada(peliculas).stream().limit(3).toList();
	}

	private List<Pelicula> obtenerListaOrdenada(List<Pelicula> peliculas) {
		List<Pelicula> listaSimilares = new ArrayList<Pelicula>();
		List<Pelicula> listaAuxiliar = new ArrayList<Pelicula>();
		
		peliculas.stream().forEach(pelicula1 -> {
			boolean esSimilarAOtra = peliculas.stream().anyMatch(pelicula2 -> pelicula1.esSimilarA(pelicula2) && !pelicula1.equals(pelicula2));
			if (esSimilarAOtra)
				listaSimilares.add(pelicula1);
			else
				listaAuxiliar.add(pelicula1);
		});
		
		listaSimilares.addAll(listaAuxiliar.stream().sorted((peli1, peli2) -> peli2.compararPorAño(peli1)).toList());
		return listaSimilares;
	}
}