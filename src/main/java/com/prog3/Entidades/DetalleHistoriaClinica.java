
package com.prog3.Entidades;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * @author Cortinez Juan José
 */
@Entity

public class DetalleHistoriaClinica implements Serializable{
    @Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    
    
    private String fechaAtencion;
    private String sintomas;
    private String diagnostico;
    private String observaciones;


    public DetalleHistoriaClinica() {
    }

    public DetalleHistoriaClinica(String fechaAtencion, String sintomas, String diagnostico, String observaciones) {
        this.fechaAtencion = fechaAtencion;
        this.sintomas = sintomas;
        this.diagnostico = diagnostico;
        this.observaciones = observaciones;
    }
    
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }
    


    public String getFechaAtencion() {
        return fechaAtencion;
    }

    public void setFechaAtencion(String fechaAtencion) {
        this.fechaAtencion = fechaAtencion;
    }

    public String getSintomas() {
        return sintomas;
    }

    public void setSintomas(String sintomas) {
        this.sintomas = sintomas;
    }

    public String getDiagnostico() {
        return diagnostico;
    }

    public void setDiagnostico(String diagnostico) {
        this.diagnostico = diagnostico;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }
}
