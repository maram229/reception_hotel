package com.example.gestionhotel.controllers;

import com.example.gestionhotel.dao.ClientDAO;
import com.example.gestionhotel.dao.ReservationDAO;
import com.example.gestionhotel.models.Client;
import com.example.gestionhotel.models.Reservation;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Date;

@WebServlet("/reservation")
public class ReservationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        Client client = new Client();
        client.setNom(request.getParameter("nom"));
        client.setPrenom(request.getParameter("prenom"));
        client.setEmail(request.getParameter("email"));
        client.setTel(request.getParameter("tel"));

        ClientDAO clientDAO = new ClientDAO();
        int clientId = clientDAO.ajouterClient(client);

        if (clientId > 0) {
            Reservation reservation = new Reservation();
            reservation.setClientId(clientId);
            reservation.setChambreId(Integer.parseInt(request.getParameter("chambreId")));
            reservation.setDateDebut(Date.valueOf(request.getParameter("dateDebut")));
            reservation.setDateFin(Date.valueOf(request.getParameter("dateFin")));

            ReservationDAO reservationDAO = new ReservationDAO();
            reservationDAO.ajouterReservation(reservation);

            response.sendRedirect("confirmation.jsp");
        } else {
            response.getWriter().println("Erreur lors de l'enregistrement du client.");
        }
    }
}
