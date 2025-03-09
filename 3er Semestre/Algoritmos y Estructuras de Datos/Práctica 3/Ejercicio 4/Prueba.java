package tp3;

import java.util.*;

public class Prueba {
	public static void main(String[] args) {
		//Creación de un arbol general
		GeneralTree<AreaEmpresa> arbolGeneral = new GeneralTree<AreaEmpresa>(new AreaEmpresa("M", 14));
		List<GeneralTree<AreaEmpresa>> aGHijos = new LinkedList<GeneralTree<AreaEmpresa>>();
		
		GeneralTree<AreaEmpresa> aGPrimero = new GeneralTree<AreaEmpresa>(new AreaEmpresa("J", 13));
		List<GeneralTree<AreaEmpresa>> aGPHijos = new LinkedList<GeneralTree<AreaEmpresa>>();
		aGPHijos.add(new GeneralTree<AreaEmpresa>(new AreaEmpresa("A", 4)));
		aGPHijos.add(new GeneralTree<AreaEmpresa>(new AreaEmpresa("B", 7)));
		aGPHijos.add(new GeneralTree<AreaEmpresa>(new AreaEmpresa("C", 5)));
		aGPrimero.setChildren(aGPHijos);
		aGHijos.add(aGPrimero);
		
		GeneralTree<AreaEmpresa> aGSegundo = new GeneralTree<AreaEmpresa>(new AreaEmpresa("K", 25));
		List<GeneralTree<AreaEmpresa>> aGSHijos = new LinkedList<GeneralTree<AreaEmpresa>>();
		aGSHijos.add(new GeneralTree<AreaEmpresa>(new AreaEmpresa("D", 6)));
		aGSHijos.add(new GeneralTree<AreaEmpresa>(new AreaEmpresa("E", 10)));
		aGSHijos.add(new GeneralTree<AreaEmpresa>(new AreaEmpresa("F", 18)));
		aGSegundo.setChildren(aGSHijos);
		aGHijos.add(aGSegundo);
		
		GeneralTree<AreaEmpresa> aGTercero = new GeneralTree<AreaEmpresa>(new AreaEmpresa("L", 10));
		List<GeneralTree<AreaEmpresa>> aGTHijos = new LinkedList<GeneralTree<AreaEmpresa>>();
		aGTHijos.add(new GeneralTree<AreaEmpresa>(new AreaEmpresa("G", 9)));
		aGTHijos.add(new GeneralTree<AreaEmpresa>(new AreaEmpresa("H", 12)));
		aGTHijos.add(new GeneralTree<AreaEmpresa>(new AreaEmpresa("I", 19)));
		aGTercero.setChildren(aGTHijos);
		aGHijos.add(aGTercero);
		arbolGeneral.setChildren(aGHijos);
		
		System.out.println(AnalizadorArbol.devolverMaximoPromedio(arbolGeneral));
	}
}
