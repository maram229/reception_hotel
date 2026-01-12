<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession sessionUser = request.getSession(false);
    String nomUtilisateur = (sessionUser != null && sessionUser.getAttribute("username") != null)
            ? (String) sessionUser.getAttribute("username")
            : "Client";
%>
<html>
<head>
    <title>Contact - Gestion Hôtel</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: #f5f7fa;
            display: flex;
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

        h1, h2 {
            color: #1e293b;
            margin-bottom: 20px;
        }
        form button, form input[type="submit"] {
            margin-top: 20px;
            background-color: #3498db;
            color: white;
            padding: 10px 18px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }
        form button:hover, form input[type="submit"]:hover {
            background-color: #2980b9;
        }

        /* Actions sur tableau */
        .actions a {
            margin-right: 10px;
            text-decoration: none;
            color: #3498db;
        }

        .actions a:hover {
            text-decoration: underline;
        }

        .container {
            max-width: 700px;
            margin: auto;
            background-color: #ffffff;
            padding: 100px;
            border-radius: 12px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.08);
        }

        h2 {
            margin-bottom: 25px;
            color: #1e293b;
            text-align: center;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: 600;
        }

        .form-group {
            margin-bottom: 20px;
        }

        input, textarea {
            font-size: 15px;
            padding: 10px;
        }

        input:focus, textarea:focus {
            border: 1px solid #0ea5e9;
            outline: none;
        }


        button {
            margin-top: 25px;
            background-color: #0ea5e9;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
        }

        button:hover {
            background-color: #0284c7;
        }
    </style>
</head>
<body>
<div class="sidebar">
    <h2>Gestion Hotel</h2>
    <a href="dashboard.jsp"><i class="bi bi-house"></i> Accueil</a>
    <a href="liste_chambres.jsp"><i class="bi bi-door-closed"></i> Chambres disponibles</a>
    <a href="ajouterReservation.jsp"><i class="bi bi-calendar2-check"></i> Faire reservations</a>
    <a href="profil.jsp"><i class="bi bi-person-circle"></i> Mon profil</a>
    <a href="contact.jsp"><i class="bi bi-envelope"></i> Contact</a>
    <a href="../logout.jsp"><i class="bi bi-box-arrow-left"></i> Se deconnecter</a>
</div>
<div class="container">
    <h2>Nous contacter</h2>

    <form action="EnvoyerMessageServlet" method="post" novalidate>
        <div class="form-group">
            <label for="nom">Nom</label>
            <input type="text" id="nom" name="nom" value="<%= nomUtilisateur %>" required>

            <label for="email">Adresse Email</label>
            <input type="email" id="email" name="email" placeholder="exemple@email.com" required>

            <label for="sujet">Sujet</label>
            <input type="text" id="sujet" name="sujet" required>

            <label for="message">Message</label>
            <textarea id="message" name="message" required></textarea>
            <div class="form-group">
            <button type="submit">Envoyer le message</button>

        </div>
        </div>
    </form>

</div>

</body>
</html>
