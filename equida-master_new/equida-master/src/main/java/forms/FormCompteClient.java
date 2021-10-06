/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forms;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.CategVente;
import model.Client;
import model.Compte;
import model.Compte;
import model.Pays;

/**
 *
 * @author Zakina
 */
public class FormCompteClient {
    
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
        if ( nom != null && nom.length() < 3 ) {
        throw new Exception( "Le nom d'utilisateur doit contenir au moins 3 caractères." );
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
    
    
    public Compte ajouterCompteClient( HttpServletRequest request ) {
      
        Client unClient  = new Client();
        Compte unCompte = new Compte();
         
        String nom = getDataForm( request, "nom" );
        String prenom = getDataForm( request, "prenom");
        String titre = getDataForm( request, "titre" );
        String rue = getDataForm( request, "rue" );
        String copos = getDataForm( request, "copos");
        String ville = getDataForm( request, "ville" );
        String mail = getDataForm( request, "mail" );
        String pays = getDataForm( request, "codePays" );
        String username = getDataForm( request, "username" );
        String password= getDataForm( request, "password" );
       
    
        try {
             validationNom( nom );
        } catch ( Exception e ) {
            setErreur( "nom", e.getMessage() );
        }
        unClient.setNom(nom);

        if ( erreurs.isEmpty() ) {
            resultat = "Succès de l'ajout.";
        } else {
            resultat = "Échec de l'ajout.";
        }
             
        unClient.setPrenom(prenom);
        unClient.setTitre(titre);
        unClient.setAdrRue(rue);
        unClient.setCodePostal(copos);
        unClient.setVille(ville);
        unClient.setAdresseMessagerie(mail);
        unClient.setLePays(new Pays(pays));
        
        
        unCompte.setLeClient(unClient);
        unCompte.setLogin(username);
        unCompte.setMdp(password);
        
        return unCompte ;
    }
    
    
}
