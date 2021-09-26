/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author loanb
 */
public class Lot {
    
    private int id;
    private int prix;
    private Vente laVente ;
    private Cheval leCheval ;

    public Lot() {
    }

    public Lot(int id, int prix) {
        this.id = id;
        this.prix = prix;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getPrix() {
        return prix;
    }

    public void setPrix(int prix) {
        this.prix = prix;
    }

    public Vente getLaVente() {
        return laVente;
    }

    public void setLaVente(Vente laVente) {
        this.laVente = laVente;
    }

    public Cheval getLeCheval() {
        return leCheval;
    }

    public void setLeCheval(Cheval leCheval) {
        this.leCheval = leCheval;
    }
    
    
}
