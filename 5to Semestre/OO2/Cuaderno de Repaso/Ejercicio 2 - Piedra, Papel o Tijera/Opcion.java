package unlp.oo2.ejercicio2;

import java.util.stream.Stream;
import java.util.Arrays;

public abstract class Opcion {
	public abstract String jugar(Opcion opcion);
	public abstract String opcionLagarto();
	public abstract String opcionPapel();
	public abstract String opcionPiedra();
	public abstract String opcionSpock();
	public abstract String opcionTijera();
}