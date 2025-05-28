package unlp.oo2.patrones.ej22;

public interface MixingTank {
	public boolean heatPower(int percentage);
	public boolean mixerPower(int percentage);
	public boolean purge();
	public double upTo();
	public double temperature();
}