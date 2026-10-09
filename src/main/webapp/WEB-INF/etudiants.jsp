<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="active" value="liste"/>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Liste des étudiants</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <%@ include file="/WEB-INF/fragments/navbar.jspf" %>

    <main class="container">
        <div class="page-header">
            <div>
                <h1>Étudiants enregistrés</h1>
                <p>Retrouvez l'ensemble des étudiants inscrits.</p>
            </div>
            <a class="btn btn-primary" href="inscription">
                <svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M12 5v14M5 12h14"/></svg>
                Nouvel étudiant
            </a>
        </div>

        <c:if test="${param.succes == '1'}">
            <div class="alert alert-success" role="status">
                <svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><circle cx="12" cy="12" r="10"/><path d="m8 12 3 3 5-6"/></svg>
                Étudiant enregistré avec succès.
            </div>
        </c:if>

        <div class="card">
            <c:choose>
                <c:when test="${empty etudiants}">
                    <div class="empty">
                        <div class="empty-icon" aria-hidden="true">
                            <svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87M16 3.13a4 4 0 0 1 0 7.75"/></svg>
                        </div>
                        <h2>Aucun étudiant pour le moment</h2>
                        <p>Commencez par inscrire votre premier étudiant.</p>
                        <a class="btn btn-primary" href="inscription">Inscrire un étudiant</a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="stat-bar"><strong>${etudiants.size()}</strong> étudiant(s) enregistré(s)</div>
                    <div class="table-wrap">
                        <table>
                            <thead>
                                <tr>
                                    <th scope="col">N°</th>
                                    <th scope="col">Étudiant</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Niveau</th>
                                    <th scope="col">Filière</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="e" items="${etudiants}">
                                    <tr>
                                        <td class="cell-id"><c:out value="${e.id}"/></td>
                                        <td>
                                            <div class="student">
                                                <span class="avatar" aria-hidden="true"><c:out value="${e.prenom.substring(0,1).toUpperCase()}${e.nom.substring(0,1).toUpperCase()}"/></span>
                                                <span class="student-name"><c:out value="${e.prenom}"/> <c:out value="${e.nom}"/></span>
                                            </div>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${not empty e.email}"><c:out value="${e.email}"/></c:when>
                                                <c:otherwise><span class="muted">—</span></c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${not empty e.niveau}"><span class="chip chip-level"><c:out value="${e.niveau}"/></span></c:when>
                                                <c:otherwise><span class="muted">—</span></c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${not empty e.filiere}"><span class="chip chip-track"><c:out value="${e.filiere.nom}"/></span></c:when>
                                                <c:otherwise><span class="muted">—</span></c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </main>
</body>
</html>
