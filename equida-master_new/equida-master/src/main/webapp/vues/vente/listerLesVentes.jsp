<%-- 
    Document   : listerLesVentes
    Created on : 18 août 2021, 16:52:29
    Author     : Zakina
--%>

<%@page import="model.CategVente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Vente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../components/header.jsp" %>
  
  
  <%
     ArrayList<Vente> lesVentes = (ArrayList)request.getAttribute("pLesVentes");
     ArrayList<CategVente> lesCategVente = (ArrayList)request.getAttribute("pLesCategVente");
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
                                              
                        //out.println("<a href ='../ServletLot/listerLesLotsByVente?venId="+ uneVente.getId()+ "'>");
                        out.println("<a href ='../ServletVente/venteDetail?venId="+ uneVente.getId() + "'>");
                        out.println("Voir plus");
                        out.println("</a>");
                        
                        out.println("</div></div>");
                       
             }
                
                Compte leCompte=(Compte)session.getAttribute("compte");      
                if(leCompte != null){
                    if(leCompte.getLeClient() != null){
                        out.println("<div class='col-lg-4 col-md-6 content-item'><div class='divEnchere'><span>");
                        out.println("<a href='../ServletVente/listerCategVente");
                            out.println();
                        out.println("'>Voir les différentes catégories de vente</a>");                       
                    }
                }

                                        
             %>

          
        </div>

      </div>
    </section><!-- End Encheres Section -->
  
<%@include file="../components/footer.jsp" %>
