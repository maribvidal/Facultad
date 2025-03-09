// Imagine que existe una red de computadoras conectadas de tal manera que,
// en el caso que ocurra una infección de virus, este se pueda transmitir a
// otras computadoras adyacentes a la infectada. Imagine ahora que un virus
// entra en la red por medio de la "PC A", devuelva la cantidad de fases en
// las que se termina de infectar por completo la red entera, e imprima por
// consola el tiempo total que se tarda.

public class Parcial {
	public int resolver(Graph<String> red, Vertex<String> pcA) {
		int cantidadDevuelta = 0;
		
		if (!red.isEmpty() && pcA != null) {
			int tiempo = 0;
			Queue<Vertex<String>> cola = new Queue<Vertex<String>>();
			Vertex<String> vertAct = null;
			cola.enqueue(pcA);
			cola.enqueue(null);
			boolean[] marcas = new boolean[red.getSize()];
			marcas[pcA.getPosition()] = true;
			
			while (!cola.isEmpty()) {
				vertAct = cola.dequeue();
				
				if (vertAct != null) {
					List<Edge<String>> adyacentes = red.getEdges(vertAct);
					
					for (Edge<String> ady : adyacentes) {
						Vertex<String> vertProx = ady.getTarget();
						
						if (!marcas[vertProx.getPosition()]) {
							System.out.println(vertProx.getData() + " / Peso arista: " + ady.getWeight());
							marcas[vertProx.getPosition()] = true;
							cola.enqueue(vertProx);
							tiempo += ady.getWeight();
						}
					}
				} else if (!cola.isEmpty()) {
					cantidadDevuelta++;
					cola.enqueue(null);
				}
			}
			
			System.out.println("Tiempo en total que tardó en transmitirse la infección: " + tiempo);
		}
		
		return cantidadDevuelta;
	}
	
	public static void main(String[] args) {
		AdjListGraph<String> grafoParcial = new AdjListGraph<String>();
		
		Vertex<String> pcA;
		Vertex<String> pcB;
		Vertex<String> pcC;
		Vertex<String> pcD;
		Vertex<String> pcE;
		Vertex<String> pcF;
		Vertex<String> pcG;
		Vertex<String> pcH;
		Vertex<String> pcI;
		Vertex<String> pcJ;
		
		pcA = grafoParcial.createVertex("PC A");
		pcB = grafoParcial.createVertex("PC B");
		pcC = grafoParcial.createVertex("PC C");
		pcD = grafoParcial.createVertex("PC D");
		pcE = grafoParcial.createVertex("PC E");
		pcF = grafoParcial.createVertex("PC F");
		pcG = grafoParcial.createVertex("PC G");
		pcH = grafoParcial.createVertex("PC H");
		pcI = grafoParcial.createVertex("PC I");
		pcJ = grafoParcial.createVertex("PC J");

		grafoParcial.connect(pcA, pcB, 2);
		grafoParcial.connect(pcB, pcA, 2);
		
		grafoParcial.connect(pcB, pcE, 9);
		grafoParcial.connect(pcE, pcB, 9);
		
		grafoParcial.connect(pcE, pcH, 3);
		grafoParcial.connect(pcH, pcE, 3);
		
		grafoParcial.connect(pcH, pcI, 3);
		grafoParcial.connect(pcI, pcH, 3);
		
		grafoParcial.connect(pcI, pcD, 7);
		grafoParcial.connect(pcD, pcI, 7);
		
		grafoParcial.connect(pcA, pcD, 6);
		grafoParcial.connect(pcD, pcA, 6);
		
		grafoParcial.connect(pcA, pcC, 4);
		grafoParcial.connect(pcC, pcA, 4);
		
		grafoParcial.connect(pcC, pcF, 7);
		grafoParcial.connect(pcF, pcC, 7);
		
		grafoParcial.connect(pcC, pcG, 5);
		grafoParcial.connect(pcG, pcC, 5);
		
		grafoParcial.connect(pcG, pcJ, 4);
		grafoParcial.connect(pcJ, pcG, 4);
		
		grafoParcial.connect(pcJ, pcD, 2);
		grafoParcial.connect(pcD, pcJ, 2);
		
		Parcial parcial = new Parcial();
		System.out.println("Fases que se tarda en infectar la red entera: " + parcial.resolver(grafoParcial, pcA));
	}
}
