<%-- 
    Document   : ajouterCheval
    Created on : 6 oct. 2021, 09:12:07
    Author     : adminsio
--%>

<%@page import="model.TypeCheval"%>
<%@page import="model.Cheval"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.CategVente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Pays"%>
<%@page import="forms.FormCheval"%>

<%@include file="../components/header.jsp" %>


<section id="contact" class="contact">
      <div class="container">
          
                 <div class="section-title">
          <h2>Nouveau Cheval </h2>
          <p>Veuillez ajouter les informations concernant votre Cheval et appuyer sur le bouton "Valider" pour confirmer votre saisie.</p>
        </div>



          <div class="col-lg-5 d-flex align-items-stretch" style="padding: 30px; width: 100%; ">
        
         <%
                //Client client=(Client)request.getAttribute("client");
                FormCheval form = (FormCheval)request.getAttribute("form");
            %>
        
        <form class="form-inline" action="ajouterCheval" method="POST" style="margin : 0 auto; max-width: 700px;">
            
            <div class="row">
                
                <div class="form-group col-md-6">
                <label for="nom">NOM : </label>
                <input id="nom" type="text" name="nom" class="form-control" size="30" maxlength="30">
                </br>
                </div>
                
                <div class="form-group col-md-6">
                <label for="sexe">SEXE : </label>
                <input id="sexe"  type="text"  name="sexe" class="form-control" size="30" maxlength="30">      
                </br>
                </div>
                
            </div>
            
            <div class="row">
                <div class="form-group col-md-6">
                <label for="sire">N° SIRE : </label>
                <input id="sire"  type="text"  name="sire"  class="form-control" size="30" maxlength="30">      
                </br>
                </div>
                 
                <div class="form-group col-md-6">
                <label for="dateNaissance">DATE DE NAISSANCE : </label>
                <input id="dateNaissance"  type="text"  name="dateNaissance"  class="form-control" size="30" maxlength="30">      
                </br>
                </div>
            </div>    
                   
            
               
                  <div class="row">
         
                        <%

                        ArrayList<Cheval> lesChevauxH = (ArrayList)request.getAttribute("pLesChevauxH");
                        ArrayList<Cheval> lesChevauxF = (ArrayList)request.getAttribute("pLesChevauxF");

                            %>
                      
                        <div class="form-group col-md-6">
                <label for="mere">MERE DU CHEVAL :  </label>
                <select name="LaMere" class="form-control" >
                    
                    <%
                        for (int i=0; i<lesChevauxF.size();i++){
                            Cheval p = lesChevauxF.get(i);
                            out.println("<option value='" + p.getId()+"'>" + p.getNom()+"</option>" );
                        }
                    %>
                
                </select>
                    </br>
                </div>
                    
                 <div class="form-group col-md-6">
                <label for="pere">  PERE DU CHEVAL :  </label>
                <select name="LePere" class="form-control" >
                    <%
                        for (int i=0; i<lesChevauxH.size();i++){
                            Cheval p = lesChevauxH.get(i);
                            out.println("<option value='" + p.getId()+"'>" + p.getNom()+"</option>" );
                        }
                    %>
                
                </select>
                    </br>
                </div>
                      
                  </div>
                      
                      
                <div class="row">
                    
                 
                <div class="form-group col-md-6">
                <label for="nomImage"> Images du cheval : </label>
                <input id="nomImage"  type="text"  name="nomImage"  class="form-control" size="30" maxlength="30">
                </br>
                </div>
            
                 <div class="form-group col-md-6">
                <label for="typid">Type du cheval : </label>
                <select name="LeType"  class="form-control">      
                
       <%
           
           
                        ArrayList<TypeCheval> lesTypes = (ArrayList)request.getAttribute("pLesTypes");

                   
                        for (int i=0; i<lesTypes.size();i++){
                            TypeCheval t = lesTypes.get(i);
                            out.println("<option value='" + t.getId()+"'>" + t.getLibelle()+"</option>" );
                        }
                    %>
                    
                    </br>
                </div>
       </select>
          
          
          
          
          
          </div> 
            
          
                </select></br>
                
                
                
                 
                
                
             
                                
            <input type="submit" name="valider" id="valider" value="Valider"/>
            </form>
          </div>  </div>
                </section>

