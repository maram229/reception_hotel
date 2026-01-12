<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.example.gestionhotel.dao.ChambreDAO, com.example.gestionhotel.models.Chambre" %>
<%
    ChambreDAO chambreDAO = new ChambreDAO();
    List<Chambre> chambres = chambreDAO.getAllChambres();
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Liste des chambres</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .main-content {
            background: #ffffff;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.1);
            width: 95%;
            max-width: 1000px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
        }

        th, td {
            padding: 14px 18px;
            border: 1px solid #dee2e6;
            text-align: center;
        }

        th {
            background-color: #007bff;
            color: white;
            font-weight: 600;
        }

        tr:nth-child(even) {
            background-color: #f9fbfd;
        }

        .actions a {
            margin: 0 6px;
            text-decoration: none;
            color: #007bff;
            font-size: 1rem;
        }

        .actions a:hover {
            color: #0056b3;
        }

        .button {
            display: inline-block;
            margin-top: 30px;
            padding: 10px 24px;
            background-color: #6c757d;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            text-align: center;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #5a6268;
        }

        .top-actions {
            text-align: right;
            margin-bottom: 10px;
        }

        .top-actions a {
            background-color: #28a745;
            color: white;
            padding: 8px 16px;
            border-radius: 8px;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .top-actions a:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<div class="main-content">
    <h2>Liste des chambres</h2>

    <div class="top-actions">
        <a href="ajouter_chambre.jsp"><i class="bi bi-plus-lg"></i> Ajouter une chambre</a>
    </div>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Numéro</th>
            <th>Type</th>
            <th>Capacité</th>
            <th>Prix</th>
            <th>Statut</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <% for (Chambre ch : chambres) { %>
        <tr>
            <td><%= ch.getId() %></td>
            <td><%= ch.getNumero() %></td>
            <td><%= ch.getType() %></td>
            <td><%= ch.getCapacite() %></td>
            <td><%= ch.getPrix() %> TND</td>
            <td><%= ch.getStatut() %></td>
            <td class="actions">
                <a href="modifier_chambre.jsp?id=<%= ch.getId() %>" title="Modifier"><i class="bi bi-pencil-square"></i></a>
                <a href="supprimer_chambre.jsp?id=<%= ch.getId() %>" onclick="return confirm('Confirmer la suppression ?');" title="Supprimer"><i class="bi bi-trash-fill"></i></a>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>

    <div style="text-align: center;">
        <a href="dashboard.jsp" class="button">← Retour à l'accueil</a>
    </div>
</div>

</body>
</html>
