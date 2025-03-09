package tp5.ejercicio6;

import java.util.*;

import tp5.ejercicio1.Vertex;

import tp5.ejercicio1.adjList.*;

public class Prueba {
	public static void main(String[] args) {
		AdjListGraph<String> grafo = new AdjListGraph<String>();
		Vertex<String> casaCaperucita;
		Vertex<String> claro1;
		Vertex<String> claro2;
		Vertex<String> claro3;
		Vertex<String> claro4;
		Vertex<String> claro5;
		Vertex<String> casaAbuelita;
		
		casaCaperucita = grafo.createVertex("Casa Caperucita");
		claro1 = grafo.createVertex("Claro 1");
		claro2 = grafo.createVertex("Claro 2");
		claro3 = grafo.createVertex("Claro 3");
		claro4 = grafo.createVertex("Claro 4");
		claro5 = grafo.createVertex("Claro 5");
		casaAbuelita = grafo.createVertex("Casa Abuelita");
		
		//Conectar vértices, y poner los pesos de las aristas
		grafo.connect(casaCaperucita, claro3, 4);
		grafo.connect(claro3, claro5, 15);
		grafo.connect(claro5, casaAbuelita, 4);
		
		grafo.connect(casaCaperucita, claro1, 3);
		grafo.connect(claro1, claro5, 3);
		grafo.connect(claro1, claro2, 4);
		grafo.connect(claro2, claro1, 4);
		
		grafo.connect(casaCaperucita, claro2, 4);
		grafo.connect(claro2, claro4, 10);
		grafo.connect(claro4, casaAbuelita, 9);
		
		//Probar código
		BuscadorDeCaminos buscador = new BuscadorDeCaminos(grafo);
		List<List<String>> recorridosSeguros = buscador.recorridosMasSeguros();
		
		for (List<String> recorrido : recorridosSeguros) {
			System.out.println("Camino: ");
			for (String nombre : recorrido)
				System.out.print(nombre + " - ");
			System.out.println();
		}
	}
}
