/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author loanb
 */
public class TypeCheval {
    
    private int id;
    private String libelle ;
    private String description ;
    private ArrayList<Cheval> lesChevaux ;

    public TypeCheval() {
    }

    public TypeCheval(int id, String libelle, String description) {
        this.id = id;
        this.libelle = libelle;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public String getLibelle() {
        return libelle;
    }

    public String getDescription() {
        return description;
    }

    public ArrayList<Cheval> getLesChevaux() {
        return lesChevaux;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setLesChevaux(ArrayList<Cheval> lesChevaux) {
        this.lesChevaux = lesChevaux;
    }
    
    public void addUnCheval(Cheval pUnCheval){
        if (lesChevaux == null){
            lesChevaux = new ArrayList<Cheval>();
        }
        lesChevaux.add(pUnCheval);
    }   
    
}
