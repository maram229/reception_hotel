package com.example.gestionhotel.dao;

import com.example.gestionhotel.models.Client;
import com.example.gestionhotel.utils.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ClientDAO {
    public int ajouterClient(Client client) {
        String sql = "INSERT INTO client(nom, prenom, email, tel) VALUES (?, ?, ?, ?)";
        int id = -1;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, client.getNom());
            stmt.setString(2, client.getPrenom());
            stmt.setString(3, client.getEmail());
            stmt.setString(4, client.getTel());

            int affectedRows = stmt.executeUpdate();

            if (affectedRows > 0) {
                ResultSet rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    id = rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id;
    }
    public List<Client> getAllClients() throws SQLException {
        List<Client> list = new ArrayList<>();
        String sql = "SELECT * FROM client";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Client c = new Client();
                c.setId(rs.getInt("id"));
                c.setNom(rs.getString("nom"));
                c.setPrenom(rs.getString("prenom"));
                c.setEmail(rs.getString("email"));
                c.setTel(rs.getString("tel")); // colonne correcte
                list.add(c);
            }
        }

        return list;
    }

    public Client getClientById(int id) throws SQLException {
        String sql = "SELECT * FROM client WHERE id=?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Client c = new Client();
                    c.setId(rs.getInt("id"));
                    c.setNom(rs.getString("nom"));
                    c.setPrenom(rs.getString("prenom"));
                    c.setEmail(rs.getString("email"));
                    c.setTel(rs.getString("tel"));
                    return c;
                }
            }
        }

        return null;
    }

    public void updateClient(Client c) throws SQLException {
        String sql = "UPDATE client SET nom=?, prenom=?, email=?, tel=? WHERE id=?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, c.getNom());
            stmt.setString(2, c.getPrenom());
            stmt.setString(3, c.getEmail());
            stmt.setString(4, c.getTel());
            stmt.setInt(5, c.getId());

            stmt.executeUpdate();
        }
    }

    public void deleteClient(int id) throws SQLException {
        String sql = "DELETE FROM client WHERE id=?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }
}

