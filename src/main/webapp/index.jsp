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
  <link rel="stylesheet" href="css/style.css">
  <style>
    .login-link {
      position: absolute;
      top: 15px;
      right: 30px;
      font-size: 16px;
      color: #fff;
      text-decoration: none;
      z-index: 1000;
    }

    .login-link i {
      margin-right: 5px;
    }
  </style>
</head>
<body>
<a href="login.jsp" class="login-link"><i class="bi bi-box-arrow-in-right"></i> Connexion</a>
<%@ include file="sidebar.jspf" %>
<div class="main">
  <div class="main-content">
    <h1>Bienvenue sur notre plateforme de réservation d’hôtel</h1>
    <% if (nomUtilisateur != null) { %>
    <p>Connectez-vous pour gérer vos réservations et accéder à plus de services.</p>
    <% } %>
  </div>
</div>
</body>
</html>
