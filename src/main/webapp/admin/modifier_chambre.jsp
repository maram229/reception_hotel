<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.gestionhotel.dao.ChambreDAO, com.example.gestionhotel.models.Chambre" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    ChambreDAO dao = new ChambreDAO();
    Chambre chambre = dao.getChambreById(id);
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Modifier Chambre</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fa;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
        }

        .main-content {
            background-color: #ffffff;
            margin-top: 50px;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #2c3e50;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 8px;
            font-weight: bold;
            color: #34495e;
        }

        input[type="text"],
        input[type="number"] {
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: #3498db;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }

        a.button {
            display: inline-block;
            margin-top: 20px;
            text-align: center;
            background-color: #95a5a6;
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 6px;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }

        a.button:hover {
            background-color: #7f8c8d;
        }

    </style>
</head>
<body>
<div class="main-content">
    <h2>Modifier la chambre</h2>
    <form action="ModifierChambreServlet" method="post">
        <input type="hidden" name="id" value="<%= chambre.getId() %>">

        <label>Numéro :</label>
        <input type="text" name="numero" value="<%= chambre.getNumero() %>" required>

        <label>Type :</label>
        <input type="text" name="type" value="<%= chambre.getType() %>" required>

        <label>Capacité :</label>
        <input type="number" name="capacite" value="<%= chambre.getCapacite() %>" required>

        <label>Prix :</label>
        <input type="text" name="prix" value="<%= chambre.getPrix() %>" required>

        <label>Statut :</label>
        <input type="text" name="statut" value="<%= chambre.getStatut() %>" required>

        <input type="submit" value="Mettre à jour">
    </form>
    <a href="liste_chambres.jsp" class="button">← Retour</a>
</div>
</body>
</html>
