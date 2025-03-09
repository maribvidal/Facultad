package repaso_ej1;

import PaqueteLectura.GeneradorAleatorio;

public class Repaso_Ej1 {
    public static void main(String[] args) {
        Subsidio subsidio;
        Proyecto proyecto = new Proyecto("New Aphex Twin Album", 2023, "RDJ");
        
        Investigador richard = new Investigador("Richard", 1, "Breakbeat Analyst");
        Investigador david = new Investigador("David", 2, "Composer");
        Investigador james = new Investigador("James", 3, "Ambient Producer");
        
        //Generar y asignar subsidios
        for (int i = 0; i < 2; i++) {
            subsidio = new Subsidio(GeneradorAleatorio.generarDouble(100), GeneradorAleatorio.generarString(4));
            System.out.println("SUBSIDIO GENERADO / MONTO: " + subsidio.getMonto() + " / MOTIVO: '" + subsidio.getMotivo() + "'");
            richard.agregarSubsidio(subsidio);
        }
        for (int i = 0; i < 2; i++) {
            subsidio = new Subsidio(GeneradorAleatorio.generarDouble(100), GeneradorAleatorio.generarString(4));
            System.out.println("SUBSIDIO GENERADO / MONTO: " + subsidio.getMonto() + " / MOTIVO: '" + subsidio.getMotivo() + "'");
            david.agregarSubsidio(subsidio);
        }
        for (int i = 0; i < 2; i++) {
            subsidio = new Subsidio(GeneradorAleatorio.generarDouble(100), GeneradorAleatorio.generarString(4));
            System.out.println("SUBSIDIO GENERADO / MONTO: " + subsidio.getMonto() + " / MOTIVO: '" + subsidio.getMotivo() + "'");
            james.agregarSubsidio(subsidio);
        }
        
        //Agregarlos al proyecto
        proyecto.agregarInvestigador(richard);
        proyecto.agregarInvestigador(david);
        proyecto.agregarInvestigador(james);
        
        proyecto.otorgarTodos("Richard");
        
        //Leer proyecto
        System.out.println("\n" + proyecto.toString());
    }
}
