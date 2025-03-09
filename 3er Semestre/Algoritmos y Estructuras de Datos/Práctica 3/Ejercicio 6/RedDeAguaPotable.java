package tp3;

import java.util.*;

public class RedDeAguaPotable {
	public GeneralTree<RedAguaPotable> GT;
	
	public RedDeAguaPotable(GeneralTree<RedAguaPotable> gt) {
		GT = gt;
	}
	
	public double minimoCaudal(double caudal) {
		return (!GT.isEmpty()) ? correrCaudal(GT, caudal) : -1;
	}
	private double correrCaudal(GeneralTree<RedAguaPotable> nodo, double caudal) {
		double cantidadAgua = caudal;
		double cantidadAguaMenor = 9999;
		
		//Recorrido pre-orden
		nodo.getData().setCaudal(caudal);
		
		if (!nodo.isLeaf()) {
			List<GeneralTree<RedAguaPotable>> hijosNodo = nodo.getChildren();
			for (GeneralTree<RedAguaPotable> hijo : hijosNodo) {
				cantidadAgua = correrCaudal(hijo, caudal / hijosNodo.size());
				if (cantidadAgua < cantidadAguaMenor)
					cantidadAguaMenor = cantidadAgua;
			}
		} else {
			cantidadAguaMenor = cantidadAgua;
		}
		
		return cantidadAguaMenor;
	}
	
	public void imprimir() {
		int nivel = 0;
		GeneralTree<RedAguaPotable> arbolAux = null;
		Queue<GeneralTree<RedAguaPotable>> cola = new Queue<GeneralTree<RedAguaPotable>>();
		cola.enqueue(GT);
		cola.enqueue(null);
		while (!cola.isEmpty()) {
			arbolAux = cola.dequeue();
			if (arbolAux != null) {
				System.out.println(arbolAux.getData());
				for (GeneralTree<RedAguaPotable> hijo : arbolAux.getChildren())
					cola.enqueue(hijo);
			} else if (!cola.isEmpty()) {
				nivel++;
				System.out.println(" -- Nivel " + nivel + " -- ");
				cola.enqueue(null);
			}
		}
	}
}
