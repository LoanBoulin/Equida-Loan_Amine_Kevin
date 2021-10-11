<%-- 
    Document   : ajouterClient
    Created on : 18 août 2021, 18:02:51
    Author     : Zakina
--%>

<%@page import="model.CategVente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Pays"%>
<%@page import="forms.FormClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../components/header.jsp" %>


<section id="contact" class="contact">
      <div class="container">
          
                 <div class="section-title">
          <h2>Nouveau Client</h2>
          <p>Veuillez ajouter vos informations et appuyer sur le bouton "Valider" pour confirmer votre inscription.</p>
        </div>



          <div class="col-lg-5 d-flex align-items-stretch" style="padding: 30px; width: 100%; ">
        
         <%
                //Client client=(Client)request.getAttribute("client");
                FormClient form = (FormClient)request.getAttribute("form");
            %>
        
        <form class="form-inline" action="ajouterClient" method="POST" style="margin : 0 auto; max-width: 700px;">
            
            <div class="row">
                
                <div class="form-group col-md-6">
                <label for="nom">NOM : </label>
                <input id="nom" type="text" name="nom" class="form-control" size="30" maxlength="30">
                </br>
                </div>
                
                <div class="form-group col-md-6">
                <label for="prenom">PRENOM : </label>
                <input id="prenom"  type="text"  name="prenom" class="form-control" size="30" maxlength="30">      
                </br>
                </div>
                
            </div>
            
            <div class="row">
                <div class="form-group col-md-6">
                <label for="titre">TITRE : </label>
                <input id="titre"  type="text"  name="titre"  class="form-control" size="30" maxlength="30">      
                </br>
                </div>
                 
                <div class="form-group col-md-6">
                <label for="adrMessagerie">ADRESSE MAIL : </label>
                <input id="adrMessagerie"  type="text"  name="adrMessagerie"  class="form-control" size="30" maxlength="30">      
                </br>
                </div>
            </div>    
                 
            <div class="row">
                <div class="form-group col-md-6">
                <label for="adrRue">RUE : </label>
                <input id="adrRue"  type="text"  name="adrRue"  class="form-control" size="30" maxlength="30">
                </br>
                </div>
                               
                 
                <div class="form-group col-md-6">
                <label for="copos">CODE POSTAL : </label>
                <input id="copos"  type="text"  name="copos"  class="form-control" size="30" maxlength="30">
                </br>
                </div>
            </div> 
            
            <div class="row">
                
                <div class="form-group col-md-6">
                <label for="ville">VILLE : </label>
                <input id="ville"  type="text"  name="ville"  class="form-control"size="30" maxlength="30">
                </br>
                </div>
                
                <%-- Champ Liste des pays --%>
                <div class="form-group col-md-6">
                <label for="pays">PAYS : </label>
                <select name="codePays" class="form-control" size="5" multiple>
                    <%
                        ArrayList<Pays> lesPays = (ArrayList)request.getAttribute("pLesPays");
                        for (int i=0; i<lesPays.size();i++){
                            Pays p = lesPays.get(i);
                            out.println("<option value='" + p.getCode()+"'>" + p.getNom()+"</option>" );
                        }
                    %>
                </select>
                </br> 
                </div>
             </div>
                <label for="categVente">CATEGORIE DE VENTE : </label>
                <select name="categVente"  class="form-control" size="5" multiple>
                <%
                        ArrayList<CategVente> lesCategVente = (ArrayList)request.getAttribute("pLesCategVente");
                        for (int i=0; i<lesCategVente.size();i++){
                            CategVente cv = lesCategVente.get(i);
                            out.println("<option value ='" + cv.getCode() + "'>" + cv.getLibelle() + "</option>"); 
                           
                        }
                    %>
                </select></br>
                
                
                
             
                                
            <input type="submit" name="valider" id="valider" value="Valider"/>
            </form>
          </div>  </div>
                </section>


