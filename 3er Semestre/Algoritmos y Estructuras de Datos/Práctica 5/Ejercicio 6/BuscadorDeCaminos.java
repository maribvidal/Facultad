package tp5.ejercicio6;

import java.util.*;

import tp5.ejercicio1.Edge;
import tp5.ejercicio1.Graph;
import tp5.ejercicio1.Vertex;

public class BuscadorDeCaminos {
	Graph<String> bosque;
	
	public BuscadorDeCaminos(Graph<String> bosque) {
		this.bosque = bosque;
	}
	
	public List<List<String>> recorridosMasSeguros() {
		List<List<String>> listaCaminos = new LinkedList<List<String>>();
		
		if (!this.bosque.isEmpty()) {
			Vertex<String> casaCaperucita = this.bosque.search("Casa Caperucita");
			if (casaCaperucita != null) {
				recorrerBosque(casaCaperucita.getPosition(), new boolean[this.bosque.getSize()], listaCaminos, new LinkedList<String>());
			}
		}
		
		return listaCaminos;
	}
	
	private void recorrerBosque(int pos, boolean[] marca, List<List<String>> lisCaminos, List<String> camActual) {
		Vertex<String> verticeActual = this.bosque.getVertex(pos);
		camActual.add(verticeActual.getData());
		marca[verticeActual.getPosition()] = true;
		if (verticeActual.getData() == "Casa Abuelita") {
			lisCaminos.add(new LinkedList<String>(camActual));
		}
		else {
			List<Edge<String>> adyacentes = this.bosque.getEdges(verticeActual);
			for (Edge<String> arista : adyacentes) {
				int aristaPos = arista.getTarget().getPosition();
				if (arista.getWeight() < 5 && !marca[aristaPos]) {
					recorrerBosque(aristaPos, marca, lisCaminos, camActual);
				}
			}
		}
		marca[verticeActual.getPosition()] = false;
		camActual.remove(camActual.size() - 1);
	}
}
