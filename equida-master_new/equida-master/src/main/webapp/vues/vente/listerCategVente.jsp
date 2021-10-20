<%-- 
    Document   : listerCategVente
    Created on : 18 oct. 2021, 11:40:59
    Author     : adminsio
--%>

<%@page import="model.CategVente"%>
<%@page import="model.Compte"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>


<%@include file="../components/header.jsp" %>
  

  <%
     ArrayList<CategVente> lesCategVente = (ArrayList)request.getAttribute("pLesCategVente");
  %>
  
  
 
<section id="team" class="team section-bg">
  <div class="container">

    <div class="section-title">
      <h2>LISTE DES CATEGORIES DE VENTE</h2>
      <p>Voici la liste des différentes catégories de ventes</p>
    </div>

    <div class="row">
      
      <table  class="table table-bordered table-striped table-condensed">  
        <thead>
            <tr>             
                <th>Code du type de vente</th>
                <th>Libellé du type de vente</th>
                 <th>Abonnement</th>

        <br>
        <br>
            </tr>
        </thead>
        <tbody>
        
                <tr>
                    <%
                    for(int i = 0; i < lesCategVente.size();i++){
                        
                        CategVente uneCategVente = lesCategVente.get(i);
                        out.println("<tr><td>");
                        out.println(uneCategVente.getCode());
                        out.println("</a></td>");

                        out.println("<td>");
                        out.println(uneCategVente.getLibelle());
                        out.println("</td>");
                        
                        
                        out.println("<td>");
                        out.println("<button type='button' class='btn btn-primary' data-toggle='modal' "
                                + "data-target='#exampleModalCenter'>S'abonner à cette catégorie </button>");
                        

                        
                        out.println("</td>");
                        
                        out.println("<div class='modal fade' id='exampleModalCenter' tabindex='-1' role='dialog' aria-labelledby='exampleModalCenterTitle' aria-hidden='true'>"
                                
                                + "<div class='modal-dialog modal-dialog-centered' role='document'>"
                                
                                    + "<div class='modal-content'>"
                                
                                        + "<div class='modal-header'>"
                                
                                            + "<h5 class='modal-title' id='exampleModalLongTitle'>S'abonner à cette catégorie ?</h5>"
                                           
                                            + "</div>"
                                
                                        + "<div class='modal-body'>"
                                
                                            + "<h6>Voulez vous vraiment vous abonner à cette catégorie de vente ?</h6>"
                                
                                        + "</div>"
                                
                                    + "<div class='modal-footer'>"
                                
                                        + "<input class='btn btn-primary' type='submit' name='valider' id='valider' value='Valider'/>"                              

                                        +"<button type='button' class='btn btn-secondary' data-dismiss='modal'>Je ne m'abonne pas</button>"
                                
                                        + "</div>"
                                
                                    + "</div>"
                                
                                + "</div>");
                    }
                    
                    Compte leCompte=(Compte)session.getAttribute("compte");      
                if(leCompte != null){
                    if(leCompte.getLeClient().getLesCategVente() != null){
                        out.println("<div class='col-lg-4 col-md-6 content-item'><div class='divEnchere'><span>");
                        out.println("<a href='../ServletVente/listerCategVente");
                            out.println();
                        out.println("'>Voir les différentes catégories de vente</a>");
                    }
                }


                    %>
                </tr>
            </tbody>
        </table>
       
    </div>
  </div>
</section>

<%@include file="../components/footer.jsp" %>
  
