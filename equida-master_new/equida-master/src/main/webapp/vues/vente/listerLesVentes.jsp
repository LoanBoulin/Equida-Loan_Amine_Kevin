<%-- 
    Document   : listerLesVentes
    Created on : 18 août 2021, 16:52:29
    Author     : Zakina
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Vente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../components/header.jsp" %>
  
  
  
  
  <%
     ArrayList<Vente> lesVentes = (ArrayList)request.getAttribute("pLesVentes");
  %>
  
  
  
  
  
  <!-- ======= Encheres Section ======= -->
    <section id="why-us" class="why-us">
      <div class="container">

        <div class="row no-gutters">
            
             <%
                for(int i = 0; i < lesVentes.size();i++)
                {
                    
                    Vente uneVente = lesVentes.get(i);
                        out.println("<div class='col-lg-4 col-md-6 content-item'><div class='divEnchere'><span>");
                            out.println(uneVente.getCategVente().getLibelle());
                        out.println("</span><p>");
                            out.println(uneVente.getDateDebutVente());
                        out.println("</p><h4 class='enchereDiv'>");
                            out.println(uneVente.getNom());
                        out.println("</h4>");
                        
                        out.println("<a href ='../ServletClient/listerLesClientsParCategVente?codeCat="+ uneVente.getCategVente().getCode()+ "'>");
                        out.println("Voir les clients intéressés");
                        out.println("</a>");
                        out.println("<br/><br/>");
                        out.println("<a href ='../ServletCourriel/listerLesCourrielsByVente?venId="+ uneVente.getId()+ "'>");
                        out.println("Lister les messages");
                        out.println("</a>");
                        
                        out.println("</div></div>");
                       
             }
             %>

          
        </div>

      </div>
    </section><!-- End Encheres Section -->
  
<%@include file="../components/footer.jsp" %>
