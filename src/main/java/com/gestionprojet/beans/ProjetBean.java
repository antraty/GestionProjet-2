package com.gestionprojet.beans;

import com.gestionprojet.dao.ProjetDAO;
import com.gestionprojet.entites.Projet;
import jakarta.annotation.PostConstruct;
import jakarta.faces.view.ViewScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import java.io.Serializable;
import java.util.List;

@Named
@ViewScoped
public class ProjetBean implements Serializable {

    @Inject
    private ProjetDAO projetDAO;

    private List<Projet> projets;
    private Projet nouveauProjet;

    @PostConstruct
    public void init() {
        projets = projetDAO.listerTous();
        nouveauProjet = new Projet();
        nouveauProjet.setStatut("En cours"); // Default status
    }

    public void ajouterProjet() {
        projetDAO.ajouter(nouveauProjet);
        projets = projetDAO.listerTous(); // Refresh list
        nouveauProjet = new Projet(); // Reset form
        nouveauProjet.setStatut("En cours");
    }

    public void supprimerProjet(Long id) {
        projetDAO.supprimer(id);
        projets = projetDAO.listerTous(); // Refresh list
    }

    // Getters and Setters
    public List<Projet> getProjets() { return projets; }
    public Projet getNouveauProjet() { return nouveauProjet; }
    public void setNouveauProjet(Projet nouveauProjet) { this.nouveauProjet = nouveauProjet; }
}
