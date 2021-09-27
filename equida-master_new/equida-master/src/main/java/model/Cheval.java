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
public class Cheval {
    
    private int id;
    private String nom ;
    private String sexe ;
    private String sire ; 
    private String dateNaissance ;
    private String nomImage ;
    private ArrayList<Lot> lesLots ;
    private TypeCheval leType ;
    private Cheval lePere;
    private Cheval laMere;

    public Cheval() {
        
    }

    public Cheval(int id, String nom, String sexe, String sire, String dateNaissance, String nomImage) {
        this.id = id;
        this.nom = nom;
        this.sexe = sexe;
        this.sire = sire;
        this.dateNaissance = dateNaissance;
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

    public String getSexe() {
        return sexe;
    }

    public void setSexe(String sexe) {
        this.sexe = sexe;
    }

    public String getSire() {
        return sire;
    }

    public void setSire(String sire) {
        this.sire = sire;
    }

    public String getDateNaissance() {
        return dateNaissance;
    }

    public void setDateNaissance(String dateNaissance) {
        this.dateNaissance = dateNaissance;
    }

    public TypeCheval getLeType() {
        return leType;
    }

    public void setLeType(TypeCheval leType) {
        this.leType = leType;
    }

    public ArrayList<Lot> getLesLots() {
        return lesLots;
    }

    public void setLesLots(ArrayList<Lot> lesLots) {
        this.lesLots = lesLots;
    }
    
    public void addUnLot(Lot pUnLot){
        if (lesLots == null){
            lesLots = new ArrayList<Lot>();
        }
        lesLots.add(pUnLot);
    }   

    public String getNomImage() {
        return nomImage;
    }

    public void setNomImage(String nomImage) {
        this.nomImage = nomImage;
    }

    public Cheval getLePere() {
        return lePere;
    }

    public void setLePere(Cheval lePere) {
        this.lePere = lePere;
    }

    public Cheval getLaMere() {
        return laMere;
    }

    public void setLaMere(Cheval laMere) {
        this.laMere = laMere;
    }
    
    
    
    
}
