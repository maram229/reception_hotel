<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contact - Gestion Hôtel</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f5f7fa;
            display: flex;
        }
        .container {
            max-width: 700px;
            margin: auto;
            background-color: #ffffff;
            padding: 80px 60px;
            border-radius: 12px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.08);
            text-align: center;
        }

        h2 {
            color: white;
            margin-bottom: 25px;
        }

        .social-icons {
            display: flex;
            justify-content: center;
            gap: 30px;
            margin-top: 40px;
        }

        .social-icons a {
            text-decoration: none;
            color: #1e293b;
            font-size: 36px;
            transition: transform 0.3s, color 0.3s;
        }

        .social-icons a:hover {
            color: #0284c7;
            transform: scale(1.2);
        }

        .social-labels {
            margin-top: 10px;
            font-size: 14px;
            color: #6b7280;
        }
    </style>
</head>
<body>
<%@ include file="sidebar.jspf" %>
<div class="container">
    <h2 style="color: #1e293b;">Suivez-nous sur les réseaux sociaux</h2>
    <p style="color: #1e293b;">Contactez notre hôtel via nos réseaux sociaux pour toute question ou demande.</p>
    <div class="social-icons">
        <a href="https://www.facebook.com" target="_blank" title="Facebook"><i class="bi bi-facebook"></i></a>
        <a href="https://www.instagram.com" target="_blank" title="Instagram"><i class="bi bi-instagram"></i></a>
        <a href="https://wa.me/21690000000" target="_blank" title="WhatsApp"><i class="bi bi-whatsapp"></i></a>
        <a href="mailto:hotel@example.com" title="Email"><i class="bi bi-envelope-fill"></i></a>
    </div>

    <div class="social-labels">
        <p>Facebook | Instagram | WhatsApp | Email</p>
    </div>
</div>
</body>
</html>
