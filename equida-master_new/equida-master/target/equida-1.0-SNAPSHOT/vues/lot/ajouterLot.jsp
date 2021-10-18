<%-- 
    Document   : ajouterCheval
    Created on : 6 oct. 2021, 09:12:07
    Author     : adminsio
--%>

<%@page import="forms.FormLot"%>
<%@page import="model.Cheval"%>
<%@page import="model.Lieu"%>
<%@page import="model.CategVente"%>
<%@page import="forms.FormVente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@include file="../components/header.jsp" %>


<section id="contact" class="contact">
      <div class="container">
          
                 <div class="section-title">
          <h2>Ajouter un cheval à la vente </h2>
          <p>Choisissez un cheval à affecter à la vente, ensuite appuyez sur le bouton "Valider" pour confirmer votre saisie.</p>
        </div>

          <div class="col-lg-5 d-flex align-items-stretch" style="padding: 30px; width: 100%; ">
        
         <%
                //Client client=(Client)request.getAttribute("client");
                FormLot form = (FormLot)request.getAttribute("form");
            %>
        
        <form class="form-inline" action="ajouterLot" method="POST" style="margin : 0 auto; max-width: 700px;">


                            
                        <%

                        ArrayList<Cheval> lesChevaux = (ArrayList)request.getAttribute("pLesChevaux");
                        String idVente = (String)request.getAttribute("vente");

                            %>
                      
                <label for="cheval"> Cheval :  </label>
                <select name="cheval" class="form-control" >
                    
                    <%
                        for (int i=0; i<lesChevaux.size();i++){
                            Cheval p = lesChevaux.get(i);
                            out.println("<option value='" + p.getId() + "'>" + p.getId() + ", "+ p.getNom() + ", " + p.getSexe() + ", " + p.getLeType().getLibelle() +"</option>" );
                        }
                    %>
                
                </select>
                    </br>
                    
                                    <div class="form-group col-md-6">
                <label for="nom">Prix : </label>
                <input id="nom" type="number" required name="prix" class="form-control" size="30" maxlength="30">
                </br>
                 
                </div>
                    
                    <%
                        out.println("<input type='hidden' name='vente' value='" + Integer.parseInt(idVente) + "'/>" );
                    %>
                      
                  
                                
            <input type="submit" name="valider" id="valider" value="Valider"/>
            </form>
          </div>  </div>
                </section>
