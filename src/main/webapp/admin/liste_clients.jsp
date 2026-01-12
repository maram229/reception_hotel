<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.example.gestionhotel.dao.ClientDAO, com.example.gestionhotel.models.Client" %>
<%
    ClientDAO clientDAO = new ClientDAO();
    List<Client> clients = clientDAO.getAllClients();
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Liste des clients</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 40px;
            background-color: #f5f7fa;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .main-content {
            max-width: 1000px;
            width: 90%;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            text-align: center;
        }

        h2 {
            color: #1e293b;
            margin-bottom: 30px;
        }

        .button {
            display: inline-block;
            margin-bottom: 20px;
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #0056b3;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px 16px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #007BFF;
            color: white;
        }

        tr:hover {
            background-color: #f1faff;
        }

        .actions a {
            margin-right: 10px;
            color: #007BFF;
            text-decoration: none;
            font-weight: bold;
        }

        .actions a:hover {
            text-decoration: underline;
        }

        .return-button {
            margin-top: 30px;
        }
    </style>
</head>
<body>
<div class="main-content">
    <h2>Liste des clients</h2>
    <a href="ajouter_client.jsp" class="button">+ Ajouter un client</a>

    <table>
        <thead>
        <tr>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Email</th>
            <th>Téléphone</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <% for (Client client : clients) { %>
        <tr>
            <td><%= client.getNom() %></td>
            <td><%= client.getPrenom() %></td>
            <td><%= client.getEmail() %></td>
            <td><%= client.getTel() %></td>
            <td class="actions">
                <a href="modifier_client.jsp?id=<%= client.getId() %>">✏️ Modifier</a>
                <a href="supprimer_client.jsp?id=<%= client.getId() %>" onclick="return confirm('Confirmer la suppression ?');">🗑️ Supprimer</a>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>

<div class="return-button">
    <a href="dashboard.jsp" class="button">← Retour à l'accueil</a>
</div>
</body>
</html>
