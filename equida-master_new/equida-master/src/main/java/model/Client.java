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
public class Client {
    
   private int id;
   private String nom ;
   private String prenom ;
   private String titre;
   private String adrRue;
   private String codePostal;
   private String ville;
   private String adresseMessagerie;
   private Pays LePays ;
   private ArrayList<CategVente> lesCategVente ;

    public Client() {
    }

    public int getId() {
        return id;
    }

    public String getNom() {
        return nom;
    }  

    public String getPrenom() {
        return prenom;
    }
    
    public ArrayList<CategVente> getLesCategVente() {
        return lesCategVente;
    }
    
    public Pays getLePays() {
        return LePays;
    }

    public String getTitre() {
        return titre;
    }

    public String getAdrRue() {
        return adrRue;
    }

    public String getCodePostal() {
        return codePostal;
    }

    public String getVille() {
        return ville;
    }

    public String getAdresseMessagerie() {
        return adresseMessagerie;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public void setNom(String nom) {
        this.nom = nom;
    }
    
    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public void setAdrRue(String adrRue) {
        this.adrRue = adrRue;
    }

    public void setCodePostal(String codePostal) {
        this.codePostal = codePostal;
    }

    public void setVille(String ville) {
        this.ville = ville;
    }

    public void setAdresseMessagerie(String adresseMessagerie) {
        this.adresseMessagerie = adresseMessagerie;
    }

    public void setLesCategVente(ArrayList<CategVente> lesCategVente) {
        this.lesCategVente = lesCategVente;
    }
    
    public void setLePays(Pays Pays) {
        this.LePays = Pays;
    } 

    public void setLesCategVentes(ArrayList<CategVente> lesCategVentes) {
        this.lesCategVente = lesCategVentes;
    }
    
    public void addUneCategVente(CategVente CategVente){
        if (lesCategVente == null){
            lesCategVente = new ArrayList<CategVente>();
        }
        lesCategVente.add(CategVente);
    }
    
} 
