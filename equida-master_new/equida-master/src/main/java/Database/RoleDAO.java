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
import model.Lot;
import model.Role;

/**
 *
 * @author adminsio
 */
public class RoleDAO {
    
    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    
    public static ArrayList<Role> getLesRoles(Connection connection){      
        ArrayList<Role> lesRoles = new ArrayList<Role>();
        try
        {
            //preparation de la requete     
            requete=connection.prepareStatement("select * from role");
            //executer la requete
            rs=requete.executeQuery();
            
            //On hydrate l'objet avec les résultats de la requête
            while ( rs.next() ) {  
                Role unRole = new Role();
                unRole.setCode(rs.getInt("rol_code"));
                unRole.setNom(rs.getString("rol_nom"));

                lesRoles.add(unRole);
            }
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesRoles ;    
    } 
}
