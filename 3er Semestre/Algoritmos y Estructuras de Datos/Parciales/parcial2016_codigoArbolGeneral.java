package tp2.ejercicio1;

import java.util.*;

public class Parcial {
	public List<String> devolverCamino(GeneralTree<NodoParcial> arbol) {
		List<String> listaDevuelta = new LinkedList<String>();
		if (!arbol.isEmpty()) {devolverCamino(arbol, listaDevuelta);}
		return listaDevuelta;
	}
	
	private void devolverCamino(GeneralTree<NodoParcial> nodoActual, List<String> camino) {
		NodoParcial dato = nodoActual.getValue();
		camino.add(dato.getNombre());
		
		if (!nodoActual.isLeaf()) {
			int nroHijo = dato.getNumero() - 1; //Indizado sobre 0
			List<GeneralTree<NodoParcial>> nodoHijos = nodoActual.getChildNodes();
			
			if (nodoHijos.size() > nroHijo) {
				GeneralTree<NodoParcial> nodoProximo = nodoHijos.get(nroHijo);
				if (!nodoProximo.isEmpty()) {
					devolverCamino(nodoProximo, camino);
				}
			} else {
				camino.clear();
				System.out.println("ERROR: No se encontró un nodo de índice " + (nroHijo + 1) + " entre los hijos del nodo " + dato.getNombre());
			}
		}
	}
	
	public static void main(String[] args) {
		//NIVEL 0
		NodoParcial n1 = new NodoParcial("G", 1);
		GeneralTree<NodoParcial> arbol = new GeneralTree<NodoParcial>(n1);
		
		//NIVEL 1
		NodoParcial n2 = new NodoParcial("E", 3);
		NodoParcial n3 = new NodoParcial("F", 2);
		NodoParcial n4 = new NodoParcial("J", 3);
		GeneralTree<NodoParcial> primerHijo = new GeneralTree<NodoParcial>(n2);
		GeneralTree<NodoParcial> segundoHijo = new GeneralTree<NodoParcial>(n3);
		GeneralTree<NodoParcial> tercerHijo = new GeneralTree<NodoParcial>(n4);
		
		//NIVEL 2
		NodoParcial n5 = new NodoParcial("A", 7);
		NodoParcial n6 = new NodoParcial("B", 9);
		NodoParcial n7 = new NodoParcial("C", 5);
		NodoParcial n8 = new NodoParcial("D", 10);
		NodoParcial n9 = new NodoParcial("H", 5);
		NodoParcial n10 = new NodoParcial("I", 10);
		
		primerHijo.addChildNode(new GeneralTree<NodoParcial>(n5));
		primerHijo.addChildNode(new GeneralTree<NodoParcial>(n6));
		primerHijo.addChildNode(new GeneralTree<NodoParcial>(n7));
		
		segundoHijo.addChildNode(new GeneralTree<NodoParcial>(n8));
		
		tercerHijo.addChildNode(new GeneralTree<NodoParcial>(n9));
		tercerHijo.addChildNode(new GeneralTree<NodoParcial>(n10));
		
		arbol.addChildNode(primerHijo);
		arbol.addChildNode(segundoHijo);
		arbol.addChildNode(tercerHijo);
		
		//PROBAR CÓDIGO
		Parcial parcial = new Parcial();
		List<String> listaCamino = parcial.devolverCamino(arbol);
		System.out.println("Camino devuelto: " + listaCamino);
	}
}

//
// NodoParcial.java
package tp2.ejercicio1;

public class NodoParcial {
	public String nombre;
	public int numero;
	
	public NodoParcial(String nombre, int numero) {
		setNombre(nombre);
		setNumero(numero);
	}
	
	public void setNombre(String nombre) {this.nombre = nombre;}
	public void setNumero(int numero) {this.numero = numero;}
	public String getNombre() {return this.nombre;}
	public int getNumero() {return this.numero;}
}
