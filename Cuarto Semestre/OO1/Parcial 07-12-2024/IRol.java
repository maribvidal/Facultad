package parcial.segundaFecha;

public interface IRol {
	// El rol determina un valor base
	public abstract double determinarValorBase(int nivel, Habilidad h);
	
	// Los personajes aumentan sus habilidades según su rol
	public abstract void incrementarHabilidad(int nivel, Habilidad h);
}
