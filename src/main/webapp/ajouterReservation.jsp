<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, com.example.gestionhotel.models.Chambre" %>
<%@ page import="com.example.gestionhotel.dao.ChambreDAO" %>
<html>
<head>
    <title>Ajouter une Réservation</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background-color: #f1f5f9;
            color: #0f172a;
        }
        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            width: 230px;
            height: 100vh;
            background-color: #1e293b;
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
        .main {
            margin-left: 230px;
            padding: 40px 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #f8fafc;
        }
        h2 {
            text-align: center;
            color: white;
            margin-bottom: 30px;
        }
        form {
            background-color: #ffffff;
            padding: 25px 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 450px;
            color: #0f172a;
        }
        fieldset {
            border: none;
            margin-bottom: 20px;
        }

        legend {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 15px;
            color: #1e293b;
        }
        label {
            display: block;
            margin-top: 15px;
            margin-bottom: 5px;
            font-weight: 500;
            text-align: left;
        }
        input[type="text"],
        input[type="email"],
        input[type="date"],
        select {
            width: 100%;
            padding: 8px;
            border-radius: 6px;
            border: 1px solid #cbd5e1;
            background-color: #f1f5f9;
            color: #0f172a;
            font-size: 14px;
            transition: border-color 0.3s;
        }

        input:focus, select:focus {
            outline: none;
            border-color: #3b82f6;
            background-color: #fff;
        }
        input[type="submit"] {
            margin-top: 20px;
            background-color: #3b82f6;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 15px;
            border-radius: 6px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #2563eb;
        }
        .back-link {
            margin-top: 15px;
            text-align: center;
        }
        .back-link a {
            color: #1d4ed8;
            text-decoration: none;
        }
        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<%@ include file="sidebar.jspf" %>
<div class="main">
    <form action="${pageContext.request.contextPath}/reservation" method="post">
    <h2 style="color: #0f172a;">Formulaire de Réservation</h2>
        <fieldset>
            <legend>Informations personnels</legend>
            <label for="nom">Nom :</label>
            <input type="text" id="nom" name="nom" required>
            <label for="prenom">Prénom :</label>
            <input type="text" id="prenom" name="prenom" required>
            <label for="email">Email :</label>
            <input type="email" id="email" name="email" required>
            <label for="tel">Téléphone :</label>
            <input type="text" id="tel" name="tel" required>
        </fieldset>
        <fieldset>
            <legend>Réservation</legend>
            <label for="chambreId">Chambre :</label>
            <select id="chambreId" name="chambreId" required>
                <%
                    ChambreDAO dao = new ChambreDAO();
                    List<Chambre> chambres = dao.getAllChambres();
                    for (Chambre c : chambres) {
                        if ("libre".equalsIgnoreCase(c.getStatut())) {
                %>
                <option value="<%= c.getId() %>">
                    Chambre <%= c.getNumero() %> - <%= c.getType() %> - <%= c.getPrix() %> €
                </option>
                <%
                        }
                    }
                %>
            </select>
            <label for="dateDebut">Date de début :</label>
            <input type="date" id="dateDebut" name="dateDebut" required>
            <label for="dateFin">Date de fin :</label>
            <input type="date" id="dateFin" name="dateFin" required>
        </fieldset>
        <input type="submit" value="Valider la réservation">
    </form>
</div>
</body>
</html>
