package com.gestionprojet.dao;

import com.gestionprojet.entites.Tache;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.List;

@Stateless
public class TacheDAO {

    @PersistenceContext(unitName = "GestionProjetPU")
    private EntityManager em;

    public void ajouter(Tache tache) {
        em.persist(tache);
    }

    public void modifier(Tache tache) {
        em.merge(tache);
    }

    public void supprimer(Long id) {
        Tache tache = em.find(Tache.class, id);
        if (tache != null) {
            em.remove(tache);
        }
    }

    public Tache trouver(Long id) {
        return em.find(Tache.class, id);
    }

    public List<Tache> listerToutes() {
        return em.createQuery("SELECT t FROM Tache t", Tache.class).getResultList();
    }

    public List<Tache> listerParProjet(Long projetId) {
        return em.createQuery("SELECT t FROM Tache t WHERE t.projet.id = :projetId", Tache.class)
                 .setParameter("projetId", projetId)
                 .getResultList();
    }
}
