package tp3;

import java.util.*;

public class Prueba {
	public static void main(String[] args) {
		//Creación de un arbol general
		GeneralTree<Integer> arbolGeneral = new GeneralTree<Integer>(1);
		List<GeneralTree<Integer>> agHijos = new LinkedList<GeneralTree<Integer>>();
		
		//Primer hijo y sus hijos
		GeneralTree<Integer> agPrimerHijo = new GeneralTree<Integer>(2);
		List<GeneralTree<Integer>> agPHhijos = new LinkedList<GeneralTree<Integer>>();
		agPHhijos.add(new GeneralTree<Integer>(5));
		agPHhijos.add(new GeneralTree<Integer>(6));
		agPHhijos.add(new GeneralTree<Integer>(7));
		agPrimerHijo.setChildren(agPHhijos);
		agHijos.add(agPrimerHijo);
		
		//Segundo hijo y sus hijos
		GeneralTree<Integer> agSegundoHijo = new GeneralTree<Integer>(3);
		List<GeneralTree<Integer>> agSHhijos = new LinkedList<GeneralTree<Integer>>();
		agSHhijos.add(new GeneralTree<Integer>(8));
		agSegundoHijo.setChildren(agSHhijos);
		agHijos.add(agSegundoHijo);
		
		//Tercer hijo y sus hijos
		GeneralTree<Integer> agTercerHijo = new GeneralTree<Integer>(4);
		List<GeneralTree<Integer>> agTHhijos = new LinkedList<GeneralTree<Integer>>();
		agTHhijos.add(new GeneralTree<Integer>(9));
		agTHhijos.add(new GeneralTree<Integer>(10));
		agTHhijos.add(new GeneralTree<Integer>(11));
		agTercerHijo.setChildren(agTHhijos);
		agHijos.add(agTercerHijo);
		arbolGeneral.setChildren(agHijos);

    //Obtener altura del árbol
    System.out.println("Altura del árbol: " + arbolGeneral.altura());
    
    //Obtener nivel de un dato cualquiera
    System.out.println("Ancho del árbol: " + arbolGeneral.nivel(8));
    
		//Obtener ancho del árbol
		System.out.println("Ancho del árbol: " + arbolGeneral.ancho());
	}
}
