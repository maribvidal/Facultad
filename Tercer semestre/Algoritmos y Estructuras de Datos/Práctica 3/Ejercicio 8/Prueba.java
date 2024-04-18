package tp3;

public class Prueba {
	public static void main(String[] args) {
		//Arbol ejemplo 1
		GeneralTree<Integer> arbolE1 = new GeneralTree<Integer>(1);
		arbolE1.addChild(new GeneralTree<Integer>(2));
		arbolE1.addChild(new GeneralTree<Integer>(3));
		arbolE1.addChild(new GeneralTree<Integer>(4));
		
		//Arbol ejemplo 2
		GeneralTree<Integer> arbolE2 = new GeneralTree<Integer>(1);
		GeneralTree<Integer> e2PrimerHijo = new GeneralTree<Integer>(2);
		e2PrimerHijo.addChild(new GeneralTree<Integer>(5));
		e2PrimerHijo.addChild(new GeneralTree<Integer>(6));
		e2PrimerHijo.addChild(new GeneralTree<Integer>(7));
		arbolE2.addChild(e2PrimerHijo);
		arbolE2.addChild(new GeneralTree<Integer>(3));
		arbolE2.addChild(new GeneralTree<Integer>(4));
		
		//Arbol ejemplo 3
		GeneralTree<Integer> arbolE3 = new GeneralTree<Integer>(1);
		arbolE3.addChild(new GeneralTree<Integer>(2));
		GeneralTree<Integer> e3SegundoHijo = new GeneralTree<Integer>(3);
		e3SegundoHijo.addChild(new GeneralTree<Integer>(6));
		e3SegundoHijo.addChild(new GeneralTree<Integer>(7));
		e3SegundoHijo.addChild(new GeneralTree<Integer>(8));
		arbolE3.addChild(e3SegundoHijo);
		arbolE3.addChild(new GeneralTree<Integer>(4));
		arbolE3.addChild(new GeneralTree<Integer>(5));
		
		//Comprobar si son abetos
		Navidad<Integer> ej1 = new Navidad<Integer>(arbolE1);
		Navidad<Integer> ej2 = new Navidad<Integer>(arbolE2);
		Navidad<Integer> ej3 = new Navidad<Integer>(arbolE3);
		System.out.println("¿Es el árbol n°1 un abeto? " + ej1.esAbetoNavideño());
		System.out.println("¿Es el árbol n°2 un abeto? " + ej2.esAbetoNavideño());
		System.out.println("¿Es el árbol n°3 un abeto? " + ej3.esAbetoNavideño());
	}
}
