package com.gestionprojet.dao;

import com.gestionprojet.entites.Projet;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.List;

@Stateless
public class ProjetDAO {

    @PersistenceContext(unitName = "GestionProjetPU")
    private EntityManager em;

    public void ajouter(Projet projet) {
        em.persist(projet);
    }

    public void modifier(Projet projet) {
        em.merge(projet);
    }

    public void supprimer(Long id) {
        Projet projet = em.find(Projet.class, id);
        if (projet != null) {
            em.remove(projet);
        }
    }

    public Projet trouver(Long id) {
        return em.find(Projet.class, id);
    }

    public List<Projet> listerTous() {
        return em.createQuery("SELECT p FROM Projet p", Projet.class).getResultList();
    }
}
