/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forms;


import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Enchere;
import model.Lot;
import model.Client;



/**
 *
 * @author adminsio
 */
public class FormEnchere {
    
    private String resultat;
    private Map<String, String> erreurs      = new HashMap<>();

    public String getResultat() {
        return resultat;
    }

    public void setResultat(String resultat) {
        this.resultat = resultat;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public void setErreurs(Map<String, String> erreurs) {
        this.erreurs = erreurs;
    }
    
    //méthode de validation du champ de saisie montant
    private void validationMontant( String montant ) throws Exception {
        Enchere uneEnchere = new Enchere();
        if ( montant != null && montant.length() < uneEnchere.getLeLot().getPrix() ) {
        throw new Exception( "Le prix entré est inférieur au prix de départ du lot." );
        }
    }

    private void setErreur( String champ, String message ) {
    erreurs.put(champ, message );
    }    
    
    private String getDataForm( HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur.trim();
        }   
    }
    
    
    public Enchere ajouterEnchere( HttpServletRequest request ) {
      
        Enchere uneEnchere  = new Enchere();
        Lot unLot  = new Lot();
        Client unClient  = new Client();
         
        String montant = getDataForm( request, "montant" );
        String client = getDataForm( request, "client" );
        String lot = getDataForm( request, "lot" );


        if ( erreurs.isEmpty() ) {
            resultat = "Succès de l'ajout.";
        } else {
            resultat = "Échec de l'ajout.";
        }
         
        unLot.setId(Integer.parseInt(lot));
        unClient.setId(Integer.parseInt(client));
      
        uneEnchere.setMontant(Integer.parseInt(montant));
        uneEnchere.setLeClient(unClient);
        uneEnchere.setLeLot(unLot);
        
        
        return uneEnchere ;
    }
        
}   

