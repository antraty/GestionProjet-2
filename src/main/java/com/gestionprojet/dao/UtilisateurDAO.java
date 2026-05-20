package com.gestionprojet.dao;

import com.gestionprojet.entites.Utilisateur;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import java.util.List;

@Stateless
public class UtilisateurDAO {

    @PersistenceContext(unitName = "GestionProjetPU")
    private EntityManager em;

    public void ajouter(Utilisateur utilisateur) {
        em.persist(utilisateur);
    }

    public void modifier(Utilisateur utilisateur) {
        em.merge(utilisateur);
    }

    public void supprimer(Long id) {
        Utilisateur utilisateur = em.find(Utilisateur.class, id);
        if (utilisateur != null) {
            em.remove(utilisateur);
        }
    }

    public Utilisateur trouver(Long id) {
        return em.find(Utilisateur.class, id);
    }

    public List<Utilisateur> listerTous() {
        return em.createQuery("SELECT u FROM Utilisateur u", Utilisateur.class).getResultList();
    }
}
