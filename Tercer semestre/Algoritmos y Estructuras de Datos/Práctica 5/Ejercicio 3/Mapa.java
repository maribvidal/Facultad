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
	
	//INCISO 3
	
	public List<String> caminoMasCorto(String ciudad1, String ciudad2) {
		List<String> devolver = new LinkedList<String>();
		
		if (!mapaCiudades.isEmpty()) {
			Vertex<String> verticeInicial = mapaCiudades.search(ciudad1);
			Vertex<String> verticeFinal = mapaCiudades.search(ciudad2);

			if (verticeInicial != null && verticeFinal != null)
				caminoMasCorto(new boolean[mapaCiudades.getSize()], verticeInicial, verticeFinal, new LinkedList<String>(), devolver, 0, 9999);
		}
		
		return devolver;
	}
	
	private int caminoMasCorto(boolean[] marca, Vertex<String> vA, Vertex<String> vF, List<String> camAct, List<String> camMin, int dist, int distMin) {
		marca[vA.getPosition()] = true;
		camAct.add(vA.getData());
		
		if (vA == vF && dist < distMin) {
			camMin.removeAll(camMin);
			camMin.addAll(camAct);
			distMin = dist;
			System.out.println(distMin);
		} else {
			List<Edge<String>> adyacentes = mapaCiudades.getEdges(vA);
			for (Edge<String> ady : adyacentes) {
				Vertex<String> verticeDestino = ady.getTarget();
				if (!marca[verticeDestino.getPosition()])
					distMin = caminoMasCorto(marca, verticeDestino, vF, camAct, camMin, dist + ady.getWeight(), distMin);
			}
		}
		
		camAct.remove(camAct.size() - 1);
		marca[vA.getPosition()] = false;
		return distMin;
	}
	
	// INCISO 4
	
	public List<String> caminoSinCargarCombustible(String ciudad1, String ciudad2, int tanqueAuto) {
		List<String> devolver = new LinkedList<String>();
		
		if (!mapaCiudades.isEmpty()) {
			Vertex<String> verticeInicial = mapaCiudades.search(ciudad1);
			Vertex<String> verticeFinal = mapaCiudades.search(ciudad2);

			if (verticeInicial != null && verticeFinal != null)
				caminoSinCargarCombustible(new boolean[mapaCiudades.getSize()], verticeInicial, verticeFinal, devolver, tanqueAuto);
		}
		
		return devolver;
	}
	
	private boolean caminoSinCargarCombustible(boolean[] marca, Vertex<String> vA, Vertex<String> vF, List<String> camAct, int combustible) {
		boolean sePudo = false;
		
		marca[vA.getPosition()] = true;
		camAct.add(vA.getData());
		
		if (vA == vF) {
			return true;
		} else {
			List<Edge<String>> adyacentes = mapaCiudades.getEdges(vA);
			for (Edge<String> ady : adyacentes) {
				Vertex<String> verticeDestino = ady.getTarget();
				if (!marca[verticeDestino.getPosition()] && combustible - ady.getWeight() > 0 && !sePudo)
					sePudo = caminoSinCargarCombustible(marca, verticeDestino, vF, camAct, combustible - ady.getWeight());
			}
		}
		
		if (sePudo == false) {
			camAct.remove(camAct.size() - 1);
		}
		
		marca[vA.getPosition()] = false;
		return sePudo;
	}
	
	//INCISO 5 - gracias mati
	
	public List<String> caminoConMenorCargaDeCombustible(String ciudad1, String ciudad2, int tanqueAuto) {
		List<String> devolver = new LinkedList<String>();
		
		if (!mapaCiudades.isEmpty()) {
			Vertex<String> verticeInicial = mapaCiudades.search(ciudad1);
			Vertex<String> verticeFinal = mapaCiudades.search(ciudad2);

			if (verticeInicial != null && verticeFinal != null)
				caminoConMenorCargaDeCombustible(new boolean[mapaCiudades.getSize()], verticeInicial, verticeFinal, new LinkedList<String>(), devolver, tanqueAuto, tanqueAuto, 0, 9999);
		}
		
		return devolver;
	}
	
	private int caminoConMenorCargaDeCombustible(boolean[] marca, Vertex<String> vA, Vertex<String> vF, List<String> camAct, List<String> camMin, int combustible, int combustibleMin, int recargas, int recargasMin) {
		marca[vA.getPosition()] = true;
		camAct.add(vA.getData());
		
		//Cuando se llega a destino, comprobar si se realizaron menos recargas que la vez pasada
		if (vA == vF && recargas < recargasMin) {
			camMin.removeAll(camMin);
			camMin.addAll(camAct);
			recargasMin = recargas;
		} else {
			List<Edge<String>> adyacentes = mapaCiudades.getEdges(vA);
			Iterator<Edge<String>> iterador = adyacentes.iterator();
			while (iterador.hasNext() && recargas < recargasMin) {
				Edge<String> arista = iterador.next();
				Vertex<String> vertice = arista.getTarget();
				int distancia = arista.getWeight();
				
				if (!marca[vertice.getPosition()]) {
					if (combustible >= distancia) {
						recargasMin = caminoConMenorCargaDeCombustible(marca, vertice, vF, camAct, camMin, combustible - distancia, combustibleMin, recargas, recargasMin);
					} else if (combustibleMin >= distancia) {
						recargasMin = caminoConMenorCargaDeCombustible(marca, vertice, vF, camAct, camMin, combustibleMin - distancia, combustibleMin, recargas + 1, recargasMin);
					}
				}
			}
		}
		
		marca[vA.getPosition()] = false;
		camAct.remove(camAct.size() - 1);
		return recargasMin;
	}
}
