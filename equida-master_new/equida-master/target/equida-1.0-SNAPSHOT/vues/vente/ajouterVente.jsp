<%-- 
    Document   : ajouterCheval
    Created on : 6 oct. 2021, 09:12:07
    Author     : adminsio
--%>

<%@page import="model.Vente"%>
<%@page import="model.Lieu"%>
<%@page import="model.CategVente"%>
<%@page import="forms.FormVente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@include file="../components/header.jsp" %>


<section id="contact" class="contact">
      <div class="container">
          
                 <div class="section-title">
          <h2>Nouvelle Vente </h2>
          <p>Veuillez ajouter les informations concernant votre Vente et appuyer sur le bouton "Valider" pour confirmer votre saisie.</p>
        </div>

          <div class="col-lg-5 d-flex align-items-stretch" style="padding: 30px; width: 100%; ">
        
         <%
                Vente vente=(Vente)request.getAttribute("pVente");
                FormVente form = (FormVente)request.getAttribute("form");
            %>
        
        <form class="form-inline" action="ajouterVente" method="POST" style="margin : 0 auto; max-width: 700px;">
            
            <div class="row">
                
                <div class="form-group col-md-6">
                <label for="nom">NOM : </label>
                <input id="nom" type="text" name="nom" class="form-control" size="30" maxlength="30">
                </br>
                </div>
                
                <div class="form-group col-md-6">
                <label for="sexe">DATE : </label>
                <input id="sexe"  type="date"  name="date" class="form-control" size="30" maxlength="30">      
                </br>
                </div>
                
            </div>

                      
                  <div class="row">
         
                        <%

                        ArrayList<Lieu> lesLieux = (ArrayList)request.getAttribute("lieux");
                        ArrayList<CategVente> lesCategs = (ArrayList)request.getAttribute("categs");

                            %>
                      
                        <div class="form-group col-md-6">
                <label for="categ"> Categorie de vente :  </label>
                <select name="categ" class="form-control" >
                    
                    <%
                        for (int i=0; i<lesCategs.size();i++){
                            CategVente p = lesCategs.get(i);
                            out.println("<option value='" + p.getCode()+"'>" + p.getLibelle()+"</option>" );
                        }
                    %>
                
                </select>
                    </br>
                </div>
                    
                 <div class="form-group col-md-6">
                <label for="lieu">  Lieu :  </label>
                <select name="lieu" class="form-control" >
                    <%
                        for (int i=0; i<lesLieux.size();i++){
                            Lieu p = lesLieux.get(i);
                            out.println("<option value='" + p.getId()+"'>" + p.getVille()+"</option>" );
                        }
                    %>
                
                </select>
                    </br>
                </div>
                      
                  </div>
                      
                      
                  
                                
            <input type="submit" name="valider" id="valider" value="Valider"/>
            </form>
          </div>  </div>
                </section>

