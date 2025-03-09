package ar.edu.unlp.oo1.ejercicio16;

import java.util.SortedSet;
import java.util.TreeSet;

public class EvenNumberSet {
	SortedSet<Integer> set;
	
	public EvenNumberSet() {
		set = new TreeSet<Integer>();
	}
	
	public int size() { return this.set.size(); }
	public boolean contains(Integer e) { return this.set.contains(e); }

	public boolean add(Integer e) {
		// Si el número e es par
		if (this.isEven(e) && !this.set.contains(e))
			this.set.add(e);
		return false;
	}
	
	private boolean isEven(Integer e) { return (e % 2 == 0); }
}
