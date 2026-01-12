<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Ajouter Chambre</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .main-content {
            background: #fff;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            width: 400px;
            text-align: center;
        }

        h2 {
            margin-bottom: 30px;
            color: #1e293b;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        label {
            text-align: left;
            font-weight: bold;
            color: #333;
        }

        input[type="text"],
        input[type="number"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        input[type="submit"] {
            margin-top: 10px;
            padding: 12px;
            background-color: #007BFF;
            border: none;
            color: white;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #6c757d;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #495057;
        }
    </style>
</head>
<body>
<div class="main-content">
    <h2>Ajouter une chambre</h2>

    <form action="AjouterChambreServlet" method="post" class="form-chambre">
        <label for="numero">Numéro :</label>
        <input type="text" id="numero" name="numero" required>

        <label for="type">Type :</label>
        <input type="text" id="type" name="type" required>

        <label for="capacite">Capacité :</label>
        <input type="number" id="capacite" name="capacite" required>

        <label for="prix">Prix :</label>
        <input type="text" id="prix" name="prix" required>

        <label for="statut">Statut :</label>
        <input type="text" id="statut" name="statut" required>

        <input type="submit" value="Ajouter">
    </form>

    <a href="dashboard.jsp" class="button">← Retour à l'accueil</a>
</div>
</body>
</html>
