/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import static Database.ClientDAO.requete;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.CategVente;
import model.Courriel;
import model.Vente;

/**
 *
 * @author Zakina
 */
public class CourrielDAO {
    
    
    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    
    /* @author Zakina - 25/08/2021
    /* Méthode permettant de lister toutes les ventes enregistrées en base, triées par date décroissante.
    /* Pour chaque vente, on récupère aussi sa catégorie.
    /* La liste des vente est stockée dans une ArrayList
    */
    public static ArrayList<Courriel>  getLesCourrielsByVenteId(Connection connection, String venId){    
        
        ArrayList<Courriel> lesCourriels = new  ArrayList<Courriel>();
        try
        {
            //preparation de la requete     
            requete=connection.prepareStatement("select * from courriel where ven_id=? order by cou_date desc");          
            requete.setInt(1, Integer.parseInt(venId));
            //executer la requete
            rs=requete.executeQuery();
            //On hydrate l'objet métier Client avec les résultats de la requête
            while ( rs.next() ) {  
                Courriel unCourriel = new Courriel();
                unCourriel.setId(rs.getInt("cou_id"));
                unCourriel.setObjet(rs.getString("cou_objet"));
                unCourriel.setCorps(rs.getString("cou_corps"));
                unCourriel.setDate(rs.getString("cou_date"));

                lesCourriels.add(unCourriel);
            }
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
        return lesCourriels ;    
    }
    
}
