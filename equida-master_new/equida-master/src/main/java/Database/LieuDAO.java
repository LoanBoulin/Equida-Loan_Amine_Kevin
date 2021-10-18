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
import model.Lieu;

/**
 *
 * @author Zakina
 */
public class LieuDAO {
    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    
     public static ArrayList<Lieu>  getLesLieu(Connection connection){      
        ArrayList<Lieu> lesLieu = new  ArrayList<Lieu>();
        try
        {
            //preparation de la requete     
            requete=connection.prepareStatement("select * from Lieu");
            
            //executer la requete
            rs=requete.executeQuery();
            
            //On hydrate l'objet métier Client avec les résultats de la requête
            while ( rs.next() ) {  
                Lieu unLieu = new Lieu();
                unLieu.setId(rs.getInt("LIE_ID"));
                unLieu.setNbBoxes(rs.getInt("LIE_NBBOXES"));
                unLieu.setVille(rs.getString("LIE_VILLE"));
                unLieu.setCommentaires(rs.getString("LIE_VILLE"));
                lesLieu.add(unLieu);
            }
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesLieu ;    
    } 
}
