<%-- 
    Document   : listerLesCourrielsByVente
    Created on : 20 sept. 2021, 10:14:27
    Author     : loanb
--%>

<%@page import="model.Enchere"%>
<%@page import="model.Cheval"%>
<%@page import="model.TypeCheval"%>
<%@page import="model.Lot"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@include file="../components/header.jsp" %>


                <%
            Cheval leCheval = (Cheval)request.getAttribute("pLeCheval");
                %>


 <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
                <%
                    out.println("<h2> Informations de : "
                            + leCheval.getNom()
                            + "</h2>");
                %>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li>Détails Cheval</li>
            
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">

        <div class="row gy-4">

          <div class="col-lg-8">
            <div class="portfolio-details-slider swiper-container">
              <div class="swiper-wrapper align-items-center">

                  
                  <%
                    if(leCheval.getNomImage() == null){
                                  out.println("<img src='../assets/img/portfolio/unknown.jpg' alt=''>");
                              } else {
                                  out.println("<img src='../assets/img/portfolio/"
                                          + leCheval.getNomImage()
                                          + "' alt=''>");
                              }

                  %>
                  

              </div>
              <div class="swiper-pagination"></div>
            </div>
          </div>

          <div class="col-lg-4">
            <div class="portfolio-info">
              <h3>Informations supplémentaires</h3>
              <ul>
                <li><strong>Type : </strong>
                    <% out.println(leCheval.getLeType().getLibelle()); %>
                    </li>
                <li><strong>Numéro SIRE : </strong> <% out.println(leCheval.getSire()); %> </li>
                <li><strong>Sexe: </strong><% out.println(leCheval.getSexe()); %></li>
                <li><strong>Date de naissance : </strong><% out.println(leCheval.getDateNaissance()); %></li>
              </ul>
            </div>
              
              
              
              
            <div class="portfolio-info">
              <h3>Parents</h3>
              <ul>
                <li><strong>Père : </strong>
                   
                    <% 

                        if(leCheval.getLePere().getNom() != null){
                            out.println("<a href ='?Cheval="+ leCheval.getLePere().getId()+ "'>");
                            out.println(leCheval.getLePere().getNom());
                            out.println("</a>");
                        }else{
                            out.println("Père inconnu");
                        }
                         

                    
                    
                    %>
                    </li>
                <li><strong>Mère : </strong> <% 
                    
                        if(leCheval.getLaMere().getNom() != null){
                            out.println("<a href ='?Cheval="+ leCheval.getLaMere().getId()+ "'>");
                            out.println(leCheval.getLaMere().getNom());
                            out.println("</a>");
                        }else{
                            out.println("Mère inconnue");
                        }

                
                
              %> </li>
                                              
              </ul>
            </div>
              
              
            <div class="portfolio-description">
                <div class="row">
                    <h2 class="col-8">Enchères récentes</h2>
                    <% out.println("<a class='col-3' href ='../ServletEnchere/listerLesEncheresParCheval?codeChe="+ leCheval.getId()+ "'>Voir plus</a>"); %>
                </div>
             <table  class="table table-bordered table-striped table-condensed">  
            <thead>
                <tr>             
                    <th>Id</th>
                    <th>Client</th>
                    <th>Prix base</th>
                    <th>Montant</th>
                    <th>Vente</th>                   

                </tr>
            </thead>
            <tbody>
              
                    <%
                          ArrayList<Enchere> lesEncheres = (ArrayList)request.getAttribute("plesEncheres");
                        
                    for(int i = 0; i < lesEncheres.size();i++)
                    {
                        Enchere uneEnchere = lesEncheres.get(i);
                        
                        out.println("<tr><td>");
                        out.println(uneEnchere.getId());
                        out.println("</a></td>");

                        out.println("<td><a href ='../ServletClient/consulterClient?codeCli="+ uneEnchere.getLeClient().getId() + "'>");
                        out.println(uneEnchere.getLeClient().getPrenom() + " " + uneEnchere.getLeClient().getNom());
                        out.println("</td>");

                        out.println("<td>");
                        out.println(uneEnchere.getLeLot().getPrix());
                        out.println("€</td>");
                        
                        out.println("<td>");
                        out.println(uneEnchere.getMontant());
                        out.println("€</td>");

                        out.println("<td><a href ='../ServletVente/venteDetail?venId="+ uneEnchere.getLeLot().getLaVente().getId()+ "'>");
                        out.println(uneEnchere.getLeLot().getLaVente().getNom());
                        out.println("</a></td>");
                                              
                               
                    }
                    %>
           
            </tbody>
        </table>
            </div>
          </div>
              
           

        </div>

      </div>
    </section><!-- End Portfolio Details Section -->


<%@include file="../components/footer.jsp" %>
