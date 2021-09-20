<%-- 
    Document   : listerLesPiecesJointesByCourriel
    Created on : 20 sept. 2021, 10:58:12
    Author     : loanb
--%>

<%@page import="model.PieceJointe"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../components/header.jsp" %>


       <!-- ======= Team Section ======= -->
<section id="team" class="team section-bg">
  <div class="container">

    <div class="section-title">
      <h2>LISTE DES PIECES JOINTES </h2>
      <p>Voici la liste des pièces jointes relatifs à ce message</p>
    </div>

    <div class="row">
         <%
        ArrayList<PieceJointe> lesPiecesJointes = (ArrayList)request.getAttribute("pLesPiecesJointes");
        %>
        <table  class="table table-bordered table-striped table-condensed">  
            <thead>
                <tr>             
                    <th>Id</th>
                    <th>Chemin</th>
                    <th>Description</th>
                    <th></th>
                    
            <br>
            <br>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <%
                    for(int i = 0; i < lesPiecesJointes.size();i++)
                    {
                        PieceJointe unePieceJointe = lesPiecesJointes.get(i);
                        out.println("<tr><td>");
                        out.println(unePieceJointe.getId());
                        out.println("</a></td>");

                        out.println("<td>");
                        out.println(unePieceJointe.getChemin());
                        out.println("</td>");

                        out.println("<td>");
                        out.println(unePieceJointe.getDescription());
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
