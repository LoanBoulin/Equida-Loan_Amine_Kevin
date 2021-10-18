<%-- 
    Document   : listerLesCourrielsByVente
    Created on : 20 sept. 2021, 10:14:27
    Author     : loanb
--%>

<%@page import="model.Courriel"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@include file="../components/header.jsp" %>


       <!-- ======= Team Section ======= -->
<section id="team" class="team section-bg">
  <div class="container">

    <div class="section-title">
      <h2>LISTE DES MESSAGES </h2>
      <p>Voici la liste des messages relatifs à cette catégorie de vente</p>
    </div>

    <div class="row">
         <%
        ArrayList<Courriel> lesCourriels = (ArrayList)request.getAttribute("pLesCourriels");
        %>
        <table  class="table table-bordered table-striped table-condensed">  
            <thead>
                <tr>             
                    <th>Id</th>
                    <th>Date</th>
                    <th>Objet</th>
                    <th>Corps</th>
                    <th></th>
                    
            <br>
            <br>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <%
                    for(int i = 0; i < lesCourriels.size();i++)
                    {
                        Courriel unCourriel = lesCourriels.get(i);
                        out.println("<tr><td>");
                        out.println(unCourriel.getId());
                        out.println("</a></td>");

                        out.println("<td>");
                        out.println(unCourriel.getDate());
                        out.println("</td>");

                        out.println("<td>");
                        out.println(unCourriel.getObjet());
                        out.println("</td>");

                        out.println("<td>");
                        out.println(unCourriel.getCorps());
                        out.println("</td>");
                        

                        out.println("<td><a href ='../ServletPieceJointe/listerLesPiecesJointesByCourriel?couId="+ unCourriel.getId()+ "'>");
                        out.println("Voir les pièces jointes");
                        out.println("</td>");
                       
                               
                    }
                    %>
                </tr>
            </tbody>
        </table>
    </div>
  </div>
</section>

<%@include file="../components/footer.jsp" %>
