package unlp.oo2.ejercicio2;

public class Tijera extends Opcion {
    // Double Dispatch
    public String jugar(Opcion opcion) {
        return opcion.opcionTijera();
    }

    public String opcionLagarto() { return "La tijera decapita al lagarto"; }
    public String opcionPapel() { return "La tijera corta al papel"; }
    public String opcionPiedra() { return "La piedra aplasta la tijera"; }
    public String opcionSpock() { return "Spock rompe la tijera"; }
    public String opcionTijera() { return "Empate"; }
}