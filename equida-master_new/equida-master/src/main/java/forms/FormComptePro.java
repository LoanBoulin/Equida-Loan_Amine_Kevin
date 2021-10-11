/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forms;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Compte;
import model.Role;

/**
 *
 * @author adminsio
 */
public class FormComptePro {
    
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
   
    
    
    public Compte ajouterComptePro( HttpServletRequest request ) {
      
        Compte unCompte = new Compte();
        
        String username = getDataForm( request, "username" );
        String password = getDataForm( request, "password" );
        String role = getDataForm( request, "role" );
        
        // Traitement de la liste à choix multiple
        //Pour chq catégorie selectionné, on instancie une nouvelle catégorie et on l'ajoute au client
       
        
        Role unRole = new Role();
        unRole.setCode(Integer.parseInt(role));
        

        if ( erreurs.isEmpty() ) {
            resultat = "Succès de l'ajout.";
        } else {
            resultat = "Échec de l'ajout.";
        }
        
        System.out.println("role" + role);
        
        unCompte.setLogin(username);
        unCompte.setMdp(password);
        unCompte.setLeRole(unRole);
        
        return unCompte ;
    }
    
}
