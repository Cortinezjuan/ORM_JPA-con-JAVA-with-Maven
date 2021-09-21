
package com.prog3.ormjpaclinica;

import com.prog3.Entidades.DetalleHistoriaClinica;
import com.prog3.Entidades.Domicilio;
import com.prog3.Entidades.HistoriaClinica;
import com.prog3.Entidades.Medico;
import com.prog3.Entidades.Paciente;
import com.prog3.Entidades.Turno;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 * @author Cortinez Juan Jos�
 */
public class Principal {
    
    public static void main(String[] args){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("ormclinica");
        EntityManager em = emf.createEntityManager();
        
        try {
            em.getTransaction().begin();
            
            
             DetalleHistoriaClinica nuevoDetalle = new DetalleHistoriaClinica("05/07/2021", "migrañas", "cervicalgia", "reposo por 24hs"); 
            
            List<DetalleHistoriaClinica> nuevoDetalles = new ArrayList();
            nuevoDetalles.add(nuevoDetalle);
            HistoriaClinica historiaClinica = new HistoriaClinica(2, "22/08/2021");
            historiaClinica.setDetallesHC(nuevoDetalles);
            Domicilio domicilioPaciente = new Domicilio("Mendoza","San Martin", 1200);
            Paciente nuevoPaciente = new Paciente();
            nuevoPaciente.setApellido("Perez");
            nuevoPaciente.setDomicilio(domicilioPaciente);
            nuevoPaciente.setNombre("Juan");
            
            nuevoPaciente.setDni(35652693);
            nuevoPaciente.setHistoriaClinica(historiaClinica);
            
            Medico nuevoMedico = new Medico();
            
           
            Domicilio domicilioMedico = new Domicilio("Lavalle", "Mitre", 255);
            nuevoMedico.setApellido("Gomez");
            nuevoMedico.setCelular(261360986);
            nuevoMedico.setDni(25369852);
            nuevoMedico.setMatricula(125963);
            nuevoMedico.setDomicilio(domicilioMedico);
            
            Turno nuevoTurno = new Turno("22/10/2021", 10, 30);
           List<Turno> turnosPaciente = new ArrayList();
           turnosPaciente.add(nuevoTurno);
           nuevoPaciente.setTurnos(turnosPaciente);
           
           List<Turno> turnosMedico = new ArrayList();
           turnosMedico.add(nuevoTurno);
           nuevoMedico.setTurnos(turnosMedico);
            
            
            em.persist(nuevoPaciente);
            em.persist(nuevoMedico);
            em.flush(); // limpiar la conexion
            
            em.getTransaction().commit();//commit
        } catch (Exception e) {
            em.getTransaction().rollback();//rollback para que se vuelva al estado anterior
        }
        em.close();//cerrar la conexion
        emf.close();
    }

}
