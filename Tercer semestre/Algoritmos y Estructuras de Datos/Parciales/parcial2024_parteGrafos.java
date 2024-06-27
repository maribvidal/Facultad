package tp5.ejercicio2;

import java.util.*;

import tp5.ejercicio1.Edge;
import tp5.ejercicio1.Graph;
import tp5.ejercicio1.Vertex;

import tp5.ejercicio1.adjList.*;

public class Parcial {
	public Vertex<NodoParcial> buscarSitio(Graph<NodoParcial> grafo, String nombre) {
		Vertex<NodoParcial> verticeDevuelto = null;
		boolean encontrado = false;
		Iterator<Vertex<NodoParcial>> it = grafo.getVertices().iterator();
		while (it.hasNext() && !encontrado) {
			Vertex<NodoParcial> vert = it.next();
			if (vert.getData().getNombre().equals(nombre)) {
				verticeDevuelto = vert;
				encontrado = true;
			}
		}
		return verticeDevuelto;
	}
	
	public int resolver(Graph<NodoParcial> sitios, int tiempo) {
		int cantidadDevuelta = 0;
		if (!sitios.isEmpty()) {
			Vertex<NodoParcial> inicio = buscarSitio(sitios, "Entrada");
			if (inicio != null) {
				cantidadDevuelta = resolver(sitios, new boolean[sitios.getSize()], inicio, tiempo, 0, 0);
			}
 		}
		return cantidadDevuelta;
	}
	
	private int resolver(Graph<NodoParcial> sitios, boolean[] marca, Vertex<NodoParcial> vertice, int tiempo, int reco, int recoMax) {
		tiempo -= vertice.getData().getTiempo();
		marca[vertice.getPosition()] = true;
		System.out.println("- Vértice actual: " + vertice.getData().getNombre());
		
		if (tiempo >= 0) {
			reco++;
			if (reco > recoMax) {
				recoMax = reco;
				//System.out.println(" Se guardan los recorridos -- " + reco + " / " + recoMax);
			}
			List<Edge<NodoParcial>> adyacentes = sitios.getEdges(vertice);
			for (Edge<NodoParcial> ady : adyacentes) {
				if (tiempo - ady.getWeight() >= 0) {
					Vertex<NodoParcial> vN = ady.getTarget();
					if (!marca[vN.getPosition()]) {
						//System.out.println("Vertice próximo: " + vN.getData().getNombre());
						recoMax = resolver(sitios, marca, vN, tiempo - ady.getWeight(), reco, recoMax);	
					}
				}
			}
		}
		
		marca[vertice.getPosition()] = false;
		return recoMax;
	}
	
	public static void main(String[] args) {
		AdjListGraph<NodoParcial> grafoParcial = new AdjListGraph<NodoParcial>();
		
		Vertex<NodoParcial> vertice1;
		Vertex<NodoParcial> vertice2;
		Vertex<NodoParcial> vertice3;
		Vertex<NodoParcial> vertice4;
		Vertex<NodoParcial> vertice5;
		Vertex<NodoParcial> vertice6;
		
		vertice1 = grafoParcial.createVertex(new NodoParcial("Entrada", 15));
		vertice2 = grafoParcial.createVertex(new NodoParcial("C2", 16));
		vertice3 = grafoParcial.createVertex(new NodoParcial("C3", 3));
		vertice4 = grafoParcial.createVertex(new NodoParcial("C4", 20));
		vertice5 = grafoParcial.createVertex(new NodoParcial("C5", 10));
		vertice6 = grafoParcial.createVertex(new NodoParcial("C6", 26));
		
		grafoParcial.connect(vertice1, vertice2, 10);
		
		grafoParcial.connect(vertice1, vertice3, 15);
		
		grafoParcial.connect(vertice1, vertice4, 20);
		
		grafoParcial.connect(vertice2, vertice5, 10);
		
		grafoParcial.connect(vertice3, vertice5, 5);
		
		grafoParcial.connect(vertice4, vertice6, 10);
		
		grafoParcial.connect(vertice5, vertice6, 15);
		
		Parcial parcial = new Parcial();
		int camino = parcial.resolver(grafoParcial, 70);
		System.out.println("Maximo de recorridos posibles: " + camino);
	}
}

//NodoParcial
package tp5.ejercicio2;

public class NodoParcial {
	public String nombre;
	public int tiempo;
	
	public NodoParcial(String nombre, int tiempo) {
		this.nombre = nombre;
		this.tiempo = tiempo;
	}
	
	public String getNombre() {return this.nombre;}
	public int getTiempo() {return this.tiempo;}
}
