
package forms;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Cheval;
import model.TypeCheval;



public class FormCheval {
    
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
    
    
    public Cheval ajouterUnCheval( HttpServletRequest request ) {
      
        Cheval unCheval  = new Cheval();
        
        
        String nom = getDataForm( request, "nom" );
        String sexe = getDataForm( request, "sexe");
        String sire = getDataForm( request, "sire" );
        String dateNaissance = getDataForm( request, "dateNaissance");
        String nomImage = getDataForm( request, "nomImage" );
        String mere = getDataForm( request, "LaMere" );
        String pere = getDataForm(request,"LePere");
        String typid = getDataForm(request ,"LeType");
        
        
       

        try {
             validationNom( nom );
        } catch ( Exception e ) {
            setErreur( "nom", e.getMessage() );
        }
        unCheval.setNom(nom);

        if ( erreurs.isEmpty() ) {
            resultat = "Succès de l'ajout.";
        } else {
            resultat = "Échec de l'ajout.";
        }
         
        if(pere != null){
            Cheval chepere = new Cheval();
            chepere.setId(Integer.parseInt(pere));
            unCheval.setLePere(chepere);
        }
        
        if(mere != null){
            Cheval chemere = new Cheval();
            chemere.setId(Integer.parseInt(mere));
            unCheval.setLaMere(chemere);
        }
        
        TypeCheval chetyp = new TypeCheval();
        chetyp.setId(Integer.parseInt(typid));
      
      
        unCheval.setNom(nom);
        unCheval.setSexe(sexe);
        unCheval.setSire(sire);
        unCheval.setDateNaissance(dateNaissance);
        unCheval.setNomImage(nomImage);      
        unCheval.setLeType(chetyp);
        
        
        return unCheval ;
    }
    
    
}
