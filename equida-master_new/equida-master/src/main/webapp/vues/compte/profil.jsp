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
               Compte unCompte = (Compte)request.getAttribute("pUnCompte");
              
  %>
  
<!DOCTYPE html>
<html>
    
    <section id="team" class="team section-bg">
      <div class="container">

        <div class="section-title">
          <h2>Mon Profil</h2>
          <p>Toutes les informations concernant votre profil chez Equida®</p>
        </div>
  <div class='row'>
   <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
            <div class="member">
                
                
            
                
              <h4><%  out.println(unCompte.getLogin());%></h4>
              
                <span>
              <%  if(unCompte.getLeClient() == null){
                   out.println(unCompte.getLeRole().getNom());
                }else if(unCompte.getLeRole() == null){
                   out.println("Client"); 

                }
              
                 %>
              </span>
              
              

                 
                 <%
                     
                 if(unCompte.getLeRole() == null){
                            String leSexe = unCompte.getLeClient().getTitre();

                         if(leSexe.equals("M")){
                                         out.println("<img src='../assets/img/team/Minconnu.jpg' alt=''>");

                                     }else if(leSexe.equals("F")){
                             out.println("<img src='../assets/img/team/Finconnu.jpg'alt=''>");


                          }           

                 }
                     
                     
 
              %>
              
              
         

            
              <div class="social">
                <a href="https://twitter.com/?lang=fr"><i class="bi bi-twitter"></i></a>
                <a href="https://fr-fr.facebook.com/"><i class="bi bi-facebook"></i></a>
                <a href="https://www.instagram.com/?hl=fr"><i class="bi bi-instagram"></i></a>
                <a href="https://fr.linkedin.com/"><i class="bi bi-linkedin"></i></a>
              </div>
            </div>
          </div>
            





    <%
    
    if(unCompte.getLeRole() == null){
        
              out.println("<div class='col-lg-7 mt-5 mt-lg-0 d-flex align-items-stretch'>"
              +"<div class='php-email-form'>"
              +"<div class='php-email-form'>"
              +"<div class='form-group'>"
              +"<div class='row'>"
              +"<div class='col'>"    
              +"<h5> Nom : </h5>");
              
              out.println(unCompte.getLeClient().getNom());
             
              out.println( "</div>"
              +"</div>"
              +"<br>"
              +"<div class='form-group'>"
              +"<div class='row'>"
              +"<div class='col'>"
              +"<h5> Prenom : </h5>");
              
               out.println(unCompte.getLeClient().getPrenom());
               
               out.println( "</div>"
              
              +"</div>"   
              +"<br>"      
              +"<div class='form-group'>" 
              +"<div class='row'>"
              +"<div class='col'>"   
              +"<h5>  Sexe : </h5>");
               
              out.println(unCompte.getLeClient().getTitre());
              
              out.println("</div>"
               
              +"</div>"        
              +"<br>"    
              +"<div class='form-group'>"
              +"<div class='row'>"
              +"<div class='col'>"           
              +"<h5>  Rue : </h5>");
               
             out.println(unCompte.getLeClient().getAdrRue());
               
             out.println("</div>"
              
              +"</div>"  
              +"<br>"
              +"<div class='form-group'>"
              +"<div class='row'>"
              +"<div class='col'>" 
              +"<h5> Code Postal  : </h5>" );
               
               out.println(unCompte.getLeClient().getCodePostal());
               
               out.println ("</div>"
                       
              +"</div>"
              +"<br>"
              +"<div class='form-group'>"
              +"<div class='row'>"
              +"<div class='col'>" 
              +"<h5> Ville  : </h5>"); 
               
               
               out.println(unCompte.getLeClient().getVille());
               
               out.println("</div>"
                       
              +"</div>" 
              +"<br>"
              +"<div class='form-group'>"
              +"<div class='row'>"
              +"<div class='col'>" 
              +"<h5> Adresse mail : </h5>" );
                
              out.println(unCompte.getLeClient().getAdresseMessagerie());
              
               out.println("</div");
               
               
       
    }   
             
                     
        
    
               %>       
                      
 
         
  
  </div>     
          </div>
    </section><!-- End Team Section -->
               


           


<%@include file="../components/footer.jsp" %>

 
