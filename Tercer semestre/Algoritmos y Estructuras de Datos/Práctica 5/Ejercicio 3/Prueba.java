package tp5.ejercicio2;

import java.util.*;

import tp5.ejercicio1.Vertex;

import tp5.ejercicio1.adjList.*;

public class Prueba {
	public static void main(String[] args) {
		AdjListGraph<String> miMapaCiudad = new AdjListGraph<String>();
		Vertex<String> CiudadA;
		Vertex<String> CiudadB;
		Vertex<String> CiudadC;
		Vertex<String> CiudadD;
		Vertex<String> CiudadE;
		Vertex<String> CiudadF;
		Vertex<String> CiudadG;
		
		//Crear vértices
		CiudadA = miMapaCiudad.createVertex("Ciudad A");
		CiudadB = miMapaCiudad.createVertex("Ciudad B");
		CiudadD = miMapaCiudad.createVertex("Ciudad D");
		CiudadC = miMapaCiudad.createVertex("Ciudad C");
		CiudadF = miMapaCiudad.createVertex("Ciudad F");
		CiudadE = miMapaCiudad.createVertex("Ciudad E");
		CiudadG = miMapaCiudad.createVertex("Ciudad G");
		
		//Conectarlos
		miMapaCiudad.connect(CiudadA, CiudadB, 7);
		miMapaCiudad.connect(CiudadA, CiudadD, 5);
		miMapaCiudad.connect(CiudadA, CiudadC, 7);
		
		miMapaCiudad.connect(CiudadB, CiudadF, 5);
		
		miMapaCiudad.connect(CiudadD, CiudadE, 5);
		miMapaCiudad.connect(CiudadC, CiudadE, 5);
		
		miMapaCiudad.connect(CiudadF, CiudadG, 7);
		miMapaCiudad.connect(CiudadE, CiudadG, 5);
		
		//Probar código
		Mapa mapa = new Mapa(miMapaCiudad);
		List<String> caminoBaG = mapa.devolverCamino("Ciudad B", "Ciudad G");
		
		for (String nombreCiudad : caminoBaG) {
			System.out.print(nombreCiudad + " ");
		}
		System.out.println();
		
		List<String> ciudadesNoPermitidas = new LinkedList<String>();
		ciudadesNoPermitidas.add("Ciudad B");
		List<String> caminoAaG = mapa.devolverCaminoExceptuando("Ciudad A", "Ciudad G", ciudadesNoPermitidas);
		
		for (String nombreCiudad : caminoAaG) {
			System.out.print(nombreCiudad + " ");
		}
		System.out.println();
		
		List<String> caminoDaC = mapa.devolverCamino("Ciudad D", "Ciudad C");
		
		for (String nombreCiudad : caminoDaC) {
			System.out.print(nombreCiudad + " ");
		}
		System.out.println();
	}
}
