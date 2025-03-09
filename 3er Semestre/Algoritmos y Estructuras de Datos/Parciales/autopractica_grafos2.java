// Implemente un algoritmo que pueda calcular el tiempo demorado en enviarle una imagen
// a un servidor cualquiera por medio de otro. El tiempo de latencia devuelto debe ser 
// el mayor de todos los caminos posibles. Cada arista del grafo muestra el tiempo de
// latencia que tarda en cruzarse.
//
// RESTRICCIONES:
//  - Un vértice no puede aparecer mas de 1 vez en el mismo camino
//  - Los vértices pasados por parámetro pueden NO existir
//  - El grafo puede NO existir
//  - Si hay dos caminos que devuelven lo mismo, devolver el primer tiempo nada mas

public class Parcial {
	public int resolver(Graph<String> red, String nombreSV1, String nombreSV2) {
		int tiempoDevuelto = 0;
		
		if (!red.isEmpty()) {
			Vertex<String> sv1 = red.search(nombreSV1);
			Vertex<String> sv2 = red.search(nombreSV2);
			if (sv1 != null && sv2 != null) {
				tiempoDevuelto = resolver(red, sv1, sv2, new boolean[red.getSize()], 0, 0);
			}
		}
		
		return tiempoDevuelto;
	}
	
	private int resolver(Graph<String> red, Vertex<String> verticeActual, Vertex<String> verticeFinal, boolean[] marcas, int tiempoActual, int tiempoMax) {
		marcas[verticeActual.getPosition()] = true;
		
		if (verticeActual == verticeFinal && tiempoActual > tiempoMax) {
			tiempoMax = tiempoActual;
		} else if (verticeActual != verticeFinal) {
			List<Edge<String>> adyacentes = red.getEdges(verticeActual);
			for (Edge<String> ady : adyacentes) {
				Vertex<String> verticeProximo = ady.getTarget();
				if (!marcas[verticeProximo.getPosition()]) {
					tiempoMax = resolver(red, verticeProximo, verticeFinal, marcas, tiempoActual + ady.getWeight(), tiempoMax);
				}
			}
		}
		
		marcas[verticeActual.getPosition()] = false;
		
		return tiempoMax;
	}
	
	//Solo para hacer mas rápido el tema de las conexiones
	public void conexionSimetrica(Graph<String> grafo, Vertex<String> vertice1, Vertex<String> vertice2, int peso) {
		grafo.connect(vertice1, vertice2, peso);
		grafo.connect(vertice2, vertice1, peso);
	}
	
	public static void main(String[] args) {
		AdjListGraph<String> grafoParcial = new AdjListGraph<String>();
		
		Vertex<String> servidorA;
		Vertex<String> servidorB;
		Vertex<String> servidorC;
		Vertex<String> servidorD;
		Vertex<String> servidorE;
		Vertex<String> servidorF;
		Vertex<String> servidorG;
		Vertex<String> servidorH;
		Vertex<String> servidorI;
		Vertex<String> servidorJ;
		Vertex<String> servidorK;
		Vertex<String> servidorL;
		
		servidorA = grafoParcial.createVertex("Servidor A");
		servidorB = grafoParcial.createVertex("Servidor B");
		servidorC = grafoParcial.createVertex("Servidor C");
		servidorD = grafoParcial.createVertex("Servidor D");
		servidorE = grafoParcial.createVertex("Servidor E");
		servidorF = grafoParcial.createVertex("Servidor F");
		servidorG = grafoParcial.createVertex("Servidor G");
		servidorH = grafoParcial.createVertex("Servidor H");
		servidorI = grafoParcial.createVertex("Servidor I");
		servidorJ = grafoParcial.createVertex("Servidor J");
		servidorK = grafoParcial.createVertex("Servidor K");
		servidorL = grafoParcial.createVertex("Servidor L");
		
		Parcial parcial = new Parcial();
		
		parcial.conexionSimetrica(grafoParcial, servidorA, servidorB, 1);
		parcial.conexionSimetrica(grafoParcial, servidorA, servidorC, 1);
		parcial.conexionSimetrica(grafoParcial, servidorA, servidorD, 1);
		
		parcial.conexionSimetrica(grafoParcial, servidorB, servidorE, 2);
		parcial.conexionSimetrica(grafoParcial, servidorB, servidorF, 2);
		parcial.conexionSimetrica(grafoParcial, servidorC, servidorF, 2);
		parcial.conexionSimetrica(grafoParcial, servidorC, servidorG, 2);
		parcial.conexionSimetrica(grafoParcial, servidorD, servidorG, 2);
		parcial.conexionSimetrica(grafoParcial, servidorD, servidorH, 2);
		
		parcial.conexionSimetrica(grafoParcial, servidorE, servidorI, 3);
		parcial.conexionSimetrica(grafoParcial, servidorF, servidorI, 3);
		parcial.conexionSimetrica(grafoParcial, servidorF, servidorJ, 3);
		parcial.conexionSimetrica(grafoParcial, servidorG, servidorJ, 3);
		parcial.conexionSimetrica(grafoParcial, servidorG, servidorK, 3);
		parcial.conexionSimetrica(grafoParcial, servidorH, servidorK, 3);
		
		parcial.conexionSimetrica(grafoParcial, servidorI, servidorL, 4);
		parcial.conexionSimetrica(grafoParcial, servidorJ, servidorL, 4);
		parcial.conexionSimetrica(grafoParcial, servidorK, servidorL, 4);
		
		System.out.println("Tiempo de latencia máximo: " + parcial.resolver(grafoParcial, "Servidor C", "Servidor H"));
	}
}
