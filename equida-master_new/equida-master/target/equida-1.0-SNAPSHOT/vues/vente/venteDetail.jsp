<%-- 
    Document   : venteDetail
    Created on : 11 octobre. 2021
    Author     : loanb
--%>

<%@page import="model.Vente"%>
<%@page import="model.TypeCheval"%>
<%@page import="model.Lot"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@include file="../components/header.jsp" %>

<% 
    
    Vente laVente = (Vente)request.getAttribute("vente");
    
    Compte leCompteAcc=(Compte)session.getAttribute("compte");

%>

 <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
      <div class="container">

        <div class="section-title">
            
            <% out.println("<h2>Vente " + laVente.getNom() + "</h2>"); %>
            
          <p>Voici les principales informations concernant cette vente. Vous pouvez y retrouver les dernières enchères menées ainsi que les chevaux actuellement en vente.</p>
        </div>

        <div class="row">

          <div class="col-lg-5 d-flex align-items-stretch">
            <div class="info">
              <div class="address">
                <i class="bi bi-geo-alt"></i>
                <h4>Localisation:</h4>
                <% out.println("<p> " + laVente.getLeLieu().getVille() + "</p>"); %>
              </div>

              <div class="email">
                <i class="bx bx-box"></i>
                <h4>Nombre de boxes:</h4>
                <% out.println("<p> " + laVente.getLeLieu().getNbBoxes() + "</p>"); %>
              </div>

              <div class="phone">
                <i class="bx bx-comment"></i>
                <h4>Autres informations:</h4>
                <% out.println("<p> " + laVente.getLeLieu().getCommentaires() + "</p>"); %>
              </div>

              <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d41725.38164022107!2d-0.4072620284765116!3d49.18469185756196!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x480a42bd4c04c933%3A0x3da5749f30d00859!2s14000%20Rouen!5e0!3m2!1sfr!2sfr!4v1633953730583!5m2!1sfr!2sfr" frameborder="0" style="border:0; width: 100%; height: 290px;" allowfullscreen></iframe>
            </div>

          </div>

          <div class="col-lg-7 mt-5 mt-lg-0 d-flex align-items-stretch">
            <div class="php-email-form">             
               <div class="form-group">
                  <div class="row">
                      <div class="col">
                            <h5>Date de début : </h5>
                            <% out.println("<p> " + laVente.getDateDebutVente() + "</p>"); %>
                      </div>
                      <div class="col">
                            <h5>Date de fin : </h5>
                            <p>(non implémenté)</p>
                      </div>
                  </div>
                </div>
             <div class="form-group">   
                <h5>Type de vente : </h5>
                <% out.println("<p> " + laVente.getCategVente().getLibelle() + "</p>"); %>
             </div>
                <br>
            
                <%
                    
                                out.println("<div class='form-group'><a class='button' href='../ServletLot/listerLesLotsByVente?venId=");  
                                    out.println(laVente.getId());  
                                    out.println("'>Voir les chevaux de la vente</a></div>");  
                    
                %>
                
                <br>
        
        <%    
                
             if(session.getAttribute("login").equals(true)){
                            if(leCompteAcc.getLeRole() != null){
                                if(leCompteAcc.getLeRole().getNom().equals("Salarie") || leCompteAcc.getLeRole().getNom().equals("Admin")){

                                    out.println("<div class='form-group'><a class='button' href='../ServletClient/listerLesClientsParCategVente?codeCat=");  
                                    out.println(laVente.getCategVente().getCode());  
                                    out.println("'>Voir les clients interessés</a></div><br>");  
                                    
                                    
                                    
                                    out.println("<div class='form-group'><a class='button' href='../ServletCourriel/listerLesCourrielsByVente?venId=");  
                                    out.println(laVente.getId());  
                                    out.println("'>Voir les messages</a></div>");  

                                }
                            }
                        }
             
             %>
                
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Contact Section -->




<%@include file="../components/footer.jsp" %>
