package ar.edu.unlp.oo1.ejercicio23;

import java.util.AbstractCollection;
import java.util.Iterator;
import java.util.Map;
import java.util.TreeMap;

public class CategoriaMap extends AbstractCollection<String> {
	Map<String, Integer> categorias;
	
	public CategoriaMap() {
		this.categorias = new TreeMap<String, Integer>();
	}
	
	@Override
	public boolean add(String categoria) {
        if (this.categorias.get(categoria) == null) {
        	this.categorias.put(categoria, 1);
        } else {
        	this.categorias.put(categoria, this.contarItems(categoria) + 1);
        }
        return true;
	}

    public int contarItems(String categoria) {
    	if (this.categorias.get(categoria) != null) {
    		return this.categorias.get(categoria);
    	}
    	return 0;
    }

    public void quitarItem(String categoria) {
        if (this.categorias.get(categoria) != null) {
        	if (this.contarItems(categoria) > 1) {
        		this.categorias.put(categoria, this.contarItems(categoria) - 1);
        	} else {
        		this.categorias.remove(categoria);
        	}
        }
    }

    public void quitarItemTodos(String categoria) {
    	if (this.categorias.get(categoria) != null) {
    		this.categorias.remove(categoria);
    	}
    }

    @Override
    public int size() {
       return this.categorias.size();
    }
    @Override
    public Iterator<String> iterator() {
        return new Iterator<String>() {
            private Iterator<Map.Entry<String, Integer>> entryIterator = categorias.entrySet().iterator();
            private Map.Entry<String, Integer> currentEntry;
            private int remainingCount;

            @Override
            public boolean hasNext() {
                return remainingCount > 0 || entryIterator.hasNext();
            }

            @Override
            public String next() {
                if (remainingCount == 0) {
                    currentEntry = entryIterator.next();
                    remainingCount = currentEntry.getValue();
                }
                remainingCount--;
                return currentEntry.getKey();
            }

            @Override
            public void remove() {
                quitarItem(currentEntry.getKey());
            }
        };
    }
}
