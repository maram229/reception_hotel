<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession sessionUser = request.getSession(false);
    String nomUtilisateur = (sessionUser != null && sessionUser.getAttribute("username") != null)
            ? (String) sessionUser.getAttribute("username")
            : null;
%>
<html>
<head>
    <title>Accueil - Hôtel</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background-color: #1e293b;
            background-size: cover;
            color: white;
        }
        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            width: 230px;
            height: 100vh;
            background-color: rgba(30, 41, 59, 0.9);
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
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 40px;
            background: url('/images/conseils-pour-la-gestion-dun-hotel.jpg') no-repeat center center fixed;
            background-size: cover;
            backdrop-filter: blur(5px);
        }
        .main-content {
            max-width: 600px;
            padding: 40px;
            background-color: rgba(255, 255, 255, 0.15);
            border-radius: 16px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }
        .main-content h1 {
            font-size: 32px;
            margin-bottom: 20px;
            color: #fff;
        }
        .main-content p {
            font-size: 18px;
            color: #e2e8f0;
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
<div class="main">
    <div class="main-content">
        <h1>Bienvenue sur notre plateforme de réservation d’hôtel</h1>
        <% if (nomUtilisateur != null) { %>
        <p>Bonjour <strong><%= nomUtilisateur %></strong>, vous êtes connecté.</p>
        <% } else { %>
        <p>Connectez-vous pour gérer vos réservations et accéder à plus de services.</p>
        <% } %>
    </div>
</div>
</body>
</html>
