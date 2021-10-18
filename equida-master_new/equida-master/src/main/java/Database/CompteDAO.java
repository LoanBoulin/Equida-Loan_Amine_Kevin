/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import static Database.ClientDAO.requete;
import static Database.ClientDAO.rs;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Client;
import model.Compte;
import model.Pays;
import model.Role;

/**
 *
 * @author adminsio
 */
public class CompteDAO {
    
    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    
    public static Compte ajouterCompteClient(Connection connection, Client unClient, Compte unCompte){      
        int idGenere1 = -1;
        int idGenere2 = -1;
        try
        {
            //preparation de la requete
            // id (clé primaire de la table client) est en auto_increment,donc on ne renseigne pas cette valeur
            // la paramètre RETURN_GENERATED_KEYS est ajouté à la requête afin de pouvoir récupérer l'id généré par la bdd (voir ci-dessous)
            // supprimer ce paramètre en cas de requête sans auto_increment.
            requete=connection.prepareStatement("INSERT INTO CLIENT ( cli_nom, cli_prenom, cli_titre, cli_rue, cli_copos, cli_ville, cli_adressemessagerie, code)\n" +
                    "VALUES (?,?,?,?,?,?,?,?)", requete.RETURN_GENERATED_KEYS );
            requete.setString(1, unClient.getNom());
            requete.setString(2, unClient.getPrenom());
            requete.setString(3, unClient.getTitre());
            requete.setString(4, unClient.getAdrRue());      
            requete.setString(5, unClient.getCodePostal());
            requete.setString(6, unClient.getVille());
            requete.setString(7, unClient.getAdresseMessagerie());
            requete.setString(8, unClient.getLePays().getCode());
            requete.executeUpdate();
            
             // Récupération de id auto-généré par la bdd dans la table client
            rs = requete.getGeneratedKeys();
            while ( rs.next() ) {
                idGenere1 = rs.getInt( 1 );
                unClient.setId(idGenere1);
            }
            
            // ajout du compte
            PreparedStatement requete2=connection.prepareStatement("INSERT INTO COMPTE (CLI_ID, COM_LOGIN, COM_MDP, ROL_ID)\n" +
                    "VALUES (?, ?, ?, NULL)");
            requete2.setInt(1, unClient.getId());
            requete2.setString(2, unCompte.getLogin());
            requete2.setString(3, unCompte.getMdp());                
            requete2.executeUpdate();
            
            // Récupération de id auto-généré par la bdd dans la table client
            rs = requete.getGeneratedKeys();
            while ( rs.next() ) {
                idGenere2 = rs.getInt( 1 );
                unCompte.setId(idGenere2);
            }
            
            
            
           
            
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return unCompte ;    
    }
    
    
    public static Compte ajouterComptePro(Connection connection, Compte unCompte){      
        try
        {        
            
            System.out.println(unCompte.getLeRole());
            
            // ajout du compte
            requete=connection.prepareStatement("INSERT INTO COMPTE (COM_LOGIN, COM_MDP, CLI_ID, ROL_ID)\n" +
                    "VALUES (?, ?, NULL, ?)");
            requete.setString(1, unCompte.getLogin());
            requete.setString(2, unCompte.getMdp());    
            requete.setInt(3, unCompte.getLeRole().getCode());               
            requete.executeUpdate();
            
           
            
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return unCompte ;    
    }
    
    
    
    
    
    
     public static Compte verifCompte(Connection connection, Compte unCompte){
        
        Compte leCompte = null;
         
        int idGenere = -1;
        try
        {        
            System.out.println("SELECT LANCER");
            // ajout du compte
            requete=connection.prepareStatement("SELECT * FROM COMPTE LEFT JOIN CLIENT ON COMPTE.CLI_ID = CLIENT.CLI_ID INNER JOIN PAYS LEFT JOIN ROLE ON ROL_ID = ROL_CODE WHERE COM_LOGIN = ? AND COM_MDP = ? ");
            requete.setString(1, unCompte.getLogin());
            requete.setString(2, unCompte.getMdp());                
            rs=requete.executeQuery();
           
            // Récupération de id auto-généré par la bdd dans la table client
            while ( rs.next() ) {    
                
                leCompte = new Compte();
                
                leCompte.setId(rs.getInt("COMPTE.COM_ID"));
                leCompte.setLogin(rs.getString("COMPTE.COM_LOGIN"));
                leCompte.setMdp(rs.getString("COMPTE.COM_MDP"));
                
                if(rs.getObject("COMPTE.ROL_ID") == null){
                    
                    System.out.println("CLIENT");
                    
                    Client unClient = new Client();
                    unClient.setId(rs.getInt("cli_id"));
                    unClient.setNom(rs.getString("cli_nom"));
                    unClient.setPrenom(rs.getString("cli_prenom"));
                    unClient.setTitre(rs.getString("cli_titre"));
                    unClient.setVille(rs.getString("cli_ville"));
                    unClient.setAdrRue(rs.getString("cli_rue"));
                    unClient.setCodePostal(rs.getString("cli_copos"));
                    unClient.setAdresseMessagerie(rs.getString("cli_adresseMessagerie"));
                              
                    Pays p = new Pays();
                    p.setCode(rs.getString("PAYS.CODE"));
                    p.setNom(rs.getString("PAYS.NOM"));

                    unClient.setLePays(p);
                    
                    leCompte.setLeClient(unClient);
                    
                }else if(rs.getObject("COMPTE.CLI_ID") == null){
                    
                    System.out.println("ROLE");
                    
                    Role unRole = new Role();
                    unRole.setCode(rs.getInt("ROL_CODE"));
                    unRole.setNom(rs.getString("ROL_NOM"));
                    
                    leCompte.setLeRole(unRole);
                    
                }
                
              
                
            }
            
                             
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            System.out.println("Erreur lors de l’établissement de la connexion");
            return leCompte;
        }
        return leCompte ;    
    }
     
     
     public static Compte getCompte(Connection connection, String compteId){       
         
         Compte leCompte = new Compte();
         
        int idGenere = -1;
        try
        {        
            // ajout du compte
            requete=connection.prepareStatement("SELECT * FROM COMPTE LEFT JOIN CLIENT ON COMPTE.CLI_ID = CLIENT.CLI_ID INNER JOIN PAYS LEFT JOIN ROLE ON ROL_ID = ROL_CODE WHERE COMPTE.COM_ID = ? ");
            requete.setInt(1, Integer.parseInt(compteId) );        
            rs=requete.executeQuery();
           
            // Récupération de id auto-généré par la bdd dans la table client
            while ( rs.next() ) {    
                       
                
                leCompte.setId(rs.getInt("COMPTE.COM_ID"));
                leCompte.setLogin(rs.getString("COMPTE.COM_LOGIN"));
                
                if(rs.getObject("COMPTE.ROL_ID") == null){
                    
                    System.out.println("CLIENT");
                    
                    Client unClient = new Client();
                    unClient.setId(rs.getInt("cli_id"));
                    unClient.setNom(rs.getString("cli_nom"));
                    unClient.setPrenom(rs.getString("cli_prenom"));
                    unClient.setTitre(rs.getString("cli_titre"));
                    unClient.setVille(rs.getString("cli_ville"));
                    unClient.setAdrRue(rs.getString("cli_rue"));
                    unClient.setCodePostal(rs.getString("cli_copos"));
                    unClient.setAdresseMessagerie(rs.getString("cli_adresseMessagerie"));
                              
                    Pays p = new Pays();
                    p.setCode(rs.getString("PAYS.CODE"));
                    p.setNom(rs.getString("PAYS.NOM"));

                    unClient.setLePays(p);
                    
                    leCompte.setLeClient(unClient);
                    
                }else if(rs.getObject("COMPTE.CLI_ID") == null){
                    
                    System.out.println("ROLE");
                    
                    Role unRole = new Role();
                    unRole.setCode(rs.getInt("ROL_CODE"));
                    unRole.setNom(rs.getString("ROL_NOM"));
                    
                    leCompte.setLeRole(unRole);
                    
                }
                                      
            }
            
                             
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            System.out.println("Erreur lors de l’établissement de la connexion");
            return leCompte;
        }
        return leCompte ;    
    }
    
}
