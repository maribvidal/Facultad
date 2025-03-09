package tp3;

import java.util.*;

public class Prueba {
	public static void main(String[] args) {
		//Creación de un arbol general
		GeneralTree<Integer> arbolGeneral = new GeneralTree<Integer>(12);
		
		GeneralTree<Integer> primerHijo = new GeneralTree<Integer>(17);
		List<GeneralTree<Integer>> phLista = new LinkedList<GeneralTree<Integer>>();
		phLista.add(new GeneralTree<Integer>(10));
		GeneralTree<Integer> sextoHijo = new GeneralTree<Integer>(6);
		sextoHijo.addChild(new GeneralTree<Integer>(1));
		phLista.add(sextoHijo);
		primerHijo.setChildren(phLista);
		
		GeneralTree<Integer> segundoHijo = new GeneralTree<Integer>(9);
		segundoHijo.addChild(new GeneralTree<Integer>(8));
		
		GeneralTree<Integer> tercerHijo = new GeneralTree<Integer>(15);
		List<GeneralTree<Integer>> thLista = new LinkedList<GeneralTree<Integer>>();
		GeneralTree<Integer> octavoHijo = new GeneralTree<Integer>(14);
		octavoHijo.addChild(new GeneralTree<Integer>(16));
		octavoHijo.addChild(new GeneralTree<Integer>(7));
		thLista.add(octavoHijo);
		thLista.add(new GeneralTree<Integer>(18));
		tercerHijo.setChildren(thLista);
		
		arbolGeneral.addChild(primerHijo);
		arbolGeneral.addChild(segundoHijo);
		arbolGeneral.addChild(tercerHijo);
		
		Caminos arbolCamino = new Caminos(arbolGeneral);
		List<Integer> caminoHoja = arbolCamino.caminoAHojaMasLejana();
		Iterator<Integer> it = caminoHoja.iterator();
		while (it.hasNext())
			System.out.print(it.next() + " ");
	}
}
