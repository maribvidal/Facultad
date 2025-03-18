package unlp.oo2.ejercicio2;

public class Lagarto extends Opcion {
    // Double Dispatch
    public String jugar(Opcion opcion) {
        return opcion.opcionLagarto();
    }

    public String opcionLagarto() { return "Empate"; }
    public String opcionPapel() { return "El lagarto come el papel"; }
    public String opcionPiedra() { return "La piedra aplasta al lagarto"; }
    public String opcionSpock() { return "El lagarto envenena a Spock"; }
    public String opcionTijera() { return "La tijera decapita al lagarto"; }
}