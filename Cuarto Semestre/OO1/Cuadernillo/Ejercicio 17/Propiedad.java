/*
 * Copyright 2024 alumnos.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package ar.edu.unlp.oo1.ejercicio17;
import java.util.*;


/**
 *
 * @author alumnos
 */
public class Propiedad {
    String nombre;
    String dir;
    double precio;
    List<DateLapse> fechasReservadas;

    public Propiedad(String nombre, String dir, double precio) {
        this.nombre = nombre;
        this.dir = dir;
        this.precio = precio;
        this.fechasReservadas = new ArrayList<DateLapse>();
    }
    
    public List<DateLapse> getFechasReservadas() { return this.fechasReservadas; }
    public double getPrecio() { return this.precio; }
    
    private boolean consultarDisponibilidad(DateLapse periodo) {
        int fechas = (int) this.getFechasReservadas().stream().filter(fecha -> fecha.overlaps(periodo)).count();
        return (fechas == 0);
    }
    
    public void agregarFecha(DateLapse fecha) {
        if (this.consultarDisponibilidad(fecha)) {
            this.getFechasReservadas().add(fecha);
        } else {
            System.out.println("ERROR: No se encuentra disponible");
        }
    }
    
    public List<DateLapse> fechasDentroPeriodo(DateLapse periodo) {
        return this.getFechasReservadas().stream().filter(fecha -> fecha.inside(periodo)).toList();
    }
}