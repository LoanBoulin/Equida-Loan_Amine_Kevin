<%-- 
    Document   : ajouterCompteClient
    Created on : 4 oct. 2021, 14:50:34
    Author     : adminsio
--%>

<%@page import="forms.FormCompteClient"%>
<%@page import="model.Role"%>
<%@page import="model.CategVente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Pays"%>
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
                FormCompteClient form = (FormCompteClient)request.getAttribute("form");
            %>
        
        <form class="form-inline" action="ajouterCompteClient" method="POST" style="margin : 0 auto; max-width: 700px;">
            
            <h4>Informations principales</h4>
            
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
                <label for="titre">Civilité : </label>
                <select name="titre">
                    <option value="M"> Monsieur </option>
                    <option value="F"> Madame </option>
                    <option value="A"> Autre </option>
                </select>
                </br>      
                </div>
                 
                <div class="form-group col-md-6">
                <label for="mail">ADRESSE MAIL : </label>
                <input id="mail"  type="text"  name="mail"  class="form-control" size="30" maxlength="30">      
                </br>
                </div>
            </div>    
            
            <h4>Contact</h4>
                 
            <div class="row">
                <div class="form-group col-md-6">
                <label for="rue">RUE : </label>
                <input id="rue"  type="text"  name="rue"  class="form-control" size="30" maxlength="30">
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
                
                
                
                <h4>Compte</h4>
                 
            <div class="row">
                <div class="form-group col-md-6">
                <label for="username">Username : </label>
                <input id="username"  type="text"  name="username"  class="form-control" size="30" maxlength="30">
                </br>
                </div>
                               
                 
                <div class="form-group col-md-6">
                <label for="password">Password : </label>
                <input id="password"  type="text"  name="password"  class="form-control" size="30" maxlength="30">
                </br>
                </div>
            </div> 
                
                
            
                
                
                <%--  <label for="categVente">CATEGORIE DE VENTE : </label>
                <select name="categVente"  class="form-control" size="5" multiple>
                <%
                        ArrayList<CategVente> lesCategVente = (ArrayList)request.getAttribute("pLesCategVente");
                        for (int i=0; i<lesCategVente.size();i++){
                            CategVente cv = lesCategVente.get(i);
                            out.println("<option value ='" + cv.getCode() + "'>" + cv.getLibelle() + "</option>"); 
                           
                        }
                    %>
                </select></br>--%>
                
                
                    
                                
            <input type="submit" name="valider" id="valider" value="Valider"/>
            </form>
          </div>  </div>
                </section>
