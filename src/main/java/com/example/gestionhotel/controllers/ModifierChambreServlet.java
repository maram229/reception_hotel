package com.example.gestionhotel.controllers;


import com.example.gestionhotel.dao.ChambreDAO;
import com.example.gestionhotel.models.Chambre;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/modifier-chambre")

public class ModifierChambreServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String numero = request.getParameter("numero");
        String type = request.getParameter("type");
        int capacite = Integer.parseInt(request.getParameter("capacite"));
        double prix = Double.parseDouble(request.getParameter("prix"));
        String statut = request.getParameter("statut");

        Chambre chambre = new Chambre(id, numero, type, capacite, prix, statut);
        ChambreDAO dao = new ChambreDAO();
        dao.modifierChambre(chambre);

        response.sendRedirect("/admin/liste_chambres.jsp");
    }
}

