package com.example.gestionhotel.controllers;

import com.example.gestionhotel.dao.ChambreDAO;
import com.example.gestionhotel.models.Chambre;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/AjouterChambreServlet")
public class AjouterChambreServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String numero = request.getParameter("numero");
            String type = request.getParameter("type");

            String capaciteStr = request.getParameter("capacite");
            int capacite = (capaciteStr != null && !capaciteStr.isEmpty()) ? Integer.parseInt(capaciteStr) : 0;

            String prixStr = request.getParameter("prix").replace(",", ".");
            double prix = (prixStr != null && !prixStr.isEmpty()) ? Double.parseDouble(prixStr) : 0.0;

            String statut = request.getParameter("statut");


            Chambre chambre = new Chambre(numero,type,capacite,prix,statut) ;

            boolean ajoutReussi = ChambreDAO.ajouterChambre(chambre);

            if (ajoutReussi) {
                request.setAttribute("message", "Chambre ajoutée avec succès !");
            } else {
                request.setAttribute("erreur", "Échec de l'ajout de la chambre.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("erreur", "Erreur lors de l'ajout : " + e.getMessage());
        }

        request.getRequestDispatcher("ajouter_chambre.jsp").forward(request, response);
    }
}