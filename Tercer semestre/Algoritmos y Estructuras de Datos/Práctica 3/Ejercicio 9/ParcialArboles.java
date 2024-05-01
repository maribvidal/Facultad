package tp3;

public class ParcialArboles {
	//Ejercicio 9
	//Recursiva
	public static boolean esDeSeleccion(GeneralTree<Integer> arbol) {
		return (!arbol.isEmpty() && comprobarSiEsDeSeleccion(arbol)) ? true : false;
	}
	private static boolean comprobarSiEsDeSeleccion(GeneralTree<Integer> arbol) {
		boolean devolverValor = true;
		int menorValor = Integer.MAX_VALUE;
		if (!arbol.isLeaf()) {
			for (GeneralTree<Integer> hijo : arbol.getChildren()) {
				menorValor = Math.min(menorValor, hijo.getData());
				devolverValor = devolverValor && comprobarSiEsDeSeleccion(hijo);
			}
			if (menorValor != arbol.getData())
				devolverValor = false;
		}
		return devolverValor;
	}

	//Forma iterativa (solución óptima)
	public static boolean esDeSeleccion(GeneralTree<Integer> arbol) {
		boolean esDeSeleccion = true;
		if (!arbol.isEmpty()) {
			Queue<GeneralTree<Integer>> cola = new Queue<GeneralTree<Integer>>();
			GeneralTree<Integer> arbolAux = null;
			
			cola.enqueue(arbol);
			while (!cola.isEmpty() && esDeSeleccion) {
				int valorMin = Integer.MAX_VALUE;
				arbolAux = cola.dequeue();
				for (GeneralTree<Integer> hijo : arbolAux.getChildren()) {
					cola.enqueue(hijo);
					valorMin = Math.min(valorMin, hijo.getData());
				}
				if (!arbolAux.isLeaf() && arbolAux.getData() != valorMin) {esDeSeleccion = false;}
			}
		}
		return esDeSeleccion;
	}
}
