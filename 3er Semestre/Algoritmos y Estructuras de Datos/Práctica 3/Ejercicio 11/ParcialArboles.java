package tp3;

import java.util.*;

public class ParcialArboles {
	//Ejercicio 9
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
	
	//Ejercicio 10
	public static List<Integer> resolver(GeneralTree<Integer> arbol) {
		List<Integer> caminoMaximo = null;
		if (!arbol.isEmpty()) {
			List<Integer> caminoActual = new LinkedList<Integer>();
			caminoMaximo = new LinkedList<Integer>();
			resolverlo(arbol, caminoActual, caminoMaximo, 0);
		}
		return caminoMaximo;
	}
	private static void resolverlo(GeneralTree<Integer> arbol, List<Integer> caminoActual, List<Integer> caminoMaximo, int nivel) {
		caminoActual.add(arbol.getData() * nivel);
		if (arbol.isLeaf()) {
			//Comparar ambos caminos
			int caminoActualValor = 0;
			int caminoMaximoValor = 0;
			for (int num : caminoActual)
				caminoActualValor += num;
			for (int num : caminoMaximo)
				caminoMaximoValor += num;
			if (caminoActualValor > caminoMaximoValor) {
				caminoMaximo.removeAll(caminoMaximo);
				caminoMaximo.addAll(caminoActual);
			}
		} else {
			for (GeneralTree<Integer> hijo : arbol.getChildren()) {
				resolverlo(hijo, caminoActual, caminoMaximo, nivel + 1);
				caminoActual.remove(caminoActual.size()-1);
			}
		}
	}
	
	//Ejercicio 11
	public static boolean resolver2(GeneralTree<Integer> arbol) {
		return (!arbol.isEmpty() && resolverlo2(arbol)) ? true : false;
	}
	private static boolean resolverlo2(GeneralTree<Integer> arbol) {
		boolean esCreciente = true;
		int cantidadNodosVieja = 0;
		int cantidadNodosActual = 0;
		GeneralTree<Integer> arbolAux = null;
		Queue<GeneralTree<Integer>> cola = new Queue<GeneralTree<Integer>>();
		cola.enqueue(arbol);
		cola.enqueue(null);
		while (!cola.isEmpty() && esCreciente) {
			arbolAux = cola.dequeue();
			if (arbolAux != null) {
				cantidadNodosActual++;
				for (GeneralTree<Integer> hijo : arbolAux.getChildren())
					cola.enqueue(hijo);
			} else {
				if (cantidadNodosActual == cantidadNodosVieja+1) {
					cantidadNodosVieja = cantidadNodosActual;
					cantidadNodosActual = 0;
				} else {
					esCreciente = false;
				}
				if (!cola.isEmpty())
					cola.enqueue(null);
			}
		}
		return esCreciente;
	}
}
