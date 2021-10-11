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
public class Vendeur extends Client {
    
    private int id ;
    private int CA;

    public Vendeur() {
        super();
    }

    public Vendeur(int id, int CA) {
        this.id = id;
        this.CA = CA;
    }

    public int getId() {
        return id;
    }

    public int getCA() {
        return CA;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setCA(int CA) {
        this.CA = CA;
    }
    
}
