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
                Vente uneVente = new Vente();
                uneVente.setId(rs.getInt("ven_id"));
                uneVente.setNom(rs.getString("ven_nom"));
                uneVente.setDateDebutVente(rs.getString("ven_dateDebutVente"));
                
                CategVente laCategVente = new CategVente();
                laCategVente.setCode(rs.getString("cat_code"));  // on aurait aussi pu prendre CodeCateg
                laCategVente.setLibelle(rs.getString("cat_libelle"));
                
                uneVente.setCategVente(laCategVente);
                lesVentes.add(uneVente);
            }
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
        return lesVentes ;    
    }
    
}
