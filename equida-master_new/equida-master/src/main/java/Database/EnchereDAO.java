/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import static Database.ClientDAO.rs;
import static Database.LotDAO.requete;
import static Database.LotDAO.rs;
import static Database.VenteDAO.rs;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.CategVente;
import model.Cheval;
import model.Client;
import model.Enchere;
import model.Lot;
import model.Pays;
import model.TypeCheval;
import model.Vente;

/**
 *
 * @author adminsio
 */
public class EnchereDAO {
    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    
    public static ArrayList<Enchere> getLesEncheresByCheval(Connection connection, String venId){      
        ArrayList<Enchere> lesEncheres = new ArrayList<Enchere>();
        try
        {
            //preparation de la requete     
            requete=connection.prepareStatement("select * from CHEVAL INNER JOIN TYPECHEVAL on TYPECHEVAL.TYP_ID = CHEVAL.TYP_ID INNER JOIN LOT on CHEVAL.CHE_ID = LOT.CHE_ID INNER JOIN ENCHERE on LOT.LOT_ID = ENCHERE.LOT_ID INNER JOIN CLIENT on ENCHERE.CLI_ID = CLIENT.CLI_ID INNER JOIN PAYS on CLIENT.CODE = PAYS.CODE INNER JOIN VENTE on LOT.VEN_ID = VENTE.VEN_ID INNER JOIN CATEGVENTE on VENTE.CAT_CODE = CATEGVENTE.CAT_CODE WHERE CHEVAL.CHE_ID = ? ORDER BY ENCHERE.ENC_NUMERO DESC;");
            requete.setInt(1, Integer.parseInt(venId));
            //executer la requete
            rs=requete.executeQuery();
            
            //On hydrate l'objet avec les résultats de la requête
            while ( rs.next() ) {  
                
                //Valeurs du Cheval
                Cheval leCheval = new Cheval();
                leCheval.setId(rs.getInt("CHEVAL.che_id"));
                leCheval.setNom(rs.getString("che_nom"));
                leCheval.setSexe(rs.getString("che_sexe"));
                leCheval.setSire(rs.getString("che_sire"));
                leCheval.setDateNaissance(rs.getString("che_datenaissance"));
                leCheval.setNomImage(rs.getString("che_nomimage"));
                               
                TypeCheval leType = new TypeCheval();
                leType.setId(rs.getInt("TYPECHEVAL.typ_id"));
                leType.setLibelle(rs.getString("typ_libelle"));
                leType.setDescription(rs.getString("typ_description"));
                
                leCheval.setLeType(leType);
                
                //Valeurs de la Vente & CategVente
                Vente laVente = new Vente();
                laVente.setId(rs.getInt("VENTE.ven_id"));
                laVente.setNom(rs.getString("ven_nom"));
                laVente.setDateDebutVente(rs.getString("ven_dateDebutVente"));
                
                CategVente laCategVente = new CategVente();
                laCategVente.setCode(rs.getString("CATEGVENTE.cat_code"));  // on aurait aussi pu prendre CodeCateg
                laCategVente.setLibelle(rs.getString("cat_libelle"));
                
                laVente.setCategVente(laCategVente);
                                
                //Valeurs du Client
                Client unClient = new Client();
                unClient.setId(rs.getInt("CLIENT.cli_id"));
                unClient.setNom(rs.getString("cli_nom"));
                unClient.setPrenom(rs.getString("cli_prenom"));
                unClient.setVille(rs.getString("cli_ville"));
                unClient.setAdrRue(rs.getString("cli_rue"));
                unClient.setCodePostal(rs.getString("cli_copos"));
                unClient.setAdresseMessagerie(rs.getString("cli_adresseMessagerie"));
                
                Pays p = new Pays();
                p.setCode(rs.getString("PAYS.CODE"));
                p.setNom(rs.getString("PAYS.NOM"));
                
                unClient.setLePays(p);                
                                                     
                //Valeurs du Lot
                Lot leLot = new Lot();
                leLot.setId(rs.getInt("lot_id"));
                leLot.setPrix(rs.getInt("lot_prixdepart"));
                leLot.setLaVente(laVente);
                leLot.setLeCheval(leCheval);
                leLot.setLaVente(laVente);
                                             
                
                //Valeurs de l'enchère
                Enchere uneEnchere = new Enchere();
                uneEnchere.setMontant(rs.getFloat("ENC_MONTANT"));
                uneEnchere.setId(rs.getInt("ENC_NUMERO"));
                uneEnchere.setLeClient(unClient);
                uneEnchere.setLeLot(leLot);
                                
                lesEncheres.add(uneEnchere);
            }
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesEncheres ;    
    } 
    
    
    
     public static ArrayList<Enchere> getLesEncheresByChevalLimit5(Connection connection, String venId){      
        ArrayList<Enchere> lesEncheres = new ArrayList<Enchere>();
        try
        {
            //preparation de la requete     
            requete=connection.prepareStatement("select * from CHEVAL INNER JOIN TYPECHEVAL on TYPECHEVAL.TYP_ID = CHEVAL.TYP_ID INNER JOIN LOT on CHEVAL.CHE_ID = LOT.CHE_ID INNER JOIN ENCHERE on LOT.LOT_ID = ENCHERE.LOT_ID INNER JOIN CLIENT on ENCHERE.CLI_ID = CLIENT.CLI_ID INNER JOIN PAYS on CLIENT.CODE = PAYS.CODE INNER JOIN VENTE on LOT.VEN_ID = VENTE.VEN_ID INNER JOIN CATEGVENTE on VENTE.CAT_CODE = CATEGVENTE.CAT_CODE WHERE CHEVAL.CHE_ID = ? ORDER BY ENCHERE.ENC_NUMERO DESC LIMIT 5;");
            requete.setInt(1, Integer.parseInt(venId));
            //executer la requete
            rs=requete.executeQuery();
            
            //On hydrate l'objet avec les résultats de la requête
            while ( rs.next() ) {  
                
                //Valeurs du Cheval
                Cheval leCheval = new Cheval();
                leCheval.setId(rs.getInt("CHEVAL.che_id"));
                leCheval.setNom(rs.getString("che_nom"));
                leCheval.setSexe(rs.getString("che_sexe"));
                leCheval.setSire(rs.getString("che_sire"));
                leCheval.setDateNaissance(rs.getString("che_datenaissance"));
                leCheval.setNomImage(rs.getString("che_nomimage"));
                               
                TypeCheval leType = new TypeCheval();
                leType.setId(rs.getInt("TYPECHEVAL.typ_id"));
                leType.setLibelle(rs.getString("typ_libelle"));
                leType.setDescription(rs.getString("typ_description"));
                
                leCheval.setLeType(leType);
                
                //Valeurs de la Vente & CategVente
                Vente laVente = new Vente();
                laVente.setId(rs.getInt("VENTE.ven_id"));
                laVente.setNom(rs.getString("ven_nom"));
                laVente.setDateDebutVente(rs.getString("ven_dateDebutVente"));
                
                CategVente laCategVente = new CategVente();
                laCategVente.setCode(rs.getString("CATEGVENTE.cat_code"));  // on aurait aussi pu prendre CodeCateg
                laCategVente.setLibelle(rs.getString("cat_libelle"));
                
                laVente.setCategVente(laCategVente);
                                
                //Valeurs du Client
                Client unClient = new Client();
                unClient.setId(rs.getInt("CLIENT.cli_id"));
                unClient.setNom(rs.getString("cli_nom"));
                unClient.setPrenom(rs.getString("cli_prenom"));
                unClient.setVille(rs.getString("cli_ville"));
                unClient.setAdrRue(rs.getString("cli_rue"));
                unClient.setCodePostal(rs.getString("cli_copos"));
                unClient.setAdresseMessagerie(rs.getString("cli_adresseMessagerie"));
                
                Pays p = new Pays();
                p.setCode(rs.getString("PAYS.CODE"));
                p.setNom(rs.getString("PAYS.NOM"));
                
                unClient.setLePays(p);                
                                                     
                //Valeurs du Lot
                Lot leLot = new Lot();
                leLot.setId(rs.getInt("lot_id"));
                leLot.setPrix(rs.getInt("lot_prixdepart"));
                leLot.setLaVente(laVente);
                leLot.setLeCheval(leCheval);
                leLot.setLaVente(laVente);
                                             
                
                //Valeurs de l'enchère
                Enchere uneEnchere = new Enchere();
                uneEnchere.setMontant(rs.getFloat("ENC_MONTANT"));
                uneEnchere.setId(rs.getInt("ENC_NUMERO"));
                uneEnchere.setLeClient(unClient);
                uneEnchere.setLeLot(leLot);
                                
                lesEncheres.add(uneEnchere);
            }
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesEncheres ;    
    } 
    
    
    
    public static ArrayList<Enchere> getLesEncheres(Connection connection, String venId){      
        ArrayList<Enchere> lesEncheres = new ArrayList<Enchere>();
        try
        {
            //preparation de la requete     
            requete=connection.prepareStatement(""
                    + "select e.*"
                    + "from CHEVAL"
                    + "INNER JOIN LOT on CHEVAL.CHE_ID = LOT.CHE_ID"
                    + "INNER JOIN TYPECHEVAL on CHEVAL.TYP_ID = TYPECHEVAL.TYP_ID"
                    + "INNER JOIN ENCHERE on LOT.LOT_ID = ENCHERE.LOT_ID"
                    + "INNER JOIN CLIENT on ENCHERE.CLI_ID = CLIENT.CLI_ID"
                    + "INNER JOIN VENTE on ENCHERE.VEN_ID = VENTE.VEN_ID"
                    + "INNER JOIN CATEGVENTE on VENTE.CAT_CODE = CATEGVENTE.CAT_CODE"
                    + "WHERE CHEVAL.CHE_ID = ?");
            requete.setInt(1, Integer.parseInt(venId));
            //executer la requete
            rs=requete.executeQuery();
            
            //On hydrate l'objet avec les résultats de la requête
            while ( rs.next() ) {  
                
                
                Lot leLot = new Lot();
                Vente laVente = new Vente();
                Client leClient = new Client();
                Cheval leCheval = new Cheval();
                
                //Valeurs de la Vente
                        
                //Valeurs de l'enchère
                Enchere uneEnchere = new Enchere();
                uneEnchere.setMontant(rs.getFloat("ENC_MONTANT"));
                uneEnchere.setId(rs.getInt("ENC_NUMERO"));
                
                
                
                //Valeurs du Lot
                //leLot.setId();
                
                
                //Valeurs du Client
                //Valeurs du Cheval
                leLot.setId(rs.getInt("lot_id"));
                leLot.setPrix(rs.getInt("lot_prixdepart"));
                //unLot.setLeCheval(rs.getInt("che_id"));
                //unLot.setLibelle(rs.getString("cat_libelle"));
               // lesLots.add(unLot);
            }
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesEncheres ;    
    } 
    
    
    public static Enchere ajouterEnchere(Connection connection, Enchere uneEnchere){      
        int idGenere = -1;
        try
        {
            //preparation de la requete
            // id (clé primaire de la table client) est en auto_increment,donc on ne renseigne pas cette valeur
            // la paramètre RETURN_GENERATED_KEYS est ajouté à la requête afin de pouvoir récupérer l'id généré par la bdd (voir ci-dessous)
            // supprimer ce paramètre en cas de requête sans auto_increment.
            requete=connection.prepareStatement("INSERT INTO ENCHERE (LOT_ID, CLI_ID, ENC_MONTANT)\n" +
                    "VALUES (?,?,?)");
            requete.setInt(1, uneEnchere.getLeLot().getId());
            requete.setInt(2, uneEnchere.getLeClient().getId());      
            requete.setFloat(3, uneEnchere.getMontant());
            
           /* Exécution de la requête */
            requete.executeUpdate();
            
            // Récupération de id auto-généré par la bdd dans la table client
            /*rs = requete.getGeneratedKeys();
            while ( rs.next() ) {
                idGenere = rs.getInt( 1 );
                uneEnchere.setId(idGenere);
            }*/
            
            /* ajout des enregistrement dans la table clientenchere
            for (int i=0;i<uneEnchere.getLeClient().size();i++){
                PreparedStatement requete2=connection.prepareStatement("INSERT INTO clientenchere (numeroEnchere, codeClient)\n" +
                    "VALUES (?,?)");
                 requete2.setInt(1, uneEnchere.getId());
                 requete2.setString(2, uneEnchere.().get(i).getNom());
                 requete2.executeUpdate();
            }*/
            
        }   
        catch (SQLException e) 
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return uneEnchere ;    
    }
    
}
