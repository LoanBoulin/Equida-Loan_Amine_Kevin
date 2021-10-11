<%-- 
    Document   : index.jsp
    Created on : 29 sept. 2021, 08:44:13
    Author     : adminsio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../components/header.jsp" %>


<!-- ======= Modal for insertion ======= -->



<% 
    
    if(request.getAttribute("pLeCompte") != null ){ 
    
        String InsertStatus = (String)request.getAttribute("pLeCompte");
        if(InsertStatus.equals("1")){ 
            
            out.println("<br > <div class='container'>"
                    + "<div class='alert alert-success alert-dismissible fade show' role='alert' style='margin=20px'>"
                    + "<p>Le compte a bien été inséré</p>"
                    + "</div></div>");
  
        }else{
            
            out.println("<br > <div class='container'>"
                    + "<div class='alert alert-danger alert-dismissible fade show' role='alert' style='margin=20px'>"
                    + "<p>Erreur dans l'insertion, veuillez rééssayer</p>"
                    + "</div></div>");
            
        }
        
    }
   
%>
       



<!-- End Hero -->

<!-- ======= Hero Section ======= -->
  <section id="hero">
    <div id="heroCarousel" data-bs-interval="5000" class="carousel slide carousel-fade" data-bs-ride="carousel">

      <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

      <div class="carousel-inner" role="listbox">

        <!-- Slide 1 -->
        <div class="carousel-item active" style="background-image: url(../assets/img/slide/slide-1.jpg)">
          <div class="carousel-container">
            <div class="container">
              <h2 class="animate__animated animate__fadeInDown">Bienvenue sur <span>EQUIDA</span></h2>
              <p class="animate__animated animate__fadeInUp">Créée en 2006, Equida est une société spécialisée dans la vente aux enchères de chevaux de course. Avec un effectif de vingt-sept personnes, la société a réalisé en 2012 un chiffre d’affaires de 87 millions d’euros. Ses clients sont des vendeurs de chevaux, principalement des haras, des entraîneurs et de grands propriétaires de chevaux, situés en France et à l’étranger. Pour être plus proche de sa clientèle étrangère, elle s’appuie sur une quinzaine de correspondants répartis dans de nombreux pays comme l’Irlande, la Turquie, ou encore le Japon.</p>
            </div>
          </div>
        </div>

        <!-- Slide 2 -->
        <div class="carousel-item" style="background-image: url(../assets/img/slide/slide-2.jpg)">
          <div class="carousel-container">
            <div class="container">
              <h2 class="animate__animated animate__fadeInDown">L'activité annuelle</h2>
              <p class="animate__animated animate__fadeInUp">Nous mettons à disposition un calendrier annuel. Il vous indique chaque vente programmée en mentionnant le lieu, la catégorie de la vente et les types de chevaux concernés.</p>
              <a href="#about" class="btn-get-started animate__animated animate__fadeInUp scrollto">Plus d'informations</a>
            </div>
          </div>
        </div>

        <!-- Slide 3 -->
        <div class="carousel-item" style="background-image: url(../assets/img/slide/slide-3.jpg)">
          <div class="carousel-container">
            <div class="container">
              <h2 class="animate__animated animate__fadeInDown">Des enchères exceptionnelles</h2>
              <p class="animate__animated animate__fadeInUp">Nous insistons sur la qualité de nos propositions pour vous assurer le meilleur service possible. N'hésitez pas à sélectionner vos préférences pour acquérir LE cheval qui vous correspond.</p>
              <a href="#about" class="btn-get-started animate__animated animate__fadeInUp scrollto">Plus d'informations</a>
            </div>
          </div>
        </div>

      </div>

      <a class="carousel-control-prev" href="#heroCarousel" role="button" data-bs-slide="prev">
        <span class="carousel-control-prev-icon bi bi-chevron-left" aria-hidden="true"></span>
      </a>

      <a class="carousel-control-next" href="#heroCarousel" role="button" data-bs-slide="next">
        <span class="carousel-control-next-icon bi bi-chevron-right" aria-hidden="true"></span>
      </a>

    </div>
  </section><!-- End Hero -->

  <main id="main">

   



    
    
    <% 
        Compte leCompteAcc=(Compte)session.getAttribute("compte");
        
        if(session.getAttribute("login").equals(false)){ %>
            <%@ include file="../components/connexionBanner.jsp"%>
       <% }else{ %>
       <% if(leCompteAcc.getLeRole() != null){ %>
            <%@ include file="../components/proDashboard.jsp"%>
       <% }else{ %>
            <%@ include file="../components/dashboardBanner.jsp"%>
       <% } %>
       <% } %>

    
<%@include file="../components/footer.jsp" %>