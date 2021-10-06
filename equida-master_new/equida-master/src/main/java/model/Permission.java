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
public class Permission {
    
    private int code;
    private String nom;
    private ArrayList<Role> lesRole ;

    public Permission() {
    }

    public Permission(int code, String nom, ArrayList<Role> lesRole) {
        this.code = code;
        this.nom = nom;
        this.lesRole = lesRole;
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

    public ArrayList<Role> getLesRole() {
        return lesRole;
    }

    public void setLesRole(ArrayList<Role> lesRole) {
        this.lesRole = lesRole;
    }
    
    public void addUnRole(Role unRole){
        if (lesRole == null){
            lesRole = new ArrayList<Role>();
        }
        lesRole.add(unRole);
    }
    
    
    
   
}
