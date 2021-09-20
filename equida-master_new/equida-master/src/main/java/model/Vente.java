/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author Zakina
 */
public class Vente {
    
    private int id;
    private String nom ;
    private String dateDebutVente ;
    private CategVente CategVente ;
    private ArrayList<Courriel> lesCourriels ;
    private Lieu leLieu ;

    public Vente() {
    }

    public Vente(int id, String nom, String dateDebutVente) {
        this.id = id;
        this.nom = nom;
        this.dateDebutVente = dateDebutVente;
    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getDateDebutVente() {
        return dateDebutVente;
    }

    public void setDateDebutVente(String dateDebutVente) {
        this.dateDebutVente = dateDebutVente;
    }

    public CategVente getCategVente() {
        return CategVente;
    }

    public void setCategVente(CategVente CategVente) {
        this.CategVente = CategVente;
    }

    public ArrayList<Courriel> getLesCourriels() {
        return lesCourriels;
    }

    public void setLesCourriels(ArrayList<Courriel> lesCourriels) {
        this.lesCourriels = lesCourriels;
    }
    
    public void addUnCourriel(Courriel pUnCourriel){
        if (lesCourriels == null){
            lesCourriels = new ArrayList<Courriel>();
        }
        lesCourriels.add(pUnCourriel);
    }

    public Lieu getLeLieu() {
        return leLieu;
    }

    public void setLeLieu(Lieu leLieu) {
        this.leLieu = leLieu;
    }
    
    
    
   
    
    
}
