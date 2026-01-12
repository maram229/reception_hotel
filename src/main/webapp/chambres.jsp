<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, com.example.gestionhotel.models.Chambre" %>
<html>
<head>
    <title>Liste des Chambres</title>

</head>
<body>
<h2>Chambres disponibles</h2>

<table border="1">
    <tr>
        <th>Numéro</th>
        <th>Type</th>
        <th>Capacité</th>
        <th>Prix (€)</th>
        <th>Statut</th>
    </tr>
    <%
        List<Chambre> chambres = (List<Chambre>) request.getAttribute("chambres");
        if (chambres != null && !chambres.isEmpty()) {
            for (Chambre c : chambres) {
    %>
    <tr>
        <td><%= c.getNumero() %></td>
        <td><%= c.getType() %></td>
        <td><%= c.getCapacite() %></td>
        <td><%= c.getPrix() %></td>
        <td><%= c.getStatut() %></td>
    </tr>
    <%
        }
    } else {
    %>
    <tr><td colspan="5">Aucune chambre trouvée.</td></tr>
    <% } %>
</table>

<p><a href="admin/ajouter_chambre.jsp">Ajouter une chambre</a></p>
</body>
</html>