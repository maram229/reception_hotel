<%@ page import="com.example.gestionhotel.models.Reservation" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.gestionhotel.models.Client" %>
<%@ page import="com.example.gestionhotel.models.Chambre" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Liste des Réservations</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            display: flex;
            background-color: #f4f7f8;
        }

        h1 {
            color: #1e293b;
            text-align: center;
            margin-bottom: 40px;
            font-size: 32px;
            font-weight: bold;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
            background-color: #ffffff;
            border-radius: 8px;
            overflow: hidden;
            margin-left: 80px;
        }

        th, td {
            padding: 14px 18px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }

        th {
            background-color: #007BFF;
            color: white;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        tr:hover {
            background-color: #f1faff;
        }

        td[colspan="8"] {
            text-align: center;
            font-style: italic;
            color: #777;
            padding: 20px;
        }

        .button {
            display: inline-block;
            margin: 30px auto;
            padding: 12px 24px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            text-align: center;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #0056b3;
        }

        .btn-container {
            text-align: center;
            margin-top: 30px;
        }
    </style>
</head>
<body>
<div class="content">
    <h1>Liste des Réservations</h1>

    <table>
        <tr>
            <th>Client</th>
            <th>Email</th>
            <th>Téléphone</th>
            <th>Chambre</th>
            <th>Type</th>
            <th>Date Début</th>
            <th>Date Fin</th>
        </tr>

        <%
            List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
            if (reservations != null) {
                for (Reservation r : reservations) {
                    Client c = r.getClient();
                    Chambre ch = r.getChambre();
        %>
        <tr>
            <td><%= c.getPrenom() %> <%= c.getNom() %></td>
            <td><%= c.getEmail() %></td>
            <td><%= c.getTel() %></td>
            <td><%= ch.getNumero() %></td>
            <td><%= ch.getType() %></td>
            <td><%= r.getDateDebut() %></td>
            <td><%= r.getDateFin() %></td>
        </tr>
        <%
            }
        } else {
        %>
        <tr><td colspan="8">Aucune réservation trouvée.</td></tr>
        <%
            }
        %>
    </table>

    <div class="btn-container">
        <a href="dashboard.jsp" class="button">← Retour à l'accueil</a>
    </div>
</div>
</body>
</html>
