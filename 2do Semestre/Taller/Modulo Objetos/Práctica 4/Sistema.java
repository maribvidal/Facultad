package tema4;

public abstract class Sistema extends Estacion {
    private int añosConsecutivos;
    private int añoBase;

    //Constructor
    public Sistema(String nombre, String latitud, String longitud, int añosConsecutivos, int añoBase){
        super(nombre, latitud, longitud);
        this.setAñosConsecutivos(añosConsecutivos);
        this.setAñoBase(añoBase);
    }
    
    //Setters
    public int getAñosConsecutivos(){
        return añosConsecutivos;
    }
    public int getAñoBase(){
        return añoBase;
    }

    //Getters
    public void setAñosConsecutivos(int añosConsecutivos){
        this.añosConsecutivos = añosConsecutivos;
    }
    public void setAñoBase(int añoBase){
        this.añoBase = añoBase;
    }
    
    //Métodos abstractos
    public abstract void registrarTemp(double input1, int input2);
    public abstract double obtenerTemp(int input1);
    public abstract String devolverMayorTemp();
}
