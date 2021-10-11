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
public class Acheteur extends Client{
    
    private int id ;
    private String formation;

    public Acheteur() {
        super();
    }
    
    public Acheteur(int id, String formation) {
        this.id = id;
        this.formation = formation;
    }

    public int getId() {
        return id;
    }

    public String getFormation() {
        return formation;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setFormation(String formation) {
        this.formation = formation;
    }
    
     
    
}
      



    
    
    



