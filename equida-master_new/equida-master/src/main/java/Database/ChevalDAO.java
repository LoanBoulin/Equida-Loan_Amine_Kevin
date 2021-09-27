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
import model.Cheval;
import model.Lot;
import model.TypeCheval;

/**
 *
 * @author loanb
 */
public class ChevalDAO {
    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    
    public static Cheval getChevalByLotId(Connection connection, int lot_id){      
        Cheval leCheval = new Cheval();
        TypeCheval leType = new TypeCheval();
        try
        {
            //preparation de la requete     
            requete=connection.prepareStatement("select cheval.*, typ_libelle, typ_description from lot INNER JOIN cheval ON lot.che_id = cheval.che_id INNER JOIN typecheval ON cheval.typ_id = typecheval.typ_id where lot_id=?");
            requete.setInt(1, lot_id);
            //executer la requete
            rs=requete.executeQuery();
            
            //On hydrate l'objet métier Client avec les résultats de la requête
            while ( rs.next() ) {  
                leCheval.setId(rs.getInt("che_id"));
                leCheval.setNom(rs.getString("che_nom"));
                leCheval.setSexe(rs.getString("che_sexe"));
                leCheval.setSire(rs.getString("che_sire"));
                leCheval.setDateNaissance(rs.getString("che_datenaissance"));
                leCheval.setNomImage(rs.getString("che_nomimage"));
                
                leType.setId(rs.getInt("typ_id"));
                leType.setLibelle(rs.getString("typ_libelle"));
                leType.setDescription(rs.getString("typ_description"));
                
                leCheval.setLeType(leType);
                
            }
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return leCheval ;    
    } 
    
    
    
    public static Cheval getChevalById(Connection connection, int che_id){      
        Cheval leCheval = new Cheval();
        TypeCheval leType = new TypeCheval();
        try
        {
            //preparation de la requete     
            requete=connection.prepareStatement("select cheval.*, typ_libelle, typ_description from cheval INNER JOIN typecheval ON cheval.typ_id = typecheval.typ_id where che_id=?");
            requete.setInt(1, che_id);
            //executer la requete
            rs=requete.executeQuery();
            
            //On hydrate l'objet métier Client avec les résultats de la requête
            while ( rs.next() ) {  
                leCheval.setId(rs.getInt("che_id"));
                leCheval.setNom(rs.getString("che_nom"));
                leCheval.setSexe(rs.getString("che_sexe"));
                leCheval.setSire(rs.getString("che_sire"));
                leCheval.setDateNaissance(rs.getString("che_datenaissance"));
                leCheval.setNomImage(rs.getString("che_nomimage"));
                
                leType.setId(rs.getInt("typ_id"));
                leType.setLibelle(rs.getString("typ_libelle"));
                leType.setDescription(rs.getString("typ_description"));
                
                leCheval.setLeType(leType);
                
            }
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return leCheval ;    
    } 
    
    
}
