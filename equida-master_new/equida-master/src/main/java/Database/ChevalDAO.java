/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import static Database.ClientDAO.requete;
import static Database.ClientDAO.rs;
import static Database.LotDAO.requete;
import static Database.LotDAO.rs;
import static Database.PaysDAO.requete;
import static Database.PaysDAO.rs;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Cheval;
import model.Client;
import model.Lot;
import model.Pays;
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
    
    
     public static Cheval ajouterCheval(Connection connection , Cheval unCheval){
        
        int idGenere = -1;
        try 
        {
            
            requete = connection.prepareStatement("INSERT INTO CHEVAL(CHE_NOM,CHE_SEXE,CHE_SIRE,CHE_DATENAISSANCE,CHE_NOMIMAGE,CHE_IDPERE,CHE_IDMERE, TYP_ID)\n"+
                    "VALUES (?,?,?,?,?,?,?,?)" , requete.RETURN_GENERATED_KEYS);
            requete.setString(1,unCheval.getNom());
            requete.setString(2,unCheval.getSexe());
            requete.setString(3,unCheval.getSire());
            requete.setString(4,unCheval.getDateNaissance());
            requete.setString(5,unCheval.getNomImage());
            requete.setInt(6,unCheval.getLePere().getId());
            requete.setInt(7,unCheval.getLaMere().getId());
            requete.setInt(8,unCheval.getLeType().getId());
          
            
         
            
            
            requete.executeUpdate();
            
            rs=requete.getGeneratedKeys();
            while(rs.next() ){
                idGenere=rs.getInt(1);
                unCheval.setId(idGenere);
            }
        }
    
        catch (SQLException e )
                {
                e.printStackTrace();
                }
            
                return unCheval;
                
     
        }
        
     
          public static ArrayList<Cheval>  getLesChevaux (Connection connection){      
        ArrayList<Cheval> lesChevaux = new  ArrayList<Cheval>();
        try
        {
            
          //preparation de la requete     
            requete=connection.prepareStatement("select * from cheval");
            
            //executer la requete
            rs=requete.executeQuery();
            
             while ( rs.next() ) {  
                Cheval unCheval = new Cheval();
                TypeCheval unType = new TypeCheval();
                
                unCheval.setId(rs.getInt("che_id"));
                unCheval.setNom(rs.getString("che_nom"));
                unCheval.setSexe(rs.getString("che_sexe"));
                unCheval.setDateNaissance(rs.getString("che_datenaissance"));
                unCheval.setNomImage(rs.getString("che_nomimage"));
                
                unType.setId(rs.getInt("typ_id"));
                
                unCheval.setLeType(unType);
                
                lesChevaux.add(unCheval);
             
            //On hydrate l'objet métier Client avec les résultats de la requête
                 }
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesChevaux ;    
    } 
}



