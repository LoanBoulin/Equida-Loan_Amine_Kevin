<%-- 
    Document   : ajouterComptePro
    Created on : 4 oct. 2021, 14:50:23
    Author     : adminsio
--%>
<%@page import="model.Role"%>
<%@page import="model.CategVente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Pays"%>
<%@page import="forms.FormComptePro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../components/header.jsp" %>
<section id="contact" class="contact">
      <div class="container">
          
                 <div class="section-title">
          <h2>Nouveau Compte Pro</h2>
          <p>Veuillez ajouter vos informations et appuyer sur le bouton "Valider" pour confirmer l'inscription.</p>
        </div>



          <div class="col-lg-5 d-flex align-items-stretch" style="padding: 30px; width: 100%; ">
        
         <%
                //Client client=(Client)request.getAttribute("client");
                FormComptePro formComptePro = (FormComptePro)request.getAttribute("form");
            %>
        
        <form class="form-inline" action="ajouterComptePro" method="POST" style="margin : 0 auto; max-width: 700px;">
            
                
                
                
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
                
                <div class="form-group col-md-6">
                <label for="role">Role : </label>
                <select name="role">
                    <%
                        ArrayList<Role> lesRoles = (ArrayList)request.getAttribute("pLesRoles");
                        for (int i=0; i<lesRoles.size();i++){
                            Role unRole = lesRoles.get(i);
                            out.println("<option value ='" + unRole.getCode() + "'>" + unRole.getNom() + "</option>"); 
                           
                        }
                    %>
                </select>
                </br>   
                </br> 
                </br> 
                </div>
                
                         
            <input type="submit" name="valider" id="valider" value="Valider"/>
            </form>
          </div>  </div>
                </section>
