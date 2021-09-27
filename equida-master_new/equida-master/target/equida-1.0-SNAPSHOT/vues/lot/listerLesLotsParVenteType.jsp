<%-- 
    Document   : listerLesCourrielsByVente
    Created on : 20 sept. 2021, 10:14:27
    Author     : loanb
--%>

<%@page import="model.Lot"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@include file="../components/header.jsp" %>


       <!-- ======= Team Section ======= -->
<section id="team" class="team section-bg">
  <div class="container">

    <div class="section-title">
      <h2>LISTE DES CHEVAUX </h2>
      <p>Voici la liste des chevaux relatifs à cette vente</p>
    </div>

    <div class="row">
         <%
        ArrayList<Lot> lesLots = (ArrayList)request.getAttribute("pLesLots");
        %>
        <table  class="table table-bordered table-striped table-condensed">  
            <thead>
                <tr>             
                    <th>ID CHEVAL</th>
                    <th>NOM</th>
                    <th>TYPE CHEVAL</th>
                    <th>NAISSANCE</th>
                    <th>SEXE</th>
                    <th>PRIX</th>
                    
                    
            <br>
            <br>
                </tr>
            </thead>
            <tbody>
                <tr>
                    
                    <%
                    for(int i = 0; i < lesLots.size();i++)
                    {
                        Lot unLot = lesLots.get(i);

                        out.println("<tr>");
                        
                        out.println("<td>");
                            out.println(unLot.getLeCheval().getId());
                        out.println("</td>");
                        
                        out.println("<td>");
                            out.println(unLot.getLeCheval().getNom());
                        out.println("</td>");
                        
                        out.println("<td>");
                            out.println(unLot.getLeCheval().getLeType().getLibelle());
                        out.println("</td>");

                        out.println("<td>");
                            out.println(unLot.getLeCheval().getDateNaissance());
                        out.println("</td>");
                        
                        out.println("<td>");
                            out.println(unLot.getLeCheval().getSexe());
                        out.println("</td>");
                        
                        out.println("<td>");
                            out.println(unLot.getPrix());
                        out.println("</td>");
                        
                        out.println("</tr>");

                       
                               
                    }
                    %>
                </tr>
            </tbody>
        </table>
    </div>
  </div>
</section>

<%@include file="../components/footer.jsp" %>
