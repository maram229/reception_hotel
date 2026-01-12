package com.example.gestionhotel.dao;

import com.example.gestionhotel.models.Chambre;
import com.example.gestionhotel.utils.DBConnection;
import com.example.gestionhotel.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ChambreDAO {
    private static String numero;
    private static String statut;
    private static String type;
    private static double prix;
    private static int capacite;


    public static boolean ajouterChambre(Chambre chambre) {
        boolean success = false;
        try (Connection con = DBConnection.getConnection()) {
            String sql = "INSERT INTO chambre (numero, type, capacite, prix, statut) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, chambre.getNumero());
            ps.setString(2, chambre.getType());
            ps.setInt(3, chambre.getCapacite());
            ps.setDouble(4, chambre.getPrix());
            ps.setString(5, chambre.getStatut());

            int rows = ps.executeUpdate();
            success = rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }
    public Chambre getChambreById(int id) {
        Chambre chambre = null;
        String sql = "SELECT * FROM chambre WHERE id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                chambre = new Chambre();
                chambre.setId(rs.getInt("id"));
                chambre.setNumero(rs.getString("numero"));
                chambre.setType(rs.getString("type"));
                chambre.setCapacite(rs.getInt("capacite"));
                chambre.setPrix(rs.getDouble("prix"));
                chambre.setStatut(rs.getString("statut"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return chambre;
    }

    public static List<Chambre> getAllChambres() {
        List<Chambre> chambres = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM chambre";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Chambre chambre = new Chambre(numero, type, capacite, prix, statut);
                chambre.setId(rs.getInt("id"));
                chambre.setNumero(rs.getString("numero"));
                chambre.setType(rs.getString("type"));
                chambre.setCapacite(rs.getInt("capacite"));
                chambre.setPrix(rs.getDouble("prix"));
                chambre.setStatut(rs.getString("statut"));
                chambres.add(chambre);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return chambres;
    }

    public void modifierChambre(Chambre chambre) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "UPDATE chambres SET numero = ?, type = ?, capacite = ?, prix = ?, statut = ? WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, chambre.getNumero());
            ps.setString(2, chambre.getType());
            ps.setInt(3, chambre.getCapacite());
            ps.setDouble(4, chambre.getPrix());
            ps.setString(5, chambre.getStatut());
            ps.setInt(6, chambre.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void supprimerChambre(int id) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "DELETE FROM chambres WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
