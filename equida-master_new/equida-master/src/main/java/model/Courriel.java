/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author adminsio
 */
public class Courriel {
    
    private int id;
    private String date ;
    private String objet ;
    private String corps ;
    public Vente laVente ;
    private ArrayList<PieceJointe> lesPiecesJointes ;
    
    public Courriel(){
        
    }

    public Courriel(int id, String date, String objet, String corps) {
        this.id = id;
        this.date = date;
        this.objet = objet;
        this.corps = corps;
    }
    
    

    public int getId() {
        return id;
    }

    public String getDate() {
        return date;
    }

    public String getObjet() {
        return objet;
    }

    public String getCorps() {
        return corps;
    }

    public Vente getLaVente() {
        return laVente;
    }

    public ArrayList<PieceJointe> getLesPiecesJointes() {
        return lesPiecesJointes;
    }
    
    

    public void setId(int id) {
        this.id = id;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setObjet(String objet) {
        this.objet = objet;
    }

    public void setCorps(String corps) {
        this.corps = corps;
    }

    public void setLaVente(Vente laVente) {
        this.laVente = laVente;
    }

    public void setLesPiecesJointes(ArrayList<PieceJointe> lesPiecesJointes) {
        this.lesPiecesJointes = lesPiecesJointes;
    }
    
    public void addUnePieceJointe(PieceJointe pUnePieceJointe){
        if (lesPiecesJointes == null){
            lesPiecesJointes = new ArrayList<PieceJointe>();
        }
        lesPiecesJointes.add(pUnePieceJointe);
    }
    
    

    
    
    
}
