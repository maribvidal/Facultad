package tp3;

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
}
