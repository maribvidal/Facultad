package tp5.ejercicio2;

import java.util.*;

import tp5.ejercicio1.Edge;
import tp5.ejercicio1.Graph;
import tp5.ejercicio1.Vertex;

public class Mapa {
	public Graph<String> mapaCiudades;
	
	public Mapa(Graph<String> mapaCiudades) {
		this.mapaCiudades = mapaCiudades;
	}
	
	//	INCISO 1
	
	public List<String> devolverCamino(String ciudad1, String ciudad2) {
		List<String> caminoDevuelto = new LinkedList<String>();
		
		//Primero, comprobar si el grafo está vacío o no
		if (!mapaCiudades.isEmpty()) {
			//Luego, vamos a comprobar si existen las ciudades dentro del grafo
			
			Vertex<String> vertice_ciudad1 = mapaCiudades.search(ciudad1);
			Vertex<String> vertice_ciudad2 = mapaCiudades.search(ciudad2);
		
			if (vertice_ciudad1 != null && vertice_ciudad2 != null) {
				//La mejor opción es el DFS
				devolverCamino(vertice_ciudad1.getPosition(), vertice_ciudad2.getPosition(), caminoDevuelto);
			}
		}
		
		return caminoDevuelto;
	}
	
	private boolean devolverCamino(int pos1, int pos2, List<String> camino) {
		//Dos situaciones:
		//	- Situación en la que encontramos al destino > Devolver el camino
		//	- Situación en la que no la encontramos		 > No devolver nada
		
		boolean destinoEncontrado = false;
		Vertex<String> verticeActual = this.mapaCiudades.getVertex(pos1);
		
		//Esto nunca se va a cumplir para la primera recursión (a menos que le hayamos pasado la misma ciudad)
		if (verticeActual.getPosition() == pos2) {
			destinoEncontrado = true;
		} else {
			List<Edge<String>> adyacentes = mapaCiudades.getEdges(verticeActual);
			int i = 0;
			while (i < adyacentes.size() && !destinoEncontrado) {
				destinoEncontrado = devolverCamino(adyacentes.get(i).getTarget().getPosition(), pos2, camino);
				i++;
			}
 		}
		
		//Si el destino fue encontrado, entonces agregar la ciudad
		if (destinoEncontrado) {
			camino.add(0, verticeActual.getData()); //Agregada al comienzo así la primera ciudad aparece al comienzo
		}
		
		return destinoEncontrado;
	}
	
	//INCISO 2
	
	public List<String> devolverCaminoExceptuando(String ciudad1, String ciudad2, List<String> ciudades) {
		List<String> caminoDevuelto = new LinkedList<String>();
		
		if (!mapaCiudades.isEmpty()) {
			Vertex<String> vertice_ciudad1 = mapaCiudades.search(ciudad1);
			Vertex<String> vertice_ciudad2 = mapaCiudades.search(ciudad2);
		
			if (vertice_ciudad1 != null && vertice_ciudad2 != null) {
				devolverCaminoExceptuando(vertice_ciudad1.getPosition(), vertice_ciudad2.getPosition(), ciudades, caminoDevuelto);
			}
		}
		
		return caminoDevuelto;
	}
	
	private boolean devolverCaminoExceptuando(int pos1, int pos2, List<String> ciudades, List<String> camino) {
		
		boolean destinoEncontrado = false;
		Vertex<String> verticeActual = this.mapaCiudades.getVertex(pos1);
		
		if (verticeActual.getPosition() == pos2) {
			destinoEncontrado = true;
		} else {
			List<Edge<String>> adyacentes = mapaCiudades.getEdges(verticeActual);
			int i = 0;
			while (i < adyacentes.size() && !destinoEncontrado) {
				Edge<String> adyacenteActual = adyacentes.get(i);
				
				//Si el nombre de la ciudad del vértice al cual apunta la arista no figura en la lista pasada por parámetro, entonces ir
				if (ciudades.indexOf(adyacenteActual.getTarget().getData()) == -1) {
					destinoEncontrado = devolverCamino(adyacentes.get(i).getTarget().getPosition(), pos2, camino);
				}
				
				i++;
			}
 		}
		
		if (destinoEncontrado) {
			camino.add(0, verticeActual.getData());
		}
		
		return destinoEncontrado;
	}
}
