<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="active" value="inscription"/>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Inscription étudiant</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <%@ include file="/WEB-INF/fragments/navbar.jspf" %>

    <main class="container narrow">
        <div class="page-header">
            <div>
                <h1>Inscrire un étudiant</h1>
                <p>Les champs marqués d'un <span class="muted">*</span> sont obligatoires.</p>
            </div>
        </div>

        <c:if test="${not empty erreur}">
            <div class="alert alert-error" role="alert">
                <svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><circle cx="12" cy="12" r="10"/><path d="M12 8v4M12 16h.01"/></svg>
                <c:out value="${erreur}"/>
            </div>
        </c:if>

        <form class="card form-card" action="inscription" method="post">
            <div class="form-grid">
                <div class="field">
                    <label for="nom">Nom <span class="req" aria-hidden="true">*</span></label>
                    <input type="text" id="nom" name="nom" placeholder="Ex. Kouassi" autocomplete="family-name" required>
                </div>

                <div class="field">
                    <label for="prenom">Prénom <span class="req" aria-hidden="true">*</span></label>
                    <input type="text" id="prenom" name="prenom" placeholder="Ex. Emmanuel" autocomplete="given-name" required>
                </div>

                <div class="field full">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="prenom.nom@universite.fr" autocomplete="email">
                </div>

                <div class="field">
                    <label for="niveau">Niveau</label>
                    <input type="text" id="niveau" name="niveau" placeholder="Ex. Licence 2">
                </div>

                <div class="field">
                    <label for="filiere">Filière</label>
                    <input type="text" id="filiere" name="filiere" placeholder="Ex. Informatique">
                </div>
            </div>

            <div class="form-actions">
                <a class="btn btn-ghost" href="etudiants">Annuler</a>
                <button class="btn btn-primary" type="submit">
                    <svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M20 6 9 17l-5-5"/></svg>
                    Enregistrer
                </button>
            </div>
        </form>
    </main>
</body>
</html>
