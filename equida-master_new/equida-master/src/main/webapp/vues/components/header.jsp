<%-- 
    Document   : header
    Created on : 20 sept. 2021, 15:39:51
    Author     : loanb
--%>

<%@page import="model.Compte"%>
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
        <i class="bi bi-envelope-fill"></i><a href="mailto:contact@equida.com">contact@equida.com</a>
        <i class="bi bi-phone-fill phone-icon"></i> 06 06 07 07 09
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
      <a href="/equida" class="logo me-auto"><img src="../assets/img/logo.png" alt="" class="img-fluid"></a>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto" href="/equida">Accueil</a></li>
          <li><a class="nav-link scrollto" href="../ServletVente/listerLesVentes">Ventes</a></li>
          <li><a class="nav-link scrollto" href="../ServletCourse/listerLesCourses">Courses</a></li>
          
          <%
              if(session.getAttribute("login") == null || session.getAttribute("login").equals(false)){
                  
                   out.println("<li><a class='nav-link scrollto ' href='../ServletCompte/connexion'>Se Connecter</a></li>");  
                   session.removeAttribute("login");
                   session.removeAttribute("compte");
                   
              }else{

                Object laVar = session.getAttribute("login");

                    if(laVar.equals(true)){
                        Compte leCompte=(Compte)session.getAttribute("compte");
                      out.println("<li><a class='nav-link scrollto ' href='../ServletCompte/profil?comId=");
                      out.println(leCompte.getId());
                      out.println("'>");              
                      out.println(leCompte.getLogin());
                      out.println(" (");
                      if(leCompte.getLeClient() == null){
                         out.println(leCompte.getLeRole().getNom());
                      }else if(leCompte.getLeRole() == null){
                         out.println("Client"); 
                      }
                      out.println(") ");
                      out.println("</a></li>");
                      //Deconnexion
                      out.println("<li><a class='nav-link' href='../ServletCompte/deconnexion'>Deconnexion</a></li>");
                    }else{
                      //Re-Destruction des attributs 
                      session.removeAttribute("login");
                      session.removeAttribute("compte");
                      out.println("<li><a class='nav-link scrollto ' href='../ServletCompte/connexion'>Se Connecter</a></li>");  
                 
                    }
              }
          %>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->
</body>
</html>
