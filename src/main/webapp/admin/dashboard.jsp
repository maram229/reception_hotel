<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Accueil Admin - Hôtel</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-image: url('../images/téléchargement (4).jpeg');
            padding: 40px;
        }
        h1 {
            text-align: center;
            color: white;
            font-size: 36px;
            margin-bottom: 40px;
        }
        .card-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 30px;
            max-width: 1000px;
            margin: auto;
        }
        .card {
            background-color: #ffffff;
            padding: 30px 20px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s, box-shadow 0.3s;
            text-decoration: none;
            color: #1e293b;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            color: #0f172a;
        }
        .card i {
            font-size: 36px;
            color: #0ea5e9;
            margin-bottom: 15px;
        }
        .card span {
            display: block;
            font-size: 18px;
            font-weight: 600;
        }
    </style>
</head>
<body>

<h1>Bienvenue, Admin</h1>

<div class="card-container">
    <a href="dashboard.jsp" class="card">
        <i class="bi bi-house"></i>
        <span>Accueil</span>
    </a>
    <a href="ajouter_client.jsp" class="card">
        <i class="bi bi-person-plus"></i>
        <span>Ajouter un client</span>
    </a>
    <a href="liste_clients.jsp" class="card">
        <i class="bi bi-people"></i>
        <span>Liste des clients</span>
    </a>
    <a href="liste-reservations" class="card">
        <i class="bi bi-card-checklist"></i>
        <span>Réservations</span>
    </a>
    <a href="ajouter_chambre.jsp" class="card">
        <i class="bi bi-door-open"></i>
        <span>Ajouter une chambre</span>
    </a>
    <a href="liste_chambres.jsp" class="card">
        <i class="bi bi-building"></i>
        <span>Chambres</span>
    </a>
    <a href="../logout.jsp" class="card">
        <i class="bi bi-box-arrow-right"></i>
        <span>Déconnexion</span>
    </a>
</div>

</body>
</html>
