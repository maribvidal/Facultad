package tp5.ejercicio2;

import java.util.*;

import tp5.ejercicio1.Edge;
import tp5.ejercicio1.Graph;
import tp5.ejercicio1.Vertex;

public class VisitaOslo {
	public List<String> paseoEnBici(Graph<String> lugares, String destino, int maxTiempo, List<String> lugaresRestringidos) {
		List<String> devolver = new LinkedList<String>();
		if (!lugares.isEmpty()) {
			Vertex<String> verIni = lugares.search("Ayuntamiento");
			Vertex<String> verFin = lugares.search(destino);
			if (verIni != null && verFin != null)
				paseoEnBici(new boolean[lugares.getSize()], lugares, new LinkedList<String>(), devolver, maxTiempo, verIni, verFin, lugaresRestringidos);
		}
		return devolver;
	}
	
	private boolean paseoEnBici(boolean[] marcas, Graph<String> grafo, List<String> camAct, List<String> camMin, int tiempo, Vertex<String> origen, Vertex<String> fin, List<String> lugaresRestringidos) {
		boolean encontrado = false;
		
		marcas[origen.getPosition()] = true;
		camAct.add(origen.getData());
		
		if (origen == fin) {
			camMin.removeAll(camMin);
			camMin.addAll(camAct);
			encontrado = true;
		} else if (origen != fin) {
			List<Edge<String>> adyacentes = grafo.getEdges(origen);
			Iterator<Edge<String>> iterador = adyacentes.iterator();
			while (iterador.hasNext() && tiempo >= 0) {
				Edge<String> arista = iterador.next();
				Vertex<String> vertice = arista.getTarget();
				if (!marcas[vertice.getPosition()] && tiempo - arista.getWeight() >= 0 && lugaresRestringidos.indexOf(vertice.getData()) == -1) {
					encontrado = paseoEnBici(marcas, grafo, camAct, camMin, tiempo - arista.getWeight(), vertice, fin, lugaresRestringidos);
				}
			}
		}
		
		camAct.remove(camAct.size() - 1);
		marcas[origen.getPosition()] = false;
		
		return encontrado;
	}
}
