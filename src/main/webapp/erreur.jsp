<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Erreur</title>
</head>
<body>
<h2>Une erreur est survenue</h2>
<p><%= request.getAttribute("erreur") != null ? request.getAttribute("erreur") : "Erreur inconnue." %></p>
<p><a href="accueil.jsp">Retour à l'accueil</a></p>
</body>
</html>
