<%-- 
    Document   : listerLesCourrielsByVente
    Created on : 20 sept. 2021, 10:14:27
    Author     : loanb
--%>

<%@page import="model.Enchere"%>
<%@page import="model.Courriel"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@include file="../components/header.jsp" %>


         <%
        ArrayList<Enchere> lesEncheres = (ArrayList)request.getAttribute("plesEncheres");
        %>

       <!-- ======= Team Section ======= -->
<section id="team" class="team section-bg">
  <div class="container">

    <div class="section-title">
        <h2>LISTE DES ENCHERES DE <a href="../ServletCheval/detailCheval?Cheval=<% out.println(lesEncheres.get(0).getLeLot().getLeCheval().getId() ); %>"><% out.println(lesEncheres.get(0).getLeLot().getLeCheval().getNom() ); %></a></h2>
      <p>Voici la liste des enchères du cheval</p>
    </div>

    <div class="row">

        <table  class="table table-bordered table-striped table-condensed">  
            <thead>
                <tr>             
                    <th>Id</th>
                    <th>Client</th>
                    <th>Prix base</th>
                    <th>Montant</th>
                    <th>Vente</th>                   
                    
            <br>
            <br>
                </tr>
            </thead>
            <tbody>
              
                    <%
                    for(int i = 0; i < lesEncheres.size();i++)
                    {
                        Enchere uneEnchere = lesEncheres.get(i);
                        
                        out.println("<tr><td>");
                        out.println(uneEnchere.getId());
                        out.println("</a></td>");

                        out.println("<td><a href ='../ServletClien/profilClient?cliId="+ uneEnchere.getLeClient().getId() + "'>");
                        out.println(uneEnchere.getLeClient().getPrenom() + " " + uneEnchere.getLeClient().getNom());
                        out.println("</td>");

                        out.println("<td>");
                        out.println(uneEnchere.getLeLot().getPrix());
                        out.println("</td>");
                        
                        out.println("<td>");
                        out.println(uneEnchere.getMontant());
                        out.println("</td>");

                        out.println("<td><a href ='../ServletVente/venteDetail?venId="+ uneEnchere.getLaVente().getId()+ "'>");
                        out.println(uneEnchere.getLaVente().getNom());
                        out.println("</a></td>");
                        
                       
                               
                    }
                    %>
           
            </tbody>
        </table>
    </div>
  </div>
</section>

<%@include file="../components/footer.jsp" %>
