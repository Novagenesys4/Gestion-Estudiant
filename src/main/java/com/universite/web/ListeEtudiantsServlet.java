package com.universite.web;

import java.io.IOException;

import com.universite.service.EtudiantService;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/etudiants")
public class ListeEtudiantsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @EJB
    private EtudiantService etudiantService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("etudiants", etudiantService.listerTous());
        request.getRequestDispatcher("/WEB-INF/etudiants.jsp").forward(request, response);
    }
}
