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
	
	public String resolver(Graph<NodoParcial> sitios, int tiempo) {
		String resultado = "No Alcanzable";
		if (!sitios.isEmpty()) {
			Vertex<NodoParcial> inicio = buscarSitio(sitios, "Entrada");
			if (inicio != null) {
				resultado = resolver(sitios, tiempo, new boolean[sitios.getSize()], inicio, 1);
			}
 		}
		return resultado;
	}
	
	private String resolver(Graph<NodoParcial> sitios, int tiempo, boolean[] marca, Vertex<NodoParcial> vertice, int verticesVisitados) {
		tiempo -= vertice.getData().getTiempo();
		marca[vertice.getPosition()] = true;
		String devolver = "No Alcanzable";
		
		if (tiempo >= 0 && verticesVisitados == sitios.getSize()) {
			//System.out.println(" - Tiempo: " + tiempo);
			return "Alcanzable";
		} else if (tiempo >= 0) {
			Iterator<Edge<NodoParcial>> it = sitios.getEdges(vertice).iterator();
			while (it.hasNext() && !devolver.equals("Alcanzable")) {
				Edge<NodoParcial> arista = it.next();
				Vertex<NodoParcial> verticeProximo = arista.getTarget();
				if (!marca[verticeProximo.getPosition()] && tiempo - arista.getWeight() >= 0) {
					devolver = resolver(sitios, tiempo - arista.getWeight(), marca, verticeProximo, verticesVisitados + 1);
				}
			}
		}

		marca[vertice.getPosition()] = false;
		return devolver;
	}
	
	public static void main(String[] args) {
		AdjListGraph<NodoParcial> grafoParcial = new AdjListGraph<NodoParcial>();
		
		Vertex<NodoParcial> entrada;
		Vertex<NodoParcial> flamencos;
		Vertex<NodoParcial> murcielagos;
		Vertex<NodoParcial> wallabies;
		Vertex<NodoParcial> pumas;
		Vertex<NodoParcial> tortugas;
		Vertex<NodoParcial> cebras;
		Vertex<NodoParcial> tigres;
		
		entrada = grafoParcial.createVertex(new NodoParcial("Entrada", 15));
		flamencos = grafoParcial.createVertex(new NodoParcial("Flamencos", 10));
		murcielagos = grafoParcial.createVertex(new NodoParcial("Murcielagos", 20));
		wallabies = grafoParcial.createVertex(new NodoParcial("Wallabies", 30));
		pumas = grafoParcial.createVertex(new NodoParcial("Pumas", 10));
		tortugas = grafoParcial.createVertex(new NodoParcial("Tortugas", 10));
		cebras = grafoParcial.createVertex(new NodoParcial("Cebras", 10));
		tigres = grafoParcial.createVertex(new NodoParcial("Tigres", 10));
		
		grafoParcial.connect(entrada, flamencos, 25);
		grafoParcial.connect(flamencos, entrada, 25);
		
		grafoParcial.connect(murcielagos, entrada, 20);
		grafoParcial.connect(entrada, murcielagos, 20);
		
		grafoParcial.connect(murcielagos, flamencos, 25);
		grafoParcial.connect(flamencos, murcielagos, 25);

		grafoParcial.connect(murcielagos, wallabies, 10);
		grafoParcial.connect(wallabies, murcielagos, 10);
		
		grafoParcial.connect(pumas, wallabies, 2);
		grafoParcial.connect(wallabies, pumas, 2);
		
		grafoParcial.connect(tortugas, wallabies, 10);
		grafoParcial.connect(wallabies, tortugas, 10);
		
		grafoParcial.connect(tortugas, pumas, 15);
		grafoParcial.connect(pumas, tortugas, 15);
		
		grafoParcial.connect(tortugas, cebras, 5);
		grafoParcial.connect(cebras, tortugas, 5);
		
		grafoParcial.connect(tigres, cebras, 8);
		grafoParcial.connect(cebras, tigres, 8);

		grafoParcial.connect(entrada, cebras, 10);
		grafoParcial.connect(cebras, entrada, 10);
		
		grafoParcial.connect(tigres, entrada, 15);
		grafoParcial.connect(entrada, tigres, 15);
		
		Parcial parcial = new Parcial();
		System.out.println(parcial.resolver(grafoParcial, 220));
	}
}

// - Nodo Parcial

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
