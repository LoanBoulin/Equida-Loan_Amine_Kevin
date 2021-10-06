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
public class Compte {
    
    private int id;
    private Client leClient;
    private String login;
    private String mdp;
    private Role leRole ;
    

    public Compte() {
    }

    public Compte(int id, Client leClient, String login, String mdp) {
        this.id = id;
        this.leClient = leClient;
        this.login = login;
        this.mdp = mdp;
    }

    public Compte(int id, String login, String mdp) {
        this.id = id;
        this.login = login;
        this.mdp = mdp;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Client getLeClient() {
        return leClient;
    }

    public void setLeClient(Client leClient) {
        this.leClient = leClient;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getMdp() {
        return mdp;
    }

    public void setMdp(String mdp) {
        this.mdp = mdp;
    }

    public Role getLeRole() {
        return leRole;
    }

    public void setLeRole(Role leRole) {
        this.leRole = leRole;
    }
    
    
    
    
    
}
