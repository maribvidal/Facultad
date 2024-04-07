package tp2.ejercicio1;

import java.util.*;

public class RedBinariaLlena {
	private BinaryTree<Integer> arbolBinario;
	
	public RedBinariaLlena(BinaryTree<Integer> arbolBinario) {
		this.arbolBinario = arbolBinario;
	}
	
	public int retardoReenvio() {
		int retardo = 0;
		if (!arbolBinario.isEmpty()) {
			retardo = retardar(arbolBinario);
		}
		return retardo;
	}

	private int retardar(BinaryTree<Integer> arb) {
		int retIzq = 0;
		int retDer = 0;
		if (arb.hasLeftChild()) {retIzq = retardar(arb.getLeftChild());}
		if (arb.hasRightChild()) {retIzq = retardar(arb.getRightChild());}
		return Math.max(retIzq, retDer) + arb.getData();
	}
}
