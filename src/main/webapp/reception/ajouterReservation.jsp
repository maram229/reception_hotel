<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, com.example.gestionhotel.models.Chambre" %>
<%@ page import="com.example.gestionhotel.dao.ChambreDAO" %>
<html>
<head>
    <title>Ajouter une Réservation</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f4f7fa;
            margin: 0;
            padding: 40px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h2 {
            color: #2c3e50;
            margin-bottom: 30px;
        }

        form {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            width: 400px;
            justify-items: center;
        }

        fieldset {
            border: none;
            margin-bottom: 25px;
        }

        legend {
            font-weight: bold;
            color: #2980b9;
            margin-bottom: 10px;
            font-size: 1.1em;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #34495e;
        }

        input[type="text"],
        input[type="email"],
        input[type="date"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #27ae60;
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #219150;
        }
        .sidebar {
            width: 250px;
            height: 100vh;
            background-color: #1e293b;
            padding: 30px 20px;
            display: flex;
            flex-direction: column;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
        }

        .sidebar h2 {
            color: #fff;
            font-size: 22px;
            text-align: center;
            margin-bottom: 40px;
        }

        .sidebar a {
            text-decoration: none;
            color: #cbd5e1;
            padding: 12px 16px;
            margin-bottom: 10px;
            border-radius: 8px;
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .sidebar a:hover {
            background-color: #334155;
            color: #fff;
        }
        .main {
            max-width: 600px;
            margin: 50px auto;
            background-color: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
<div class="sidebar">
    <h2>Gestion Hôtel</h2>
    <a href="dashboard.jsp"><i class="bi bi-house"></i> Accueil</a>
    <a href="liste_chambres.jsp"><i class="bi bi-door-closed"></i> Chambres disponibles</a>
    <a href="ajouterReservation.jsp"><i class="bi bi-calendar2-check"></i> Faire réservations</a>
    <a href="profil.jsp"><i class="bi bi-person-circle"></i> Mon profil</a>
    <a href="contact.jsp"><i class="bi bi-envelope"></i> Contact</a>
    <a href="../logout.jsp"><i class="bi bi-box-arrow-left"></i> Se déconnecter</a>
</div>

<h2>Formulaire de Réservation</h2>

<form action="reserver" method="post">
    <fieldset>
        <legend>Informations du Client</legend>
        <label>Nom :</label>
        <input type="text" name="nom" required>

        <label>Prénom :</label>
        <input type="text" name="prenom" required>

        <label>Email :</label>
        <input type="email" name="email" required>

        <label>Téléphone :</label>
        <input type="text" name="tel" required>
    </fieldset>

    <fieldset>
        <legend>Réservation</legend>
        <label>Chambre :</label>
        <select name="chambreId" required>
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

        <label>Date de début :</label>
        <input type="date" name="dateDebut" required>

        <label>Date de fin :</label>
        <input type="date" name="dateFin" required>
    </fieldset>

    <input type="submit" value="Valider la réservation">


</form>
<li><a href="../accueil.jsp">Retour à l'accueil</a></li>
</body>
</html>
