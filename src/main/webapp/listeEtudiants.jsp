<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des étudiants</title>
    <style>
        table { border-collapse: collapse; }
        th, td { border: 1px solid #999; padding: 6px 12px; }
        th { background: #eee; }
    </style>
</head>
<body>

    <h2>Étudiants enregistrés</h2>

    <c:choose>
        <c:when test="${empty etudiants}">
            <p>Aucun étudiant enregistré pour le moment.</p>
        </c:when>
        <c:otherwise>
            <table>
                <tr>
                    <th>N°</th>
                    <th>Nom</th>
                    <th>Prénom</th>
                    <th>Email</th>
                    <th>Niveau</th>
                    <th>Filière</th>
                </tr>
                <c:forEach var="e" items="${etudiants}">
                    <tr>
                        <td>${e.id}</td>
                        <td><c:out value="${e.nom}"/></td>
                        <td><c:out value="${e.prenom}"/></td>
                        <td><c:out value="${e.email}"/></td>
                        <td><c:out value="${e.niveau}"/></td>
                        <td><c:out value="${e.filiere.nom}"/></td>
                    </tr>
                </c:forEach>
            </table>
        </c:otherwise>
    </c:choose>

    <p>
        <a href="inscription.jsp">Inscrire un autre étudiant</a> |
        <a href="index.jsp">Accueil</a>
    </p>

</body>
</html>
