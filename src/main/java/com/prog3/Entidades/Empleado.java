
package com.prog3.Entidades;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * @author Cortinez Juan José
 */
@Entity
public class Empleado extends Persona{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private int nroLegajo;
    private double sueldo;

    public Empleado() {
    }


    public int getNroLegajo() {
        return nroLegajo;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public void setNroLegajo(int nroLegajo) {
        this.nroLegajo = nroLegajo;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }


}
