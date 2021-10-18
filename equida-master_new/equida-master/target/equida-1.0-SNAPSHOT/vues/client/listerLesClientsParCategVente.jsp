<%-- 
    Document   : listerLesClientsParCategVente
    Created on : 18 août 2021, 17:52:16
    Author     : Zakina
--%>

<%@page import="model.Client"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../components/header.jsp" %>

 
        <%
        ArrayList<Client> lesClients = (ArrayList)request.getAttribute("pLesClients");
        %>
        
        <!-- ======= Team Section ======= -->
<section id="team" class="team section-bg">
  <div class="container">

    <div class="section-title">
      <h2>LISTE DES CLIENTS INTERESSES </h2>
      <p>Voici la liste des clients intéressés par la vente</p>
    </div>

    <div class="row">
      
      <table  class="table table-bordered table-striped table-condensed">  
        <thead>
            <tr>             
                <th>Id</th>
                <th>Nom</th>
                <th>Prenom</th>
                <th>Pays</th>
                <th>Rue</th>
                <th>Code Postal</th>
                <th>Ville</th>
                <th>Adresse Messagerie</th>
        <br>
        <br>
            </tr>
        </thead>
        <tbody>
        
                <tr>
                    <%
                    for(int i = 0; i < lesClients.size();i++)
                    {
                        Client unClient = lesClients.get(i);
                        out.println("<tr><td>");
                        out.println(unClient.getId());
                        out.println("</a></td>");

                        out.println("<td>");
                        out.println(unClient.getNom());
                        out.println("</td>");

                        out.println("<td>");
                        out.println(unClient.getPrenom());
                        out.println("</td>");

                        out.println("<td>");
                        out.println(unClient.getLePays().getNom());
                        out.println("</td>");
                        
                        out.println("<td>");
                        out.println(unClient.getAdrRue());
                        out.println("</td>");

                        out.println("<td>");
                        out.println(unClient.getCodePostal());
                        out.println("</td>");

                        out.println("<td>");
                        out.println(unClient.getVille());
                        out.println("</td>");
                        
                        out.println("<td>");
                        out.println(unClient.getAdresseMessagerie());
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
