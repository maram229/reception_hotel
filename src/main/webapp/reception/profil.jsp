<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  HttpSession sessionUser = request.getSession(false);
  String nomUtilisateur = (sessionUser != null && sessionUser.getAttribute("username") != null)
          ? (String) sessionUser.getAttribute("username")
          : "Client";
%>
<html>
<head>
  <title>Mon Profil - Gestion Hôtel</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    body {
      font-family: 'Inter', sans-serif;
      margin: 0;
      background-color: #f9fafb;
    }

    .main {
      max-width: 600px;
      margin: 50px auto;
      background-color: white;
      padding: 40px;
      border-radius: 12px;
      box-shadow: 0 8px 16px rgba(0,0,0,0.1);
    }

    h2 {
      color: #1e293b;
      margin-bottom: 25px;
    }

    label {
      display: block;
      margin-top: 15px;
      font-weight: 600;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"] {
      width: 100%;
      padding: 10px;
      margin-top: 5px;
      border: 1px solid #cbd5e1;
      border-radius: 8px;
    }

    button {
      margin-top: 25px;
      background-color: #0ea5e9;
      color: white;
      padding: 12px 20px;
      border: none;
      border-radius: 8px;
      font-size: 16px;
      cursor: pointer;
      font-weight: 600;
    }

    button:hover {
      background-color: #0284c7;
    }

    .user-info {
      margin-top: 30px;
      background-color: #f1f5f9;
      padding: 15px;
      border-radius: 8px;
    }
    /* Sidebar */
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
    .container {
      display: flex;
      min-height: 100vh;
    }

  </style>
</head>
<body>
<div class="container">
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
    <h2>Mon Profil</h2>
    <div class="user-info">
      Connecté en tant que : <strong><%= nomUtilisateur %></strong>
    </div>
    <form action="ModifierProfilServlet" method="post">
      <label for="nom">Nom complet</label>
      <input type="text" id="nom" name="nom" value="<%= nomUtilisateur %>" required>

      <label for="email">Email</label>
      <input type="email" id="email" name="email" value="client@email.com" required>

      <label for="password">Nouveau mot de passe</label>
      <input type="password" id="password" name="password" placeholder="Laisser vide si inchangé">

      <button type="submit">Mettre à jour</button>
    </form>
  </div>
</div>
</body>

</html>
