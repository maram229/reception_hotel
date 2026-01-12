package com.example.gestionhotel.controllers;

import com.example.gestionhotel.dao.ReservationDAO;
import com.example.gestionhotel.models.Reservation;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/liste-reservations")
public class ListeReservationsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ReservationDAO reservationDAO = new ReservationDAO();
        List<Reservation> reservations = reservationDAO.getAllReservations();

        request.setAttribute("reservations", reservations);
        request.getRequestDispatcher("/admin/liste_reservations.jsp").forward(request, response);
    }
}

