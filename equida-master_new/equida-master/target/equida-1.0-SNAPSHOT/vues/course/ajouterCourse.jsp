<%-- 
    Document   : ajouterCheval
    Created on : 6 oct. 2021, 09:12:07
    Author     : adminsio
--%>

<%@page import="forms.FormCourse"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@include file="../components/header.jsp" %>


<section id="contact" class="contact">
      <div class="container">
          
                 <div class="section-title">
          <h2>Nouvelle Course </h2>
          <p>Veuillez ajouter les informations concernant votre Vente et appuyer sur le bouton "Valider" pour confirmer votre saisie.</p>
        </div>



          <div class="col-lg-5 d-flex align-items-stretch" style="padding: 30px; width: 100%; ">
        
         <%
                //Client client=(Client)request.getAttribute("client");
                FormCourse form = (FormCourse)request.getAttribute("form");
            %>
        
        <form class="form-inline" action="ajouterCourse" method="POST" style="margin : 0 auto; max-width: 700px;">
            
            <div class="row">
                
                <div class="form-group col-md-6">
                <label for="nom">Nom de la course : </label>
                <input id="nom" type="text" name="nom" class="form-control" size="30" maxlength="30">
                </br>
                </div>
                
                <div class="form-group col-md-6">
                <label for="sexe">Date de la course  : </label>
                <input id="date"  type="date"  name="date" class="form-control" size="30" maxlength="30">      
                </br>
                </div>
                
                
                 <div class="form-group col-md-6">
                <label for="lieu"> Lieu de la course  : </label>
                <input id="lieu"  type="text"  name="lieu" class="form-control" size="30" maxlength="30">      
                </br>
                </div>
                
                
            </div>

    </div>
                      
   
            
            <input type="submit" name="valider" id="valider" value="Valider"/>
            </form>
          </div>  </div>
                </section>

