package tp3;

import java.util.*;

public class Prueba {
	public static void main(String[] args) {
		//Creación de un arbol general
		GeneralTree<RedAguaPotable> arbolGeneral = new GeneralTree<RedAguaPotable>(new RedAguaPotable("A"));
		GeneralTree<RedAguaPotable> SegundoHijo = new GeneralTree<RedAguaPotable>(new RedAguaPotable("C"));
		GeneralTree<RedAguaPotable> TercerHijo = new GeneralTree<RedAguaPotable>(new RedAguaPotable("D"));
		GeneralTree<RedAguaPotable> SextoHijo = new GeneralTree<RedAguaPotable>(new RedAguaPotable("G"));
		GeneralTree<RedAguaPotable> NovenoHijo = new GeneralTree<RedAguaPotable>(new RedAguaPotable("J"));
		
		//Crear las listas de hijos
		List<GeneralTree<RedAguaPotable>> agLista = new LinkedList<GeneralTree<RedAguaPotable>>();
		List<GeneralTree<RedAguaPotable>> seghLista = new LinkedList<GeneralTree<RedAguaPotable>>();
		List<GeneralTree<RedAguaPotable>> thLista = new LinkedList<GeneralTree<RedAguaPotable>>();
		List<GeneralTree<RedAguaPotable>> sexhLista = new LinkedList<GeneralTree<RedAguaPotable>>();
		List<GeneralTree<RedAguaPotable>> nhLista = new LinkedList<GeneralTree<RedAguaPotable>>();
		
		nhLista.add(new GeneralTree<RedAguaPotable>(new RedAguaPotable("M")));
		nhLista.add(new GeneralTree<RedAguaPotable>(new RedAguaPotable("N")));
		NovenoHijo.setChildren(nhLista);
		
		sexhLista.add(new GeneralTree<RedAguaPotable>(new RedAguaPotable("L")));
		SextoHijo.setChildren(sexhLista);
		
		seghLista.add(new GeneralTree<RedAguaPotable>(new RedAguaPotable("F")));
		seghLista.add(SextoHijo);
		SegundoHijo.setChildren(seghLista);
		
		thLista.add(new GeneralTree<RedAguaPotable>(new RedAguaPotable("H")));
		thLista.add(new GeneralTree<RedAguaPotable>(new RedAguaPotable("I")));
		thLista.add(NovenoHijo);
		thLista.add(new GeneralTree<RedAguaPotable>(new RedAguaPotable("K")));
		thLista.add(new GeneralTree<RedAguaPotable>(new RedAguaPotable("P")));
		TercerHijo.setChildren(thLista);
		
		agLista.add(new GeneralTree<RedAguaPotable>(new RedAguaPotable("B")));
		agLista.add(SegundoHijo);
		agLista.add(TercerHijo);
		agLista.add(new GeneralTree<RedAguaPotable>(new RedAguaPotable("E")));
		arbolGeneral.setChildren(agLista);
		
		//Probar código
		RedDeAguaPotable arbolRed = new RedDeAguaPotable(arbolGeneral);
		System.out.println(arbolRed.minimoCaudal(1000));
		arbolRed.imprimir();
	}
}
