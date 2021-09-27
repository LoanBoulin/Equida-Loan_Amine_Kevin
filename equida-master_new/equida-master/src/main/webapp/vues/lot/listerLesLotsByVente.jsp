<%-- 
    Document   : listerLesCourrielsByVente
    Created on : 20 sept. 2021, 10:14:27
    Author     : loanb
--%>

<%@page import="model.TypeCheval"%>
<%@page import="model.Lot"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@include file="../components/header.jsp" %>


<!-- ======= Portfolio Section ======= -->
    <section id="portfolio" class="portfolio">
      <div class="container">

        <div class="section-title">
          <h2>Nos chevaux</h2>
          <p>Nous proposons les meilleurs chevaux, adaptés à vos besoins, et triés par types.</p>
        </div>

        <div class="row">

          <div class="col-lg-12 d-flex justify-content-center">
            <p>Voir par race : </p>
            <ul id="portfolio-flters">
                
                <%
            ArrayList<TypeCheval> lesTypes = (ArrayList)request.getAttribute("pLesTypes");
                %>
        
              <li data-filter="*" class="filter-active">Voir tout</li>
              
               <%
                    for(int g = 0; g < lesTypes.size();g++)
                    {
                        TypeCheval unType = lesTypes.get(g);
                        
                        String leTypeDuCheval = unType.getLibelle();
                        leTypeDuCheval = leTypeDuCheval.trim().replaceAll(" ", "");
                        leTypeDuCheval = leTypeDuCheval.trim().replaceAll("-", "");
                        
                        out.println("<li data-filter='.filter-"
                                + leTypeDuCheval
                                + "'>");
                        out.println(unType.getLibelle());
                        out.println("</li>");
               }

               %>
               

            </ul>
          </div>
        </div>

        <div class="row portfolio-container">
            
                     <%
        ArrayList<Lot> lesLots = (ArrayList)request.getAttribute("pLesLots");
                %>
        
            <%
                for(int i = 0; i < lesLots.size();i++)
                    {
                        Lot unLot = lesLots.get(i);
                        
                        String leTypeDuCheval =  unLot.getLeCheval().getLeType().getLibelle();
                        leTypeDuCheval = leTypeDuCheval.trim().replaceAll(" ", "");
                        leTypeDuCheval = leTypeDuCheval.trim().replaceAll("-", "");
                        
                        out.println("<div class='col-lg-4 col-md-6 portfolio-item filter-"
                                + leTypeDuCheval
                                + "'>");
                            out.println("<div class='portfolio-wrap'>");
                            

                            if(unLot.getLeCheval().getNomImage() == null){
                                out.println("<img src='../assets/img/portfolio/unknown.jpg' class='img-fluid' alt=''>");
                            } else {
                                out.println("<img src='../assets/img/portfolio/"
                                        + unLot.getLeCheval().getNomImage()
                                        + "' class='img-fluid' alt=''>");
                            }
                                    out.println("<a href ='../ServletCheval/detailCheval?Cheval="+ unLot.getLeCheval().getId()+ "'>");
                                    
                                    out.println("<div class='portfolio-info'>");
                                        out.println("<h4>");
                                        out.println(unLot.getLeCheval().getNom());
                                        out.println("</h4><p>");
                                        out.println(unLot.getLeCheval().getLeType().getLibelle());
                                        out.println("</p><h5 style='color: white'>");
                                        out.println(unLot.getPrix());
                            out.println("€</h5>");
                            
                            out.println("</a>");
                            
                            
                            out.println("<div class='portfolio-links'><a href='assets/img/portfolio/portfolio-1.jpg' data-gallery='portfolioGallery' class='portfolio-lightbox' title='Roberto'><i class='bx bx-plus'></i></a><a href='portfolio-details.html' title='More Details'><i class='bx bx-link'></i></a></div></div></div></div>");
                       
                    }
            
            %>


        </div>

      </div>
    </section><!-- End Portfolio Section -->

<%@include file="../components/footer.jsp" %>
