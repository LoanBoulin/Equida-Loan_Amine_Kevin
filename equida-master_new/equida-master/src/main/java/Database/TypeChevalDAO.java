/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import static Database.LotDAO.requete;
import static Database.LotDAO.rs;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Lot;
import model.TypeCheval;

/**
 *
 * @author loanb
 */
public class TypeChevalDAO {
    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    
    public static ArrayList<TypeCheval> getTypesCheval(Connection connection){      
        ArrayList<TypeCheval> lesTypes = new ArrayList<TypeCheval>();
        try
        {
            //preparation de la requete     
            requete=connection.prepareStatement("select * from typecheval");
            //executer la requete
            rs=requete.executeQuery();
            
            //On hydrate l'objet métier Client avec les résultats de la requête
            while ( rs.next() ) {  
                TypeCheval unType = new TypeCheval();
                unType.setId(rs.getInt("typ_id"));
                unType.setLibelle(rs.getString("typ_libelle"));
                unType.setDescription(rs.getString("typ_description"));
                lesTypes.add(unType);
            }
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesTypes ;    
    } 
}
