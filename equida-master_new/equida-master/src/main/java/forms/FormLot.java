/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forms;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Cheval;
import model.Lot;
import model.Vente;

/**
 *
 * @author adminsio
 */
public class FormLot {
    
    private String resultat;
    private Map<String, String> erreurs      = new HashMap<String, String>();

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
   

    private void setErreur( String champ, String message ) {
    erreurs.put(champ, message );
    }    
    
    private static String getDataForm( HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur.trim();
        }   
    }
    
    
    public Lot ajouterLot( HttpServletRequest request ) {
      
        Lot unLot  = new Lot();
        
        String vente = getDataForm( request, "vente" );
        String cheval = getDataForm( request, "cheval" );
        String prix = getDataForm( request, "prix");
        
        if ( erreurs.isEmpty() ) {
            resultat = "Succès de l'ajout.";
        } else {
            resultat = "Échec de l'ajout.";
        }
        
        System.out.println(vente);
        System.out.println(prix);
        System.out.println(cheval);
        
                       
        Vente laVente = new Vente();
        laVente.setId(Integer.parseInt(vente));     
        unLot.setLaVente(laVente);
        
        Cheval leCheval = new Cheval();
        leCheval.setId(Integer.parseInt(cheval));
        unLot.setLeCheval(leCheval);

        unLot.setPrix(Integer.parseInt(prix));
        
        return unLot ;
    }
    
    
}
