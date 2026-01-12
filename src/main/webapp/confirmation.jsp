<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>Confirmation de Réservation</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f3f4f6;
      color: #333;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .container {
      background-color: #fff;
      padding: 40px;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
      text-align: center;
      max-width: 500px;
    }

    h2 {
      color: #2c3e50;
      margin-bottom: 20px;
    }

    p {
      font-size: 18px;
      margin-bottom: 30px;
    }

    a {
      display: inline-block;
      padding: 10px 20px;
      background-color: #3498db;
      color: #fff;
      text-decoration: none;
      border-radius: 5px;
      transition: background-color 0.3s ease;
    }
    a:hover {
      background-color: #2980b9;
    }
  </style>
</head>
<body>

<div class="container">
  <h2>Votre réservation a été effectuée avec succès !</h2>
  <p>Merci pour votre confiance. Nous vous contacterons bientôt.</p>
  <a href="index.jsp">Retourner à l'accueil</a>
</div>

</body>
</html>
