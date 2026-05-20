package com.gestionprojet.beans;

import com.gestionprojet.dao.ProjetDAO;
import com.gestionprojet.dao.TacheDAO;
import com.gestionprojet.dao.UtilisateurDAO;
import com.gestionprojet.entites.Projet;
import com.gestionprojet.entites.Tache;
import com.gestionprojet.entites.Utilisateur;
import jakarta.annotation.PostConstruct;
import jakarta.faces.context.FacesContext;
import jakarta.faces.view.ViewScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import java.io.Serializable;
import java.util.List;
import java.util.Map;

@Named
@ViewScoped
public class TacheBean implements Serializable {

    @Inject
    private TacheDAO tacheDAO;

    @Inject
    private ProjetDAO projetDAO;

    @Inject
    private UtilisateurDAO utilisateurDAO;

    private Long projetId;
    private Projet projet;
    private List<Tache> taches;
    private Tache nouvelleTache;
    private Long utilisateurAssigneId;
    private List<Utilisateur> utilisateurs;

    @PostConstruct
    public void init() {
        nouvelleTache = new Tache();
        nouvelleTache.setStatut("À faire");
        nouvelleTache.setPriorite("Moyenne");
        utilisateurs = utilisateurDAO.listerTous();
    }

    public void chargerProjet() {
        Map<String, String> params = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap();
        String idParam = params.get("projetId");
        if (idParam != null && !idParam.isEmpty()) {
            projetId = Long.valueOf(idParam);
            projet = projetDAO.trouver(projetId);
            taches = tacheDAO.listerParProjet(projetId);
        }
    }

    public void ajouterTache() {
        if (projet != null) {
            nouvelleTache.setProjet(projet);
            if (utilisateurAssigneId != null) {
                Utilisateur u = utilisateurDAO.trouver(utilisateurAssigneId);
                nouvelleTache.setAssigneA(u);
            }
            tacheDAO.ajouter(nouvelleTache);
            taches = tacheDAO.listerParProjet(projetId); // Refresh
            nouvelleTache = new Tache();
            nouvelleTache.setStatut("À faire");
            nouvelleTache.setPriorite("Moyenne");
        }
    }

    public void mettreAJourStatut(Tache tache, String statut) {
        tache.setStatut(statut);
        tacheDAO.modifier(tache);
        taches = tacheDAO.listerParProjet(projetId); // Refresh
    }

    public void supprimerTache(Long id) {
        tacheDAO.supprimer(id);
        taches = tacheDAO.listerParProjet(projetId); // Refresh
    }

    // Getters and Setters
    public Long getProjetId() { return projetId; }
    public void setProjetId(Long projetId) { this.projetId = projetId; }
    public Projet getProjet() { return projet; }
    public List<Tache> getTaches() { return taches; }
    public Tache getNouvelleTache() { return nouvelleTache; }
    public void setNouvelleTache(Tache nouvelleTache) { this.nouvelleTache = nouvelleTache; }
    public Long getUtilisateurAssigneId() { return utilisateurAssigneId; }
    public void setUtilisateurAssigneId(Long utilisateurAssigneId) { this.utilisateurAssigneId = utilisateurAssigneId; }
    public List<Utilisateur> getUtilisateurs() { return utilisateurs; }
}
