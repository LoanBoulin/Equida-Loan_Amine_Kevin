/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author adminsio
 */
public class Enchere {
    
    private int id;
    private Lot leLot;
    private Vente laVente;
    private Client leClient;
    private float montant;

    public Enchere() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Lot getLeLot() {
        return leLot;
    }

    public void setLeLot(Lot leLot) {
        this.leLot = leLot;
    }

    public Vente getLaVente() {
        return laVente;
    }

    public void setLaVente(Vente laVente) {
        this.laVente = laVente;
    }

    public Client getLeClient() {
        return leClient;
    }

    public void setLeClient(Client leClient) {
        this.leClient = leClient;
    }

    public float getMontant() {
        return montant;
    }

    public void setMontant(float montant) {
        this.montant = montant;
    }
    
    
    
}
