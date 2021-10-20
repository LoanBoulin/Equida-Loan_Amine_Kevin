<%-- 
    Document   : profil
    Created on : 13 oct. 2021, 08:45:53
    Author     : adminsio
--%>



<%@include file="../components/header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Client"%>
<%@page import="model.Compte"%>
<%@page import="java.util.ArrayList"%>

 <%
               Client unClient = (Client)request.getAttribute("pUnClient");
              
  %>
  
    <section id="contact" class="contact">
      <div class="container">

        <div class="section-title">
          <% out.println( " <h2>Profil client de " + unClient.getPrenom() + " " + unClient.getNom() + "</h2>"); %>
          <p>Toutes les informations concernant le client chez Equida®</p>
        </div>

          
            <div class="php-email-form">             
               <div class="form-group">
                  <div class="row">
                      <div class="col">
                            <h5>Nom & Prenom : </h5>
                            <% out.println("<p> " + unClient.getNom() + " " + unClient.getPrenom() + "</p>"); %>
                      </div>
                      <div class="col">
                            <h5>Titre : </h5>
                            <% out.println("<p>" + unClient.getTitre() + "</p>"); %>
                      </div>
                  </div>
                </div>
                <div class="form-group">   
                   <h5>Adresse : </h5>
                   <% out.println("<p> " + unClient.getAdrRue() + "</p>"); %>

                    <h5>Code postal : </h5>
                   <% out.println("<p> " + unClient.getCodePostal() + "</p>"); %>

                    <h5>Ville : </h5>
                   <% out.println("<p> " + unClient.getVille() + "</p>"); %>
                </div>
                   <br>

                <div class="form-group">   
                   <h5>Adresse mail : </h5>
                   <% out.println("<p> " + unClient.getAdresseMessagerie() + "</p>"); %>

                </div>
                   <br>
       
    
                      
              </div>

  
  </div>     
  
    </section><!-- End Team Section -->
               


           


<%@include file="../components/footer.jsp" %>

 
