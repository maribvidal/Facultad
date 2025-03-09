package parcial.segundaFecha;

public interface IRol {
	// El rol determina un valor base
	public abstract double determinarValorBase(Personaje p);
	
	// Los personajes aumentan sus habilidades según su rol
	public abstract void incrementarHabilidad(Personaje p);
}
