/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author adminsio
 */
public class TestVente {
    
    public static void main(String[] args) {
        
        Vente uneVente = new Vente(12, "Vente d'hiver 2020", "12 décembre 2020");
        Lieu unLieu1 = new Lieu(1,"Caen", 145, "commentaires") ;
        Courriel leCourriel = new Courriel(2, "13 décembre 2020", "Message de la vente", "corpsDuMessage");
        PieceJointe unePiece1 = new PieceJointe(1, "chemin1", "description1");
        PieceJointe unePiece2 = new PieceJointe(2, "chemin2", "description2");
        
        uneVente.setLeLieu(unLieu1) ;
        uneVente.addUnCourriel(leCourriel);
        leCourriel.addUnePieceJointe(unePiece1);
        leCourriel.addUnePieceJointe(unePiece2);
       

       
        System.out.println("La vente nommée " + uneVente.getNom() + "a pour Lieu " + uneVente.getLeLieu().getVille());
        
        System.out.println ("Voici les courriels associés à cette vente");
        
        for (Courriel lesCourriels : uneVente.getLesCourriels() ){           
            System.out.println (lesCourriels.getId() + " " + lesCourriels.getDate() + " " + lesCourriels.getObjet() );
            System.out.println ("Voici les pièces jointes : ");
            
            for (PieceJointe lesPieces : lesCourriels.getLesPiecesJointes() ){           
                System.out.println (lesPieces.getId() + " " + lesPieces.getDescription() );
            }
            
        }
        
        
        
    }
    
}
