<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.gestionhotel.dao.ChambreDAO" %>
<%
  int id = Integer.parseInt(request.getParameter("id"));
  ChambreDAO dao = new ChambreDAO();
  dao.supprimerChambre(id);
  response.sendRedirect("liste_chambres.jsp");
%>
