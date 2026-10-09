package com.universite.service;

import java.util.List;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import model.Etudiant;
import model.Filiere;

/**
 * EJB qui gère l'accès à la base universite_db.
 * WildFly ouvre et valide la transaction automatiquement
 * à chaque appel de méthode (pas besoin de begin()/commit()).
 */
@Stateless
public class EtudiantService {

    @PersistenceContext(unitName = "gestionPU")
    private EntityManager em;

    /** Enregistre un étudiant ; crée la filière si elle n'existe pas encore. */
    public void inscrire(Etudiant etudiant, String nomFiliere) {
        if (nomFiliere != null && !nomFiliere.isBlank()) {
            String nom = nomFiliere.trim();
            List<Filiere> trouvees = em
                    .createQuery("SELECT f FROM Filiere f WHERE f.nom = :nom", Filiere.class)
                    .setParameter("nom", nom)
                    .getResultList();

            Filiere filiere;
            if (trouvees.isEmpty()) {
                filiere = new Filiere(nom);
                em.persist(filiere);
            } else {
                filiere = trouvees.get(0);
            }
            etudiant.setFiliere(filiere);
        }
        em.persist(etudiant);
    }

    /** Retourne tous les étudiants, triés par nom puis prénom. */
    public List<Etudiant> listerTous() {
        return em.createQuery(
                "SELECT e FROM Etudiant e LEFT JOIN FETCH e.filiere ORDER BY e.nom, e.prenom",
                Etudiant.class).getResultList();
    }
}
