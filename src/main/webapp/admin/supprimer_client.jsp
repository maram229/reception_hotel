<%@ page import="com.example.gestionhotel.dao.ClientDAO" %>
<%
  int id = Integer.parseInt(request.getParameter("id"));
  ClientDAO dao = new ClientDAO();
  dao.deleteClient(id);
  response.sendRedirect("liste_clients.jsp");
%>
