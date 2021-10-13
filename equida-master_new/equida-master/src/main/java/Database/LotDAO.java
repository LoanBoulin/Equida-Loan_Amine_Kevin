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

/**
 *
 * @author loanb
 */
public class LotDAO {
    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    
    public static ArrayList<Lot> getLesLotsByVente(Connection connection, String venId){      
        ArrayList<Lot> lesLots = new ArrayList<Lot>();
        try
        {
            //preparation de la requete     
            requete=connection.prepareStatement("select lot_id, lot_prixdepart from lot where ven_id=?");
            requete.setInt(1, Integer.parseInt(venId));
            //executer la requete
            rs=requete.executeQuery();
            
            //On hydrate l'objet avec les résultats de la requête
            while ( rs.next() ) {  
                Lot unLot = new Lot();
                unLot.setId(rs.getInt("lot_id"));
                unLot.setPrix(rs.getInt("lot_prixdepart"));
                //unLot.setLeCheval(rs.getInt("che_id"));
                //unLot.setLibelle(rs.getString("cat_libelle"));
                lesLots.add(unLot);
            }
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesLots ;    
    } 
    
    
    
}
