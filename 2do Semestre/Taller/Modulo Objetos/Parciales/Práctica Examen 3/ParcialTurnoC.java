package parcialturnoc;

public class ParcialTurnoC {
    public static void main(String[] args) {
        Estacion est = new Estacion("Cuchuflito", 10, 1);
        est.generarVenta(0, "1234", 10, "Débito");
        est.generarVenta(0, "1234", 10, "Débito");
        est.generarVenta(3, "1234", 10, "Débito");
        System.out.println(est.toString());
    }
}
