package com.universite.web;

import java.io.IOException;

import com.universite.service.EtudiantService;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Etudiant;

@WebServlet("/inscription")
public class InscriptionServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @EJB
    private EtudiantService etudiantService;

    /** GET /inscription : affiche le formulaire. */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/inscription.jsp").forward(request, response);
    }

    /** POST /inscription : enregistre l'étudiant puis affiche la liste. */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8"); // pour les accents (é, è...)

        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String email = request.getParameter("email");
        String niveau = request.getParameter("niveau");
        String filiere = request.getParameter("filiere");

        // Vérification minimale : nom et prénom obligatoires
        if (nom == null || nom.isBlank() || prenom == null || prenom.isBlank()) {
            request.setAttribute("erreur", "Le nom et le prénom sont obligatoires.");
            request.getRequestDispatcher("/inscription.jsp").forward(request, response);
            return;
        }

        Etudiant e = new Etudiant();
        e.setNom(nom.trim());
        e.setPrenom(prenom.trim());
        e.setEmail(email != null ? email.trim() : null);
        e.setNiveau(niveau != null ? niveau.trim() : null);

        etudiantService.inscrire(e, filiere);

        // Redirection vers la liste (évite la double inscription si on actualise la page)
        response.sendRedirect(request.getContextPath() + "/etudiants?succes=1");
    }
}
