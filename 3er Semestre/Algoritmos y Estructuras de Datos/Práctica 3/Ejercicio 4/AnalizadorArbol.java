package tp3;

public class AnalizadorArbol {
	public static double devolverMaximoPromedio(GeneralTree<AreaEmpresa> arbol) {
		double promedioMaximo = -1;
		double promedioActual = 0;
		int cantidadNodos = 0;
		GeneralTree<AreaEmpresa> arbolAux = null;
		Queue<GeneralTree<AreaEmpresa>> cola = new Queue<GeneralTree<AreaEmpresa>>();
		cola.enqueue(arbol);
		cola.enqueue(null);
		while (!cola.isEmpty()) {
			arbolAux = cola.dequeue();
			if (arbolAux != null) {
				cantidadNodos++;
				promedioActual += arbolAux.getData().getTardanza();
				for (GeneralTree<AreaEmpresa> hijo : arbolAux.getChildren()) {
					cola.enqueue(hijo);
				}
			} else {
				promedioActual = promedioActual / cantidadNodos;
				if (promedioActual > promedioMaximo)
					promedioMaximo = promedioActual;
				if (!cola.isEmpty()) {
					promedioActual = 0;
					cantidadNodos = 0;
					cola.enqueue(null);
				}
			}
		}
		return promedioMaximo;
	}
}
