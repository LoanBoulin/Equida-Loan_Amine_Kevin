/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forms;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Vente;
import model.Lieu;
import model.CategVente;

/**
 *
 * @author adminsio
 */
public class FormVente {
    
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
    
    //méthode de validation du champ de saisie nom
    private void validationNom( String nom ) throws Exception {
        if ( nom != null && nom.length() < 2 ) {
        throw new Exception( "Le nom du cheval doit contenir au moins 2 caractères." );
        }
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
    
    
    public Vente ajouterVente( HttpServletRequest request ) {
      
        Vente uneVente  = new Vente();
        
        
        String catCode = getDataForm( request, "categ" );
        String nom = getDataForm( request, "nom");
        String date = getDataForm( request, "date" );
        String lieu = getDataForm( request, "lieu");
        
       

        try {
             validationNom( nom );
        } catch ( Exception e ) {
            setErreur( "nom", e.getMessage() );
        }
        uneVente.setNom(nom);

        if ( erreurs.isEmpty() ) {
            resultat = "Succès de l'ajout.";
        } else {
            resultat = "Échec de l'ajout.";
        }
                       
        
        CategVente laCateg = new CategVente();
        laCateg.setCode(catCode);
        
        Lieu leLieu = new Lieu();
        leLieu.setId(Integer.parseInt(lieu));
            
        uneVente.setDateDebutVente(date);
        
        uneVente.setLeLieu(leLieu);
        uneVente.setCategVente(laCateg);
        
        return uneVente ;
    }
    
    
}
