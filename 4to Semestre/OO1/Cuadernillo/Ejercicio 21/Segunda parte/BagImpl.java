package ar.edu.unlp.oo1.ejercicio21;

import java.util.AbstractCollection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class BagImpl<T> extends AbstractCollection<T> implements Bag<T> {
    Map<T, Integer> elements;

    public BagImpl() {
        this.elements = new HashMap<T, Integer>();
    }

    @Override
    public boolean add(T element) {
        if (this.elements.get(element) == null) {
        	// Si el elemento aún no se encuentra dentro
        	this.elements.put(element, 1);
        } else {
        	// Si el elemento ya se encuentra dentro
        	this.elements.put(element, this.occurrencesOf(element) + 1);
        }
        return true;
    }

    @Override
    public int occurrencesOf(T element) {
    	if (this.elements.get(element) != null) {
    		return this.elements.get(element);
    	}
    	// Si el elemento no se encuentra dentro
    	return 0;
    }

    @Override
    public void removeOccurrence(T element) {
    	// Primero, comprobar si el elemento se encuentra dentro
        if (this.elements.get(element) != null) {
        	if (this.occurrencesOf(element) > 1) {
        		// Si hay mas de una ocurrencia del elemento...
        		this.elements.put(element, this.occurrencesOf(element) - 1);
        	} else {
        		// Si solo hay una ocurrencia del elemento...
        		this.elements.remove(element);
        	}
        }
    }

    @Override
    public void removeAll(T element) {
    	if (this.elements.get(element) != null) {
    		this.elements.remove(element);
    	}
    }

    @Override
    public int size() {
       return this.elements.size();
    }

    @Override
    public Iterator<T> iterator() {
        return new Iterator<T>() {
            private Iterator<Map.Entry<T, Integer>> entryIterator = elements.entrySet().iterator();
            private Map.Entry<T, Integer> currentEntry;
            private int remainingCount;

            @Override
            public boolean hasNext() {
                return remainingCount > 0 || entryIterator.hasNext();
            }

            @Override
            public T next() {
                if (remainingCount == 0) {
                    currentEntry = entryIterator.next();
                    remainingCount = currentEntry.getValue();
                }
                remainingCount--;
                return currentEntry.getKey();
            }

            @Override
            public void remove() {
                removeOccurrence(currentEntry.getKey());
            }
        };
    }
}
