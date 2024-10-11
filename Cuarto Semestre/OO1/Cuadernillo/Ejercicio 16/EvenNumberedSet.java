package ar.edu.unlp.oo1.ejercicio16;

import java.util.AbstractSet;
import java.util.ArrayList;
import java.util.Iterator;

public class EvenNumberedSet extends AbstractSet<Integer> {
	ArrayList<Integer> vector;
	
	public EvenNumberedSet() {
		vector = new ArrayList<Integer>();
	}

	@Override
	public int size() { return this.vector.size(); }

	@Override
	public Iterator<Integer> iterator() { return this.vector.iterator(); }

	@Override
	public boolean add(Integer e) {
		// Si el número e es par, y el vector no contiene el elemento
		if (this.isEven(e) && !this.contains(e))
			vector.add(e);
		
		return false;
	}
	
	private boolean isEven(Integer e) { return (e % 2 == 0); }
}
