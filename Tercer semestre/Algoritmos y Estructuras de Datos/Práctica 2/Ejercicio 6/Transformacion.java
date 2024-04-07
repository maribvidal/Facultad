package tp2.ejercicio1;

public class Transformacion {
	BinaryTree<Integer> arbolBinario;
	
	public Transformacion(BinaryTree<Integer> arb) {
		this.arbolBinario = arb;
	}
	
	public BinaryTree<Integer> suma() {
		if (!arbolBinario.isEmpty())
			Transformar(arbolBinario);
		return arbolBinario;
	}
	
	public int Transformar(BinaryTree<Integer> arb) {
		int suma = 0;
		int valorViejo = arb.getData();
		//Recorrido INORDEN
		if (arb.hasLeftChild()) {
			suma += Transformar(arb.getLeftChild());
		}
		if (arb.hasRightChild()) {
			suma += Transformar(arb.getRightChild());
		}
		//Actualizar valor del nodo actual
		arb.setData(suma);
		//Devolver la suma actual mas el valor viejo del nodo actualizado
		return suma + valorViejo;
	}
}
