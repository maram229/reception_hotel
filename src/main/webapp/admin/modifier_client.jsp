<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.gestionhotel.dao.ClientDAO, com.example.gestionhotel.models.Client" %>
<%
  ClientDAO dao = new ClientDAO();
  int id = Integer.parseInt(request.getParameter("id"));
  Client client = dao.getClientById(id);

  if ("POST".equalsIgnoreCase(request.getMethod())) {
    client.setNom(request.getParameter("nom"));
    client.setPrenom(request.getParameter("prenom"));
    client.setEmail(request.getParameter("email"));
    client.setTel(request.getParameter("tel"));
    dao.updateClient(client);
    response.sendRedirect("liste_clients.jsp");
  }
%>
<html>
<head>
  <title>Modifier un client</title>
  <link rel="stylesheet" href="css/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
<%@ include file="includes/sidebar.jspf" %>
<div class="main-content">
<h2>Modifier un client</h2>

<form method="post">
  <label>Nom :</label>
  <input type="text" name="nom" value="<%= client.getNom() %>" required>

  <label>Prénom :</label>
  <input type="text" name="prenom" value="<%= client.getPrenom() %>" required>

  <label>Email :</label>
  <input type="email" name="email" value="<%= client.getEmail() %>" required>

  <label>Téléphone :</label>
  <input type="text" name="tel" value="<%= client.getTel() %>" required>

  <input type="submit" value="Modifier">
</form>
<a href="liste_clients.jsp" class="button">← Retour à la liste</a>
</div>
</body>
</html>
