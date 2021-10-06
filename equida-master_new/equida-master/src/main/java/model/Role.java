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
public class Role {
    
    private int code;
    private String nom;
    private ArrayList<Compte> lesComptes ;
    private ArrayList<Permission> lesPermissions ;

    public Role() {
    }

    public Role(int code, String nom, ArrayList<Compte> lesComptes, ArrayList<Permission> lesPermissions) {
        this.code = code;
        this.nom = nom;
        this.lesComptes = lesComptes;
        this.lesPermissions = lesPermissions;
    }

    public Role(String nom) {
        this.nom = nom;
    }
    
    

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public ArrayList<Compte> getLesComptes() {
        return lesComptes;
    }

    public void setLesComptes(ArrayList<Compte> lesComptes) {
        this.lesComptes = lesComptes;
    }

    public ArrayList<Permission> getLesPermissions() {
        return lesPermissions;
    }

    public void setLesPermissions(ArrayList<Permission> lesPermissions) {
        this.lesPermissions = lesPermissions;
    }
    
    public void addUnCompte(Compte unCompte){
        if (lesComptes == null){
            lesComptes = new ArrayList<Compte>();
        }
        lesComptes.add(unCompte);
    }
    
    public void addUnePermission(Permission unePermission){
        if (lesPermissions == null){
            lesPermissions = new ArrayList<Permission>();
        }
        lesPermissions.add(unePermission);
    }
     
    
}
