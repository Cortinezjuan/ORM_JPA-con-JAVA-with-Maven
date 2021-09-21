
package com.prog3.Entidades;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

/**
 * @author Cortinez Juan José
 */
@Entity
public class Paciente extends Persona{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private int nroSocio;
    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "id_paciente")
    private List<Turno> turnos = new ArrayList();
    
    @JoinColumn(name = "id_historiaClinica")
    @OneToOne(cascade = CascadeType.ALL)
    private HistoriaClinica historiaClinica;

    public Paciente() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }



    public int getNroSocio() {
        return nroSocio;
    }

    public void setNroSocio(int nroSocio) {
        this.nroSocio = nroSocio;
    }



    public List<Turno> getTurnos() {
        return turnos;
    }

    public void setTurnos(List<Turno> turnos) {
        this.turnos = turnos;
    }

    public HistoriaClinica getHistoriaClinica() {
        return historiaClinica;
    }

    public void setHistoriaClinica(HistoriaClinica historiaClinica) {
        this.historiaClinica = historiaClinica;
    }


}
