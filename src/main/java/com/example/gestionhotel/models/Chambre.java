package com.example.gestionhotel.models;

public class Chambre {
    private int id;
    private String numero;
    private String type;
    private int capacite;
    private double prix;
    private String statut;


    public Chambre() {}

    public Chambre(String numero, String type, int capacite, double prix, String statut) {
        this.numero = numero;
        this.type = type;
        this.capacite = capacite;
        this.prix = prix;
        this.statut = statut;

    }


    public Chambre(int id, String numero, String type, int capacite, double prix, String statut ) {
        this.id = id;
        this.numero = numero;
        this.type = type;
        this.capacite = capacite;
        this.prix = prix;
        this.statut = statut;

    }


    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNumero() { return numero; }
    public void setNumero(String numero) { this.numero = numero; }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }

    public int getCapacite() { return capacite; }
    public void setCapacite(int capacite) { this.capacite = capacite; }

    public double getPrix() { return prix; }
    public void setPrix(double prix) { this.prix = prix; }

    public String getStatut() { return statut; }
    public void setStatut(String statut) { this.statut = statut;
    }

}
