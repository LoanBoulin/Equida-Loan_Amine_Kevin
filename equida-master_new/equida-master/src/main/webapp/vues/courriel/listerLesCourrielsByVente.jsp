<%-- 
    Document   : listerLesCourrielsByVente
    Created on : 20 sept. 2021, 10:14:27
    Author     : loanb
--%>

<%@page import="model.Courriel"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Equida</title>
    </head>
    <body>
       <h1>LISTE DES COURRIELS POUR UNE VENTE</h1>
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
                        
                        out.println("<td><a href ='../ServletClient/listerLesClientsParCategVente?codeCat="+ unCourriel.getId()+ "'>");
                        out.println("(pas fait) Voir les clients abonnés");
                        out.println("</td>");
                               
                    }
                    %>
                </tr>
            </tbody>
        </table>
    </body>
</html>
