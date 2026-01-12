package com.example.gestionhotel.controllers;

import com.example.gestionhotel.dao.ChambreDAO;
import com.example.gestionhotel.models.Chambre;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;

import java.io.IOException;
import java.util.List;

@WebServlet("/chambre")
public class ChambreServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ChambreDAO dao = new ChambreDAO();
        List<Chambre> chambres = dao.getAllChambres();
        request.setAttribute("chambres", chambres);
        request.getRequestDispatcher("chambres.jsp").forward(request, response);
    }
}