package tp3;

import java.util.*;

public class Caminos {
	GeneralTree<Integer> GT;
	
	public Caminos(GeneralTree<Integer> gt) {
		GT = gt;
	}
	
	//implemente un método que retorne el camino a la hoja más lejana. 
	//En el caso de haber más de un camino máximo retorne el primero que encuentre
	public List<Integer> caminoAHojaMasLejana() {
		List<Integer> caminoMaximo = null;
		if (!GT.isEmpty()) {
			caminoMaximo = new LinkedList<Integer>();
			List<Integer> caminoActual = new LinkedList<Integer>();
			trazarCaminoHojaMasLejana(GT, caminoActual, caminoMaximo);
		}
		return caminoMaximo;
	}
	private void trazarCaminoHojaMasLejana(GeneralTree<Integer> nodo, List<Integer> caminoActual, List<Integer> caminoMaximo) {
		//Agregar hijo actual
		caminoActual.add(nodo.getData());
		//Si tiene hijos
		if (!nodo.isLeaf()) {
			for (GeneralTree<Integer> hijo : nodo.getChildren()) {
				trazarCaminoHojaMasLejana(hijo, caminoActual, caminoMaximo);
				caminoActual.remove(caminoActual.size() - 1);
			}
		//En el caso de que SI sea una hoja
		} else {
			//Actualizar máximo
			if (caminoActual.size() > caminoMaximo.size()) {
				caminoMaximo.removeAll(caminoMaximo);
				caminoMaximo.addAll(caminoActual);
			}
		}
	}
}
