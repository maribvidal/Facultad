package unlp.oo2.ejercicio2;

public class Papel extends Opcion {
    // Double Dispatch
    public String jugar(Opcion opcion) {
        return opcion.opcionPapel();
    }

    public String opcionLagarto() { return "El lagarto se come al papel"; }
    public String opcionPapel() { return "Empate"; }
    public String opcionPiedra() { return "El papel envuelve a la piedra"; }
    public String opcionSpock() { return "El papel desaprueba a Spock"; }
    public String opcionTijera() { return "La tijera corta al papel"; }
}