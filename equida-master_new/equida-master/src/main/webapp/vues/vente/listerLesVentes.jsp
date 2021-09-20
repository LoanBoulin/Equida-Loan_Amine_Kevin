<%-- 
    Document   : listerLesVentes
    Created on : 18 août 2021, 16:52:29
    Author     : Zakina
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Vente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Equida</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="../assets/img/favicon.png" rel="icon">
  <link href="../assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="../assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="../assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="../assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="../assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="../assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Green - v4.3.0
  * Template URL: https://bootstrapmade.com/green-free-one-page-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

  <!-- ======= Top Bar ======= -->
  <section id="topbar" class="d-flex align-items-center">
    <div class="container d-flex justify-content-center justify-content-md-between">
      <div class="contact-info d-flex align-items-center">
        <i class="bi bi-envelope-fill"></i><a href="mailto:contact@example.com">info@example.com</a>
        <i class="bi bi-phone-fill phone-icon"></i> +1 5589 55488 55
      </div>
      <div class="social-links d-none d-md-block">
        <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
        <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
        <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
        <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></i></a>
      </div>
    </div>
  </section>
  
  <!-- ======= Header ======= -->
  <header id="header" class="d-flex align-items-center">
    <div class="container d-flex align-items-center">

      <!--<h1 class="logo me-auto"><a href="index.html">Green</a></h1>-->
      <!-- Uncomment below if you prefer to use an image logo -->
      <a href="../index.html" class="logo me-auto"><img src="../assets/img/logo.png" alt="" class="img-fluid"></a>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto active" href="../accueil.html">Accueil</a></li>
          <li><a class="nav-link scrollto" href="../ServletVente/listerLesVentes">Ventes</a></li>
          <li><a class="nav-link scrollto" href="../chevaux.html">Chevaux</a></li>
          <li><a class="nav-link scrollto " href="../profil.html">Profil</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->
  
  
  
  
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
  
</body>
</html>
