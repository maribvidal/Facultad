package tema4;

public class Entrenador extends Empleado{
    private int campeonatosGanados = 0;

    public Entrenador(String nombre, double sueldo, int antiguedad, int campeonatosGanados){
        super(nombre, sueldo, antiguedad);
        this.setCampeonatosGanados(campeonatosGanados);
    }

    //Getters
    public int getCampeonatosGanados(){
        return this.campeonatosGanados;
    }
    
    //Setters
    public void setCampeonatosGanados(int campeonatosGanados){
        this.campeonatosGanados = campeonatosGanados;
    }
    
    public double calcularEfectividad(){
        double calculo = (this.getCampeonatosGanados() / this.getAntiguedad());
        return calculo;
    }
    
    public double calcularSueldoACobrar(){
        double calculo = this.calcularSueldoBasico();
        
        //Se adiciona un plus por campeonatos ganados
        if (this.getCampeonatosGanados() > 0 || this.getCampeonatosGanados() <= 4){
            calculo += 5000;
        } else if (this.getCampeonatosGanados() >= 5 || this.getCampeonatosGanados() <= 10){
            calculo += 30000;
        } else if (this.getCampeonatosGanados() > 10){
            calculo += 50000;
        }
        
        return calculo;
    }
}
