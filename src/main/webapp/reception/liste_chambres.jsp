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
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f5f7fa;
            display: flex;
        }

        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            width: 230px;
            height: 100vh;
            background-color: rgba(27, 41, 65, 0.9);
            color: white;
            padding-top: 30px;
            box-shadow: 2px 0 8px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 22px;
        }

        .sidebar a {
            display: block;
            color: #cbd5e1;
            padding: 12px 20px;
            text-decoration: none;
            font-size: 16px;
            transition: background 0.3s;
        }

        .sidebar a:hover {
            background-color: #334155;
            color: #fff;
        }

        .main-content {
            flex: 1;
            padding: 40px;
        }

        h1 {
            color: #1e293b;
            margin-bottom: 20px;
            margin-left: 200px;
        }
        table {
            width: 80%;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 1px 4px rgba(0,0,0,0.1);
            margin-top: 20px;
            margin-left: 200px;
        }

        table th, table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        table th {
            background-color: #2c3e50;
            color: white;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #eaf2ff;
        }

        /* Actions sur tableau */
        .actions a {
            margin-right: 10px;
            text-decoration: none;
            color: #3498db;
        }

        .actions a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<%@ include file="includes/sidebar.jspf" %>

<div class="main-content">
    <h1>Liste des chambres</h1>
    <table>
        <thead>
        <tr>
            <th>Numéro</th>
            <th>Type</th>
            <th>Prix</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Chambre ch : chambres) {
        %>
        <tr>
            <td><%= ch.getNumero() %></td>
            <td><%= ch.getType() %></td>
            <td><%= ch.getPrix() %> TND</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>

