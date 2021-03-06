/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Client;
import model.Pays;

/**
 *
 * @author Zakina
 */
public class ClientDAO {
    
    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    
    /* @author Zakina - 25/08/2021
    /* Méthode permettant de lister les clients interessés par la catégorie de la vente selectionnée (passée en paramètre de la méthode)
    /* Pour chaque client, on récupère aussi le nom de son pays
    /* La liste des clients est stockée dans une ArrayList
    */
    public static ArrayList<Client>  getLesClients(Connection connection, String codeCateg){      
        ArrayList<Client> lesClients = new  ArrayList<Client>();
        try
        {
            //preparation de la requete     
            //codeCateg="ETE";
            requete=connection.prepareStatement("SELECT c.*, cv.cat_libelle, p.nom as nomPays, p.code as codePays FROM categvente cv, client c, ach_cat ac, acheteur a, pays p where cv.cat_code = ? and cv.CAT_CODE = ac.CAT_CODE and ac.CLI_ID = a.CLI_ID and a.CLI_ID = c.CLI_ID and c.CODE = p.CODE ");
            requete.setString(1, codeCateg);
            //executer la requete
            rs=requete.executeQuery();
             
            //On hydrate l'objet métier Client avec les résultats de la requête
            while ( rs.next() ) {  
                
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
                p.setCode(rs.getString("codePays"));
                p.setNom(rs.getString("nomPays"));
                
                unClient.setLePays(p);
                /*CategVente uneCateg = new CategVente();
                uneCateg.setCode(rs.getString("code"));  // on aurait aussi pu prendre CodeCateg
                uneCateg.setLibelle(rs.getString("libelle"));*/
                
                lesClients.add(unClient);
            }
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesClients ;    
    } 
    
     public static Client getUnClient(Connection connection, String codeCli){      
        Client unClient = new Client();
        try
        {
            //preparation de la requete     
            //codeCateg="ETE";
            requete=connection.prepareStatement("SELECT c.*, cv.cat_libelle, p.nom as nomPays, p.code as codePays FROM categvente cv, client c, ach_cat ac, acheteur a, pays p where cv.CAT_CODE = ac.CAT_CODE and ac.CLI_ID = a.CLI_ID and a.CLI_ID = c.CLI_ID and c.CODE = p.CODE AND c.CLI_ID = ? ");
            requete.setInt(1, Integer.parseInt(codeCli));
            //executer la requete
            rs=requete.executeQuery();
             
            //On hydrate l'objet métier Client avec les résultats de la requête
            while ( rs.next() ) {  
                
                unClient.setId(rs.getInt("cli_id"));
                unClient.setNom(rs.getString("cli_nom"));
                unClient.setPrenom(rs.getString("cli_prenom"));
                unClient.setTitre(rs.getString("cli_titre"));
                unClient.setVille(rs.getString("cli_ville"));
                unClient.setAdrRue(rs.getString("cli_rue"));
                unClient.setCodePostal(rs.getString("cli_copos"));
                unClient.setAdresseMessagerie(rs.getString("cli_adresseMessagerie"));
                
                
                Pays p = new Pays();
                p.setCode(rs.getString("codePays"));
                p.setNom(rs.getString("nomPays"));
                
                unClient.setLePays(p);
                /*CategVente uneCateg = new CategVente();
                uneCateg.setCode(rs.getString("code"));  // on aurait aussi pu prendre CodeCateg
                uneCateg.setLibelle(rs.getString("libelle"));*/

            }
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return unClient ;    
    } 
    
    
     // Méthode permettant d'insérer un client en base à partir de l'objet client passé en paramètre
    // Cette méthode renvoie l'objet client
    public static Client ajouterClient(Connection connection, Client unClient){      
        int idGenere = -1;
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
            

           /* Exécution de la requête */
            requete.executeUpdate();
            
             // Récupération de id auto-généré par la bdd dans la table client
            rs = requete.getGeneratedKeys();
            while ( rs.next() ) {
                idGenere = rs.getInt( 1 );
                unClient.setId(idGenere);
            }
            
            // ajout du client dans la table acheteur
            PreparedStatement requete2=connection.prepareStatement("INSERT INTO acheteur (CLI_ID)\n" +
                    "VALUES (?)");
            requete2.setInt(1, unClient.getId());
            requete2.executeUpdate();

            
            // ajout des enregistrement dans la table clientcategvente
            for (int i=0;i<unClient.getLesCategVente().size();i++){
                PreparedStatement requete3=connection.prepareStatement("INSERT INTO ach_cat (CLI_ID, CAT_CODE )\n" +
                    "VALUES (?,?)");
                 requete3.setInt(1, unClient.getId());
                 requete3.setString(2, unClient.getLesCategVente().get(i).getCode());
                 requete3.executeUpdate();
            }
            
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return unClient ;    
    }
    
    
    
    
}
