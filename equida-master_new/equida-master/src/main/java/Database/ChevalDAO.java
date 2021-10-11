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
        Cheval leChevalPere = new Cheval();
        Cheval leChevalMere = new Cheval();
        
        TypeCheval leType = new TypeCheval();
        try
        {
            //preparation de la requete     
            requete=connection.prepareStatement("select child.*, pere.che_nom as nompere , mere.che_nom as nommere, typ_libelle, typ_description from lot INNER JOIN cheval as child ON lot.che_id = child.che_id INNER JOIN typecheval ON child.typ_id = typecheval.typ_id LEFT JOIN cheval as pere ON child.che_idpere = pere.che_id LEFT JOIN cheval as mere ON child.che_idmere = mere.che_id where lot_id=?");
            requete.setInt(1, lot_id);
            //executer la requete
            rs=requete.executeQuery();
            
            while ( rs.next() ) { 
            //On hydrate l'objet métier Client avec les résultats de la requête
                leCheval.setId(rs.getInt("child.che_id"));
                leCheval.setNom(rs.getString("child.che_nom"));
                leCheval.setSexe(rs.getString("child.che_sexe"));
                leCheval.setSire(rs.getString("child.che_sire"));
                leCheval.setDateNaissance(rs.getString("child.che_datenaissance"));
                leCheval.setNomImage(rs.getString("child.che_nomimage"));
                
                leChevalPere.setId(rs.getInt("child.che_idpere"));
                leChevalPere.setNom(rs.getString("nompere"));
                
                leChevalMere.setId(rs.getInt("child.che_idmere"));
                leChevalMere.setNom(rs.getString("nommere"));

                leCheval.setLePere(leChevalPere);
                leCheval.setLaMere(leChevalMere);
                
                
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
        Cheval leChevalPere = new Cheval();
        Cheval leChevalMere = new Cheval();
        TypeCheval leType = new TypeCheval();
        
        try
        {
            //preparation de la requete     
            requete=connection.prepareStatement("select child.*, pere.che_nom , mere.che_nom , typ_libelle, typ_description from cheval child INNER JOIN typecheval ON child.typ_id = typecheval.typ_id LEFT JOIN cheval pere ON child.che_idpere = pere.che_id LEFT JOIN cheval mere ON child.che_idmere = mere.che_id where child.che_id=?");
            requete.setInt(1, che_id);
            //executer la requete
            rs=requete.executeQuery();
            
            while ( rs.next() ) { 
            //On hydrate l'objet métier Client avec les résultats de la requête
                leCheval.setId(rs.getInt("child.che_id"));
                leCheval.setNom(rs.getString("child.che_nom"));
                leCheval.setSexe(rs.getString("child.che_sexe"));
                leCheval.setSire(rs.getString("child.che_sire"));
                leCheval.setDateNaissance(rs.getString("child.che_datenaissance"));
                leCheval.setNomImage(rs.getString("child.che_nomimage"));
                
                leChevalPere.setId(rs.getInt("child.che_idpere"));
                leChevalPere.setNom(rs.getString("pere.che_nom"));
                
                leChevalMere.setId(rs.getInt("child.che_idmere"));
                leChevalMere.setNom(rs.getString("mere.che_nom"));

                leCheval.setLePere(leChevalPere);
                leCheval.setLaMere(leChevalMere);
                
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
