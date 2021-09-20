<%-- 
    Document   : listerLesPiecesJointesByCourriel
    Created on : 20 sept. 2021, 10:58:12
    Author     : loanb
--%>

<%@page import="model.PieceJointe"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Equida</title>
    </head>
    <body>
       <h1>LISTE DES Pieces jointes</h1>
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
    </body>
</html>
