<%-- 
    Document   : connexion
    Created on : 4 oct. 2021, 11:28:09
    Author     : adminsio
--%>
<%@page import="forms.FormConnexion"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@include file="../components/header.jsp" %>
<section id="contact" class="contact">
      <div class="container">
          
                 <div class="section-title">
          <h2>Connexion</h2>
          <p>Veuillez vous connecter pour accéder aux fonctionnalités de Equida</p>
        </div>
          



          <div class="col-lg-5 d-flex align-items-stretch" style="padding: 30px; width: 100%; ">
              
            <%
                FormConnexion form = (FormConnexion)request.getAttribute("form");
            %>

        <form class="" action="connexion" method="POST" style="margin : 0 auto; max-width: 700px;">
                                             
            
                <div class="form-group col-md-6">
                <label for="username">Username : </label>
                <input style="width: 200%" id="username"  type="text"  name="username"  class="form-control" size="30" maxlength="30">
                </br>
                </div>
                               
                 
                <div class="form-group col-md-6">
                <label for="password">Password : </label>
                <input style="width: 200%" id="password"  type="text"  name="password"  class="form-control" size="30" maxlength="30">
                </br>
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



<%@include file="../components/footer.jsp" %>
