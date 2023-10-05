package tema4;

public class VisorFiguras {
    private int guardadas;
    private int capacidadMaxima=5;
    private Figura [] vector;

    public VisorFiguras(){
        this.guardadas = 0;
        this.vector = new Figura[this.capacidadMaxima];
    }

    public void guardar(Figura f){
        if (this.quedaEspacio()) {
            this.vector[this.guardadas] = f;
            this.guardadas++;
        } else {
            System.out.println("ERROR: No queda mas espacio libre.");
        }
    }
    
    public boolean quedaEspacio(){
        return (this.guardadas < this.capacidadMaxima);
    }

    public void mostrar(){
        int i;
        for (i = 0; i < this.guardadas; i++)
            System.out.println(this.vector[i].toString());
    }
    
    public int getGuardadas() {
        return this.guardadas;
    }
}
