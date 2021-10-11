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
import model.CategVente;
import model.Lieu;
import model.Vente;

/**
 *
 * @author Zakina
 */
public class VenteDAO {
    
    
    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    
    /* @author Zakina - 25/08/2021
    /* Méthode permettant de lister toutes les ventes enregistrées en base, triées par date décroissante.
    /* Pour chaque vente, on récupère aussi sa catégorie.
    /* La liste des vente est stockée dans une ArrayList
    */
    public static ArrayList<Vente>  getLesVentes(Connection connection){    
        
        ArrayList<Vente> lesVentes = new  ArrayList<Vente>();
        try
        {
            //preparation de la requete     
            requete=connection.prepareStatement("select * from vente, categvente where categvente.cat_code=vente.cat_code order by ven_dateDebutVente desc");          
            //executer la requete
            rs=requete.executeQuery();
            //On hydrate l'objet métier Client avec les résultats de la requête
            while ( rs.next() ) {  
                Vente laVente = new Vente();
                laVente.setId(rs.getInt("ven_id"));
                laVente.setNom(rs.getString("ven_nom"));
                laVente.setDateDebutVente(rs.getString("ven_dateDebutVente"));
                
                CategVente laCategVente = new CategVente();
                laCategVente.setCode(rs.getString("cat_code"));  // on aurait aussi pu prendre CodeCateg
                laCategVente.setLibelle(rs.getString("cat_libelle"));
                
                laVente.setCategVente(laCategVente);
                lesVentes.add(laVente);
            }
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
        return lesVentes ;    
    }
    
    
    public static Vente getlaVente(String id, Connection connection){    
        
        Vente laVente = new Vente();
        try
        {
            //preparation de la requete     
            requete=connection.prepareStatement("select * from vente INNER JOIN categvente on vente.CAT_CODE = categvente.CAT_CODE INNER JOIN lieu ON vente.LIE_ID = lieu.LIE_ID where VEN_ID = ? order by ven_dateDebutVente desc");          
            requete.setInt(1, Integer.parseInt(id));
            //executer la requete
            rs=requete.executeQuery();
            //On hydrate l'objet métier Client avec les résultats de la requête
            while ( rs.next() ) {  
                laVente.setId(rs.getInt("ven_id"));
                laVente.setNom(rs.getString("ven_nom"));
                laVente.setDateDebutVente(rs.getString("ven_dateDebutVente"));
                
                CategVente laCategVente = new CategVente();
                laCategVente.setCode(rs.getString("cat_code"));  // on aurait aussi pu prendre CodeCateg
                laCategVente.setLibelle(rs.getString("cat_libelle"));
                
                Lieu leLieu = new Lieu();
                leLieu.setId(rs.getInt("lieu.lie_id"));
                leLieu.setVille(rs.getString("lieu.lie_ville"));
                leLieu.setNbBoxes(rs.getInt("lieu.lie_nbboxes"));
                leLieu.setCommentaires(rs.getString("lieu.lie_commentaires"));
                
                laVente.setCategVente(laCategVente);
                laVente.setLeLieu(leLieu);
            }
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
        return laVente ;    
    }
    
}
