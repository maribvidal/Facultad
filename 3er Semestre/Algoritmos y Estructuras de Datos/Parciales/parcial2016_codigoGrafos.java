package tp5.ejercicio2;

import java.util.*;

import tp5.ejercicio1.Edge;
import tp5.ejercicio1.Graph;
import tp5.ejercicio1.Vertex;

import tp5.ejercicio1.adjList.*;

public class Parcial {
	public Vertex<NodoParcial> buscar(Graph<NodoParcial> grafo, String nombreVertice) {
		Vertex<NodoParcial> verticeDevuelto = null;
		boolean encontrado = false;
		List<Vertex<NodoParcial>> vertices = grafo.getVertices();
		Iterator<Vertex<NodoParcial>> iterador = vertices.iterator();
		while (iterador.hasNext() && !encontrado) {
			Vertex<NodoParcial> v = iterador.next();
			if (v.getData().getNombre() == nombreVertice) {
				verticeDevuelto = v;
				encontrado = true;
			}
		}
		return verticeDevuelto;
	}
	
	public List<String> devolverRecorrido(Graph<NodoParcial> grafo, String origen, String destino) {
		List<String> listaDevuelta = new LinkedList<String>();
		if (!grafo.isEmpty()) {
			Vertex<NodoParcial> verticeOrigen = buscar(grafo, origen);
			Vertex<NodoParcial> verticeDestino = buscar(grafo, destino);
			if (verticeOrigen != null && verticeDestino != null) {
				devolverRecorrido(grafo, new boolean[grafo.getSize()], verticeOrigen, verticeDestino, listaDevuelta, verticeOrigen.getData().siEsBlanco());
			}
		}
		return listaDevuelta;
	}
	
	private boolean devolverRecorrido(Graph<NodoParcial> grafo, boolean[] marcas, Vertex<NodoParcial> verticeActual, Vertex<NodoParcial> verticeDestino, List<String> recorrido, boolean actualBlanco) {
		boolean encontrado = false;
		marcas[verticeActual.getPosition()] = true;
		
		recorrido.add(verticeActual.getData().getNombre());
		
		if (verticeActual == verticeDestino) {
			return true;
		} else {
			List<Edge<NodoParcial>> adyacentes = grafo.getEdges(verticeActual);
			Iterator<Edge<NodoParcial>> iterador = adyacentes.iterator();
			
			while (iterador.hasNext() && !encontrado) {
				Edge<NodoParcial> arista = iterador.next();
				Vertex<NodoParcial> vertice = arista.getTarget();
				if (!marcas[vertice.getPosition()] && vertice.getData().siEsBlanco() != actualBlanco) {
					encontrado = devolverRecorrido(grafo, marcas, vertice, verticeDestino, recorrido, vertice.getData().siEsBlanco());
				}
			}
		}
		
		if (!encontrado) {
			recorrido.remove(recorrido.size() - 1);
		}
		
		marcas[verticeActual.getPosition()] = false;
		return encontrado;
	}
	
	public static void main(String[] args) {
		//Construir grafo del enunciado
		AdjListGraph<NodoParcial> grafoParcial = new AdjListGraph<NodoParcial>();
		
		Vertex<NodoParcial> verticeA;
		Vertex<NodoParcial> verticeB;
		Vertex<NodoParcial> verticeC;
		Vertex<NodoParcial> verticeD;
		Vertex<NodoParcial> verticeE;
		Vertex<NodoParcial> verticeF;
		Vertex<NodoParcial> verticeG;
		
		verticeA = grafoParcial.createVertex(new NodoParcial(true, "A"));
		verticeB = grafoParcial.createVertex(new NodoParcial(true, "B"));
		verticeC = grafoParcial.createVertex(new NodoParcial(true, "C"));
		verticeD = grafoParcial.createVertex(new NodoParcial(false, "D"));
		verticeE = grafoParcial.createVertex(new NodoParcial(false, "E"));
		verticeF = grafoParcial.createVertex(new NodoParcial(true, "F"));
		verticeG = grafoParcial.createVertex(new NodoParcial(false, "G"));
		
		grafoParcial.connect(verticeA, verticeG);
		grafoParcial.connect(verticeG, verticeA);
		
		grafoParcial.connect(verticeA, verticeB);
		grafoParcial.connect(verticeB, verticeA);
		
		grafoParcial.connect(verticeA, verticeF);
		grafoParcial.connect(verticeF, verticeA);
		
		grafoParcial.connect(verticeF, verticeG);
		grafoParcial.connect(verticeG, verticeF);
		
		grafoParcial.connect(verticeE, verticeG);
		grafoParcial.connect(verticeG, verticeE);
		
		grafoParcial.connect(verticeD, verticeG);
		grafoParcial.connect(verticeG, verticeD);
		
		grafoParcial.connect(verticeC, verticeG);
		grafoParcial.connect(verticeG, verticeC);
		
		grafoParcial.connect(verticeB, verticeG);
		grafoParcial.connect(verticeG, verticeB);
		
		grafoParcial.connect(verticeB, verticeC);
		grafoParcial.connect(verticeC, verticeB);
		
		grafoParcial.connect(verticeC, verticeD);
		grafoParcial.connect(verticeD, verticeC);
		
		grafoParcial.connect(verticeD, verticeE);
		grafoParcial.connect(verticeE, verticeD);
		
		grafoParcial.connect(verticeE, verticeF);
		grafoParcial.connect(verticeF, verticeE);
		
		Parcial parcial = new Parcial();
		List<String> camino = parcial.devolverRecorrido(grafoParcial, "A", "E");
		System.out.println("Camino devuelto: " + camino);
	}
}

//
//  - NodoParcial.java
package tp5.ejercicio2;

public class NodoParcial {
	public boolean esBlanco;
	public String nombre;
	
	public NodoParcial(boolean esBlanco, String nombre) {
		this.esBlanco = esBlanco;
		this.nombre = nombre;
	}
	
	public boolean siEsBlanco() {return this.esBlanco;}
	public String getNombre() {return this.nombre;}
}
