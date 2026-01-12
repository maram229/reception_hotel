package com.example.gestionhotel.dao;

import com.example.gestionhotel.models.Reservation;
import com.example.gestionhotel.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReservationDAO {
    public void ajouterReservation(Reservation r) {
        String sql = "INSERT INTO reservation(client_id, chambre_id, date_debut, date_fin) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, r.getClientId());
            stmt.setInt(2, r.getChambreId());
            stmt.setDate(3, r.getDateDebut());
            stmt.setDate(4, r.getDateFin());
            stmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public List<Reservation> getAllReservations() {
        List<Reservation> reservations = new ArrayList<>();
        String sql = "SELECT * FROM reservation";

        ClientDAO clientDAO = new ClientDAO();
        ChambreDAO chambreDAO = new ChambreDAO();

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Reservation r = new Reservation();
                r.setId(rs.getInt("id"));
                int clientId = rs.getInt("client_id");
                int chambreId = rs.getInt("chambre_id");
                r.setClientId(clientId);
                r.setChambreId(chambreId);
                r.setDateDebut(rs.getDate("date_debut"));
                r.setDateFin(rs.getDate("date_fin"));

                r.setClient(clientDAO.getClientById(clientId));
                r.setChambre(chambreDAO.getChambreById(chambreId));

                reservations.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return reservations;
    }



}
