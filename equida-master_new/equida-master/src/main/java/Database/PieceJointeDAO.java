/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import static Database.CourrielDAO.requete;
import static Database.CourrielDAO.rs;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Courriel;
import model.PieceJointe;

/**
 *
 * @author loanb
 */
public class PieceJointeDAO {
    
public static ArrayList<PieceJointe>  getLesPiecesJointesByCourrielId(Connection connection, String couId){    
        
        ArrayList<PieceJointe> lesPiecesJointes = new  ArrayList<PieceJointe>();
        try
        {
            //preparation de la requete     
            requete=connection.prepareStatement("select p.pie_id, pie_chemin, pie_description from cou_pie cp INNER JOIN piecejointe p on cp.pie_id = p.pie_id where cou_id=?");          
            requete.setInt(1, Integer.parseInt(couId));
            //executer la requete
            rs=requete.executeQuery();
            //On hydrate l'objet métier Client avec les résultats de la requête
            while ( rs.next() ) {  
                PieceJointe unePJ = new PieceJointe();
                unePJ.setId(rs.getInt("p.pie_id"));
                unePJ.setChemin(rs.getString("pie_chemin"));
                unePJ.setDescription(rs.getString("pie_description"));

                lesPiecesJointes.add(unePJ);
            }
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
        return lesPiecesJointes;    
    }
    
}
