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
}
