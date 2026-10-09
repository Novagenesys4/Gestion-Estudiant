<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="active" value="accueil"/>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Gestion des étudiants</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <%@ include file="/WEB-INF/fragments/navbar.jspf" %>

    <main>
        <section class="hero">
            <span class="hero-badge">Espace administration</span>
            <h1>Gérez vos étudiants simplement</h1>
            <p>Inscrivez de nouveaux étudiants et consultez la liste complète de l'université en quelques clics.</p>
        </section>

        <div class="action-grid">
            <a class="card action-card" href="inscription">
                <span class="action-icon" aria-hidden="true">
                    <svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M19 8v6M22 11h-6"/></svg>
                </span>
                <h2>Inscrire un étudiant</h2>
                <p>Ajoutez un nouvel étudiant avec son niveau et sa filière.</p>
                <span class="go">Commencer
                    <svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M5 12h14M13 6l6 6-6 6"/></svg>
                </span>
            </a>

            <a class="card action-card" href="etudiants">
                <span class="action-icon teal" aria-hidden="true">
                    <svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87M16 3.13a4 4 0 0 1 0 7.75"/></svg>
                </span>
                <h2>Voir les étudiants</h2>
                <p>Consultez tous les étudiants enregistrés et leurs informations.</p>
                <span class="go">Ouvrir la liste
                    <svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M5 12h14M13 6l6 6-6 6"/></svg>
                </span>
            </a>
        </div>
    </main>
</body>
</html>
